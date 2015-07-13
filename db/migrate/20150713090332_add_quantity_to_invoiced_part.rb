class AddQuantityToInvoicedPart < ActiveRecord::Migration
  def change
    add_column :invoiced_parts, :quantity, :integer
  end
end
