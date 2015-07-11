class AddRefToInvoicedPart < ActiveRecord::Migration
  def change
    add_column :invoiced_parts, :ref, :string
  end
end
