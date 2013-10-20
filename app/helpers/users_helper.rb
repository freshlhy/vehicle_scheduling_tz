module UsersHelper

  def user_root
    if current_user.is_a? Admin
      return '/admins/trips'
    elsif current_user.is_a? Driver
      return '/drivers/start'
    elsif current_user.is_a? Worker
      return '/workers/start'
    else
      return '/'
    end
  end

end
