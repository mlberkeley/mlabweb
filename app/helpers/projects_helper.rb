module ProjectsHelper

  # Returns the Picture for the given project
  def picture_of_project(project, options = { class: "" })
    # pic_path = "portfolio/#{project.name.downcase}.png"
    # path = File.exist?(Rails.root.join('app/assets/images/', pic_path)) ? pic_path : "portfolio/unpictured.png"
    path = project.picture? ? project.picture.url : "portfolio/unpictured.png"
    image_tag(path, alt: project.name, class: options[:class])
  end
end
