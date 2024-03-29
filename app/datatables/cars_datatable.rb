#encoding: utf-8
require 'date'

class CarsDatatable
  delegate :params, :h, :link_to, :edit_admins_car_path, :admins_car_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Car.count,
        iTotalDisplayRecords: cars.total_entries,
        aaData: data
    }
  end

  private

  def data

    cars.map do |car|
      {
          DT_RowId: car.id, #行id
          model: h(car.model),
          plate: h(car.plate),
          load_limit: h(car.load_limit),
          # age: h(((Date.today.mjd.to_f - car.age.mjd)/365).round(1))
          age: h(car.age)
      }
    end
  end

  def cars
    @cars ||= fetch_cars
  end

  def fetch_cars

    cars = fetch_cars_helper(sort_column, sort_direction)
    cars = cars.page(page).per_page(per_page)

    if params[:sSearch].present?

      cars = cars.where("model like :search or plate like :search or load_limit or age like :search", search: "%#{params[:sSearch]}%")

    end

    cars

  end

  def fetch_cars_helper(sort_column, sort_direction)

    #默认按归来时间排序
    cars = Car.order("model asc")

    if sort_column and sort_column.size > 0
      cars = Car.order("#{sort_column} #{sort_direction}")
    end

    cars

  end


  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[model plate load_limit age]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
