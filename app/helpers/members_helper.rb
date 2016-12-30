module MembersHelper

  # Returns the Picture for the given member
  def picture_of(member)
    pic_path = "team/#{member.name.downcase}.jpg"
    path = File.exist?(Rails.root.join('app/assets/images/', pic_path)) ? pic_path : "team/unpictured.jpg"
    image_tag(path, alt: member.name, class: "img-circle team-img")
  end
end
