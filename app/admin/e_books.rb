ActiveAdmin.register EBook do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :description, :cover_image, :preview_file, :main_file
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

 index download_links: [:csv] do
    selectable_column
    column :id
    column :title
    column :description do |e_book|
      raw e_book.description.truncate(50)
    end
    column :created_at
    column :cover_image do |e_book|
      image_tag(e_book.cover_image)
    end
    column :preview_file
    column :main_file
    actions
  end

  show do
    panel "E_Book Details" do
      attributes_table_for e_book do
        row :cover_image do |e_book|
          image_tag(e_book.cover_image)
        end  
        row :title
        row :description
        row :preview_file
        row :main_file
        row :created_at
      end
    end
    active_admin_comments
  end

  form title: 'E_Book' do |f|

    inputs 'E_Book' do
      input :title
      input :description, as: :ckeditor
      input :cover_image, as: :file
      input :preview_file, as: :file
      input :main_file, as: :file
    end
    f.actions
  end
  config.clear_action_items!
  action_item :only => :index do
    link_to "Add E_Book" , "/admin/e_books/new" 
  end

end
