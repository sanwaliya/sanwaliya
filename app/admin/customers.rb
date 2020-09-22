ActiveAdmin.register Customer do
  permit_params :name, :fathers_name, :dob, :mobile, :email, :address, images_attributes: [ :imageable_type, :file, :imageable_id]
  menu priority: 5

  index do
    selectable_column
    id_column
    column :image  do |customer|
        image_tag customer.images.last.file.url
      end
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
      f.inputs 'Customer Image' do
        f.input(:file, as: :file )  
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :image  do |customer|
        image_tag customer.images.last.file.url
      end
    end
  end

  controller do

    def create
      super do
        if resource.valid?
          resource.images.create(file: params[:customer][:file])
          flash[:notice] = ('Product create successes')
          redirect_to admin_customers_url and return
        end
      end
    end

    def update
      super do
        if resource.valid?
          resource.images.destroy_all if resource.images.present?
          resource.images.create(file: params[:customer][:file])
          flash[:notice] = ('Product update successes')
          redirect_to admin_customers_url and return
        end
      end
    end
  end

end
