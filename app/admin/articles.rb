ActiveAdmin.register Article do


  form do |f|
    f.inputs "Articles", :multipart => true do
      f.input :title
      f.input :body, as: :html_editor
      f.input :allow_comments
      f.input :article_image, :as => :file, :hint => f.object.article_image.present? \
    ? f.template.image_tag(f.object.article_image.url(:thumb))
      : f.template.content_tag(:span, "no photo yet")
      f.input :article_image_cache, :as => :hidden
    end
    f.inputs "Remove Current Image" do
      f.input :remove_article_image, as: :boolean, label: 'Check here to remove the current image.'
    end
    f.actions
  end



  index do
    selectable_column
    column :title
    column :allow_comments
    default_actions
  end

  filter :title
  filter :body
  filter :allow_comments


  show do |article|
    attributes_table do
      row :id
      row :title
      row :body do
        simple_format article.body
      end
      row :allow_comments
      if article.article_image.url
        row :article_image do
          image_tag(article.article_image.url(:thumb))
        end
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

end
