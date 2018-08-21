ActiveAdmin.register Category do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :name
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# en
  index download_links: [:csv] do
    selectable_column
    column :id
    column :name
    actions
  end
    config.clear_action_items!
    action_item :only => :index do
      link_to "Add Category" , "/admin/categories/new" 
    end
end
