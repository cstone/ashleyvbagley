ActiveAdmin.register DynamicContent do

  index do
    selectable_column
    column :title
    column :key
    column :value
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :key
      f.input :value
    end
    f.actions
  end

  filter :title
  filter :key
  filter :value
  filter :created_at
  filter :updated_at

  show do |dynamiccontent|
    attributes_table do
      row :id
      row :title
      row :key
      row :value do
        simple_format dynamiccontent.value
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

end