ActiveAdmin.register Page do
  controller do
    defaults :finder => :find_by_permalink
  end

  index do
    selectable_column
    column :title
    column :permalink
    default_actions
  end


  form do |f|
    f.inputs "Pages", :multipart => true do
      f.input :title
      f.input :permalink
      f.input :content
      f.input :page_image, :as => :file, :hint => f.object.page_image.present? \
    ? f.template.image_tag(f.object.page_image.url(:thumb))
      : f.template.content_tag(:span, "no photo yet")
      f.input :page_image_cache, :as => :hidden
      f.input :remove_page_image, as: :boolean, label: 'Check here to remove the current image.'

    end
    f.actions
  end


  show do |page|
    attributes_table do
      row :id
      row :title
      row :permalink
      row :content do
        simple_format page.content
      end
      if page.page_image
        row :page_image do
          image_tag(page.page_image.url)
        end
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
