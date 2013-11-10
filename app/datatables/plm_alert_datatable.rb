#encoding: utf-8
require 'date'
class PlmAlertDatatable
  delegate :params, :h, :link_to, :edit_admins_plm_path, :admins_plm_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Plm.where("nextd <= ?", Date.today.next_day(7)).count,
        iTotalDisplayRecords: plms.total_entries,
        aaData: data
    }
  end

  private

  def data
    plms.map do |plm|
      [
          h(plm.car.model_plate),
          h(plm.plm_type),
          h(plm.value),
          h(plm.start),
          h(plm.last),
          h(plm.nextd),
          h(plm.is_active),
          link_to('<i class="icon-edit"></i>'.html_safe, edit_admins_plm_path(plm))+
              link_to('<i class="icon-remove"></i>'.html_safe, admins_plm_path(plm),
                      :confirm => "确定要删除这个车辆维护工作吗？", :method => :delete)
      ]
    end
  end

  def plms
    @plms ||= fetch_plms
  end

  def fetch_plms

    plms = fetch_plms_helper(sort_column, sort_direction)
    plms = plms.page(page).per_page(per_page)

    if params[:sSearch].present?
      plms = plms.where("
        cars.plate like :search or
        plm_type like :search or
        value like :search or
        start like :search or
        last like :search or
        nextd like :search or
        is_active like :search", search: "%#{params[:sSearch]}%")
    end

    plms

  end

  def fetch_plms_helper(sort_column, sort_direction)

    #默认按归来时间排序
    plms = Plm.includes(:car).where("nextd <= ?", Date.today.next_day(7)).order("nextd desc")

    case sort_column

      when "plate"
        plms = Plm.includes(:car).where("nextd <= ?", Date.today.next_day(7)).order("cars.plate #{sort_direction}")
      else
        plms = Plm.includes(:car).where("nextd <= ?", Date.today.next_day(7)).order("#{sort_column} #{sort_direction}")
    end

    plms

  end


  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[plate plm_type value start last nextd is_active]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
