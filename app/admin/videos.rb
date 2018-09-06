ActiveAdmin.register Video do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :title, :description, :youtube_url
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
    column :title
    column :description do |video|
      raw video.description.truncate(50)
    end
    column :youtube_url
    actions
  end

  
  form title: 'video' do |f|

    inputs 'video' do
      input :title
      input :description, as: :ckeditor
      input :youtube_url
    end
    f.actions
  end
  config.clear_action_items!
  action_item :only => :index do
    link_to "Add Videos" , "/admin/videos/new" 
  end

end
