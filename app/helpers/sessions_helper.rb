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

  def is_son?(id)

    found = false
    if is_parent?
      @current_user.alumns.each do |alumn|
        if (alumn == Alumn.find_by_id(id))
          found = true
        end
      end
    end

    return found
  end

  def is_related?(id)
    found = false
    if is_alumn?
      parent = @current_user.parent

      if (parent == Parent.find_by_id(id))
        found = true
      end
    end

    return found
  end


  def verify_parent(id)

    found = false
    if current_user == Parent.find_by_id(id)
      found = true
    else
      # nothing to do
    end
    return found
  end



  def verify_alumn(id)

    found = false
    if current_user == Alumn.find_by_id(id)
      found = true
    else
      # nothing to do
    end
    return found
  end

end
