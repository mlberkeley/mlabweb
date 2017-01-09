module MembersHelper

  # Returns the Picture for the given member
  def picture_of(member)
    # path = File.exist?(Rails.root.join('app/assets/images/', pic_path)) ? pic_path : "team/unpictured.jpg"
    path = member.picture? ? member.picture.url : "team/unpictured.jpg"
    image_tag(path, alt: member.name, class: "img-circle team-img")
  end
end
