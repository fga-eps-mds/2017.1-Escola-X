module SessionsHelper
  def current_user
    @current_user ||= User.find_by_authorization_token!(cookies[:authorization_token]) if cookies[:authorization_token]
  end

  def logged_in?
    if ( current_user.nil? )
      raise 'Not logged in'
    else
      !current_user.nil?
    end
  end

  def is_principal?
    if ( (logged_in?) and (current_user.permission == 'Principal') )
        return true
      else
        raise 'Not principal'
    end
  end

  def is_alumn?
    if ( (logged_in?) and (current_user.permission == 'Alumn') )
        return true
      else
        raise 'Not alumn'
    end
  end

  def is_parent?
    if ( (logged_in?) and (current_user.permission == 'Parent') )
        return true
      else
        raise 'Not parent'
    end
  end

  def is_teacher?
    if ( (logged_in?) and (current_user.permission == 'Teacher') )
        return true
      else
        raise 'Not teacher'
    end
  end
end
