#encoding: utf-8
class GroupsDatatable
  delegate :params, :h, :link_to, :edit_admins_group_path, :admins_group_path, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Group.count,
        iTotalDisplayRecords: groups.total_entries,
        aaData: data
    }
  end

  private

  def data
    groups.map do |group|
      {
          DT_RowId: group.id, #行id
          name: h(group.name),
          size: h(group.workers.size)
      }
    end
  end

  def groups
    @groups ||= fetch_groups
  end

  def fetch_groups

    groups = fetch_groups_helper(sort_column, sort_direction)
    groups = groups.page(page).per_page(per_page)

    if params[:sSearch].present?
      groups = groups.where("name like :search", search: "%#{params[:sSearch]}%")
    end

    groups

  end

  def fetch_groups_helper(sort_column, sort_direction)

    #默认按名称排序
    groups = Group.order("name asc")

    if sort_column and sort_column.size
      groups = Group.order("#{sort_column} #{sort_direction}")
    end

    groups

  end


  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end