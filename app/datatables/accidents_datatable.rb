#encoding: utf-8
require 'date'
class AccidentsDatatable
  delegate :params, :h, :link_to, :edit_admins_accident_path, :admins_accident_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Accident.count,
        iTotalDisplayRecords: accidents.total_entries,
        aaData: data
    }
  end

  private

  def data
    accidents.map do |accident|
      [

          h(accident.driver.name),
          h(accident.car.plate),
          h(accident.location),
          h(accident.a_date),
          h(accident.responsible),
          h(accident.damage),
          h(accident.casualties),
          link_to('<i class="icon-edit"></i>'.html_safe, edit_admins_accident_path(accident))+
              link_to('<i class="icon-remove"></i>'.html_safe, admins_accident_path(accident),
                      :confirm => "确定要删除这条事故记录吗？", :method => :delete)
      ]
    end
  end

  def accidents
    @accidents ||= fetch_accidents
  end

  def fetch_accidents

    accidents = fetch_accidents_helper(sort_column, sort_direction)
    accidents = accidents.page(page).per_page(per_page)

    if params[:sSearch].present?
      accidents = accidents.where("
        users.name like :search or
        cars.plate like :search or
        location like :search or
        a_date like :search or
        responsible like :search or
        damage like :search or
        casualties like :search", search: "%#{params[:sSearch]}%")
    end

    accidents

  end

  def fetch_accidents_helper(sort_column, sort_direction)

    #默认按归来时间排序
    accidents = Accident.includes(:driver, :car).order("a_date desc")

    case sort_column

      when "location", "a_date", "responsible", "damage", "casualties"
        accidents = Accident.includes(:driver, :car).order("#{sort_column} #{sort_direction}")
      when "plate"
        accidents = Accident.includes(:driver, :car).order("cars.plate #{sort_direction}")
      when "driver"
        accidents = Accident.includes(:driver, :car).order("users.name #{sort_direction}")

    end

    accidents

  end


  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[plate driver workers driver departure_time back_time car]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
