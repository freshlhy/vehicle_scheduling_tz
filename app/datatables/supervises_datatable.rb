#encoding: utf-8
require 'date'
class SupervisesDatatable
  delegate :params, :h, :link_to, :edit_admins_supervise_path, :admins_supervise_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Supervise.count,
        iTotalDisplayRecords: supervises.total_entries,
        aaData: data
    }
  end

  private

  def data
    supervises.map do |supervise|
      [

          h(supervise.part.name_model),
          h(supervise.car.model_plate),
          h(supervise.start),
          h(supervise.mileage_status),
          h(supervise.life_status),
          h(supervise.is_active),
          link_to('<i class="icon-edit"></i>'.html_safe, edit_admins_supervise_path(supervise))+
              link_to('<i class="icon-remove"></i>'.html_safe, admins_supervise_path(supervise),
                      :confirm => "确定要删除这条监督记录吗？", :method => :delete)
      ]
    end
  end

  def supervises
    @supervises ||= fetch_supervises
  end

  def fetch_supervises

    supervises = fetch_supervises_helper(sort_column, sort_direction)
    supervises = supervises.page(page).per_page(per_page)

    if params[:sSearch].present?
      supervises = supervises.where("
        parts.name like :search or
        cars.plate like :search or
        start like :search or
        mileage_status like :search or
        life_status like :search or
        is_active like :search", search: "%#{params[:sSearch]}%")
    end

    supervises

  end

  def fetch_supervises_helper(sort_column, sort_direction)

    #默认按归来时间排序
    supervises = Supervise.includes(:part, :car).order("start desc")

    case sort_column

      when "start", "is_active"
        supervises = Supervise.includes(:part, :car).order("#{sort_column} #{sort_direction}")
      when "mileage_status"
        supervises = Supervise.includes(:part, :car).order("mileage_status_value #{sort_direction}")
      when "life_status"
        supervises = Supervise.includes(:part, :car).order("life_status_value #{sort_direction}")
      when "part"
        supervises = Supervise.includes(:part, :car).order("parts.name #{sort_direction}")
      when "car"
        supervises = Supervise.includes(:part, :car).order("cars.plate #{sort_direction}")

    end

    supervises

  end


  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[part car start mileage_status life_status is_active]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
