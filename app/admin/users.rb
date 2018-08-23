ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
 permit_params :name, :mobile_no, :password, :password_confirmation
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
    column :name
    column :email
    column :mobile_no
    column :password
    column :password_confirmation
    actions
  end



  form do |f|
    f.inputs do
      f.input :name
      f.input :mobile_no
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
