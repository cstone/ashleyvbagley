ActiveAdmin.register Photo do

  index do
    selectable_column
    column :title
    column :allow_comments
    default_actions
  end


  form do |f|
    f.inputs "Photos", :multipart => true do
      f.input :title
      f.input :description
      f.input :allow_comments
      f.input :photo_image, :as => :file, :hint => f.object.photo_image.present? \
    ? f.template.image_tag(f.object.photo_image.url(:thumb))
      : f.template.content_tag(:span, "no photo yet")
      f.input :photo_image_cache, :as => :hidden
      f.input :remove_photo_image, as: :boolean, label: 'Check here to remove the current image.'
    end
    f.actions
  end


  show do |photo|
    attributes_table do
      row :id
      row :title
      row :description do
        simple_format photo.description
      end
      if photo.photo_image.url
        row :photo_image do
          image_tag(photo.photo_image.url)
        end
      end
      row :allow_comments
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

end
