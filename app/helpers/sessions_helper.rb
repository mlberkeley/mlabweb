module SessionsHelper

  #Logs in the given member
  def log_in(member)
    session[:member_id] = member.id
  end

  #Remembers member in persistent session
  def remember(member)
    member.remember
    cookies.permanent.signed[:member_id] = member.id
    cookies.permanent[:remember_token] = member.remember_token
  end

  #Boolean for current member
  def current_member?(member)
    member == current_member
  end

  #Returns currently logged-in member
  def current_member
    if (member_id = session[:member_id])
      @current_member ||= Member.find_by(id: member_id)
    elsif (member_id = cookies.signed[:member_id])
      member = Member.find_by(id: member_id)
      if member && member.authenticated?(cookies[:remember_token])
        log_in member
        @current_member = member
      end
    end
  end

  #Returns true if a member is logged in
  def logged_in?
    !current_member.nil?
  end

  #Forgets the persistent session
  def forget(member)
    member.forget
    cookies.delete(:member_id)
    cookies.delete(:remember_token)
  end

  #Logs out the current member
  def log_out
    forget(current_member)
    session.delete(:member_id)
    @current_member = nil
  end

  #Redirect to stored loc
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  #Store URL trying to be accessed
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
