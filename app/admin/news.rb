ActiveAdmin.register News do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :image, :description, :title, :date, :category_id
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  index do
    column :category
    column :title
    column :description do |news|
      truncate(news.description, length: 50)
    end
    column :date
    column :image

    actions
  end



  form title: 'A custom title' do |f|
    inputs 'News' do
      input :title
      input :description
      input :date
      input :image, as: :file
      input :category, :label => 'Category', :as => :select
    end
    f.actions
  end
end
