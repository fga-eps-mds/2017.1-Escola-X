# File name: sessions_helpers.rb
# Module name: SessionsHelper
# Description: Helper used to help in some authentication functions
module SessionsHelper
  def current_user
    if ( !@current_user.nil? )
      @current_user = @current_user
    else
      if ( !(@current_user = Employee.find_by_authorization_token(cookies[:authorization_token])).nil? )
        return @current_user
      elsif ( !(@current_user = Parent.find_by_authorization_token(cookies[:authorization_token])).nil? )
          return @current_user
      elsif ( !(@current_user = Alumn.find_by_authorization_token(cookies[:authorization_token])).nil? )
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
      !(current_user.nil?)
    end
  end

  def is_principal?
    if ( (logged_in?) and (current_user.is_a?(Principal)) )
      return true
    else
      # raise 'Not principal'
      return false
    end
  end

  def is_alumn?
    if ( (logged_in?) and (current_user.is_a?(Alumn)) )
      return true
    else
      # raise 'Not alumn'
      return false
    end
  end

  def current_user_alumn(id)
    alumn = Alumn.find(id)
    if ( (is_alumn?) and (current_user ==  alumn ))
      return true
    else
      # raise 'Not allowed'
      return false
    end
  end

  def is_parent?
    if ( (logged_in?) and (current_user.is_a?(Parent)))
      return true
    else
      # raise 'Not parent'
      return false
    end
  end

  def is_teacher?
    if ( (logged_in?) and (current_user.is_a?(Teacher)))
      return true
    else
      # raise 'Not teacher'
      return false
    end
  end

  def is_secretary?
    if ( (logged_in?) and (current_user.is_a?(Secretary)))
      return true
    else
      return false
    end
  end

  def is_employee?
    return ( is_principal? or is_secretary? or is_teacher? )
  end

  def is_parent_related_to_alumn?(alumn)
    if ( alumn.parent_id == current_user.id and current_user.is_a?(Parent))
      return true
    else
      return false
    end
  end

  def is_me?(alumn)
    if ( alumn.id == current_user.id and current_user.is_a?(Alumn))
      return true
    else
      return false
    end
  end
end
