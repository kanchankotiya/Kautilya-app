ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation

  index download_links: [:csv] do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    column :actions do |resource|
      links = link_to I18n.t('active_admin.view'), resource_path(resource)
    end
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
