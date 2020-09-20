ActiveAdmin.register Customer do
  permit_params :name, :fathers_name, :dob, :mobile, :email, :address
  menu priority: 5

  index do
    selectable_column
    id_column
    column :name
    column :fathers_name
    column :dob
    column :mobile
    column :email
    column :address
    column :created_at
    actions
  end

  filter :name
  filter :fathers_name
  filter :mobile
  filter :email
  filter :dob
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :fathers_name
      f.input :mobile
      f.input :email
      f.input :dob, as: :datepicker
      f.input :address, :as => :text
    end
    f.actions
  end

end
