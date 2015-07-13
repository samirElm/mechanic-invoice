class AddDiscountProviderToinvoicedPart < ActiveRecord::Migration
  def change
    add_column :invoiced_parts, :discount_provider, :integer
  end
end
