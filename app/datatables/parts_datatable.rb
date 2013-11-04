#encoding: utf-8
require 'date'

class PartsDatatable
  delegate :params, :h, :link_to, :edit_admins_part_path, :admins_part_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Part.count,
        iTotalDisplayRecords: parts.total_entries,
        aaData: data
    }
  end

  private

  def data
    parts.map do |part|
      {
          DT_RowId: part.id, 
          name: h(part.name),
          model: h(part.model),
          rating_mileage: h(part.rating_mileage),
          rating_life: h(part.rating_life)
      }
    end
  end

  def parts
    @parts ||= fetch_parts
  end

  def fetch_parts

    parts = fetch_parts_helper(sort_column, sort_direction)
    parts = parts.page(page).per_page(per_page)

    if params[:sSearch].present?

      parts = parts.where("name like :search or model like :search or rating_mileage or rating_life like :search", search: "%#{params[:sSearch]}%")

    end

    parts

  end

  def fetch_parts_helper(sort_column, sort_direction)

    #默认按归来时间排序
    parts = Part.order("model asc")

    if sort_column and sort_column.size
      parts = Part.order("#{sort_column} #{sort_direction}")
    end

    parts

  end


  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name model rating_mileage rating_life]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
