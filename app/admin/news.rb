ActiveAdmin.register News do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :image, :description, :title, :created_at, :category_id
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
    column :category
    column :title
    column :description do |news|
      raw news.description.truncate(50)
    end
    column :created_at
    column :image do |news|
      image_tag(news.image)
    end
    actions
  end

  show do
    panel "News Details" do
      attributes_table_for news do
        row :image do |news|
          image_tag(news.image)
        end  
        row :title
        row :description
        row :created_at
      end
    end
    active_admin_comments
  end

  form title: 'News' do |f|

    inputs 'News' do
      input :title
      input :description, as: :ckeditor
      input :image, as: :file
      input :category, :label => 'Category', :as => :select, include_blank: false
    end
    f.actions
  end
  config.clear_action_items!
  action_item :only => :index do
    link_to "Add News" , "/admin/news/new" 
  end
end
