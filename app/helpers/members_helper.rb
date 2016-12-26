module MembersHelper

  # Returns the Picture for the given member
  def picture_of(member)
    pic_path = "team/#{member.name.downcase}.jpg"
    File.exist?(Rails.root.join('app/assets/images/', pic_path)) ? path = pic_path : path = "team/unpictured.jpg"
    image_tag(path, alt: "Member Picture", class: "img-circle team-img")
  end
end
