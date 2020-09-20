ActiveAdmin.register Product do

  permit_params :name, :category_id, :measure, :weight, :price
  menu priority: 4

  form do |f|
    f.inputs do
      f.input :name
      f.input :category_id, as: :searchable_select, collection: Category.all.map { |u| [u.name, u.id] }, include_blank: true
      f.input :measure, as: :searchable_select, collection: ["Gram", "KG", "ML", "Liter"] 
      f.input :weight
      f.input :price
    end
    f.actions do
      f.action :submit
    end
  end

  filter :name
  filter :category_id, as: :searchable_select, collection: Category.all.map { |u| [u.name, u.id] }
  filter :measure, as: :searchable_select, collection: ["Gram", "KG", "ML", "Liter"] 
  filter :weight
  filter :price
  filter :created_at

  index do
    selectable_column
    id_column
    column :name
    column :category
    column :weight do |product|
      "#{product.weight} #{product.measure}"
    end
    column :price
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :category
      row :weight do |product|
        "#{product.weight} #{product.measure}"
      end
      row :price
      row :created_at
    end
  end
end
