module SessionsHelper
  def current_user
    if !@current_user.nil?
      @current_user = @current_user
    else
      if ( !(@current_user = User.find_by_authorization_token(cookies[:authorization_token])).nil? )
        return @current_user
      elsif ( !(@current_user = Employee.find_by_authorization_token(cookies[:authorization_token])).nil? )
        return @current_user
      else
        @current_user = nil
    end
end
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
      # raise 'Not principal'
      return false
    end
  end

  def is_alumn?
    if ( (logged_in?) and (current_user.permission == 'Alumn') )
      return true
    else
      # raise 'Not alumn'
      return false
    end
  end

  def is_parent?
    if ( (logged_in?) and (current_user.permission == 'Parent') )
      return true
    else
      # raise 'Not parent'
      return false
    end
  end

  # def is_teacher?
  #   if ( (logged_in?) and (current_user.permission == 'Teacher') )
  #     return true
  #   else
  #     # raise 'Not teacher'
  #     return false
  #   end
  # end
end
