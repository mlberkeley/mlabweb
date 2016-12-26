module SessionsHelper

  #Logs in the given member
  def log_in(member)
    session[:member_id] = member.id
  end

  #Returns currently logged-in member
  def current_member
    @current_member ||= Member.find_by(id: session[:member_id])
  end

  #Returns true if a member is logged in
  def logged_in?
    !current_member.nil?
  end

  #Logs out the current member
  def log_out
    session.delete(:member_id)
    @current_member = nil
  end
end
