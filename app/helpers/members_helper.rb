module MembersHelper

  # Returns the Picture for the given member
  def picture_of(member)
    # path = File.exist?(Rails.root.join('app/assets/images/', pic_path)) ? pic_path : "team/unpictured.jpg"
    path = member.picture? ? member.picture.url : "team/unpictured.jpg"
    image_tag(path, alt: member.full_name, class: "img-circle team-img")
  end

  # Helpers for Hierarchical Permissions
  def admin?
    current_member.admin?
  end

  def exec_or_higher?
    current_member.exec? or admin?
  end

  def officer_or_higher?
    current_member.officer? or exec_or_higher?
  end
end
