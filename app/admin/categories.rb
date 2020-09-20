ActiveAdmin.register Category do

  permit_params :name
  menu priority: 3

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions do
      f.action :submit
    end
  end

  filter :name
  filter :created_at

  index do
    selectable_column
    id_column
    column :name
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :created_at
    end
  end
end
