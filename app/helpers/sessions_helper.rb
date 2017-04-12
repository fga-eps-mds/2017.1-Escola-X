module SessionsHelper
  def current_user
    @current_user ||= User.find_by_authorization_token!(cookies[:authorization_token]) if cookies[:authorization_token]
  end

  def logged_in?
    if current_user.nil?
      raise 'Not logged in'
    else
      !current_user.nil?
    end
  end

  def is_principal?
    if logged_in?
      current_user.permission == 'Principal'
    end
  end

  def is_alumn?
    if logged_in?
      current_user.permission == 'Alumn'
    end
  end

  def is_parent?
    if logged_in?
      current_user.permission == 'Parent'
    end
  end

  def is_teacher?
    if logged_in?
      current_user.permission == 'Teacher'
    end
  end
end
