ActiveAdmin.register Event do

  index do
    selectable_column
    column :title
    column :time do |model|
      model.time.to_formatted_s(:my_format)
    end
    actions
  end


  form do |f|
    f.inputs do
      f.input :title
      f.input :description, :as => :ckeditor, :input_html => { :ckeditor => { :height => 400 } }
      f.input :venue
      f.input :address
      f.input :city
      f.input :state
      f.input :zip
      f.input :url
      f.input :time
    end
    f.actions
  end


  show do |event|
    attributes_table do
      row :id
      row :title
      row :description do
        event.description.html_safe
      end
      row :venue
      row :address
      row :city
      row :state
      row :zip
      row :url
      row :time do
        event.time.to_formatted_s(:date_time)
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
