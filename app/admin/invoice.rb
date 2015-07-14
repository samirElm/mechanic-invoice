ActiveAdmin.register Invoice do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

# permit_params :first_name, :last_name, :address, :phone, :siret, :email, :price_mo, :mobile_phone, :company

index do
  selectable_column
  column :id
  column :customer_id
  column :user_id
  column :total_price
  actions
end


end
