class CreateInvoicedParts < ActiveRecord::Migration
  def change
    create_table :invoiced_parts do |t|
      t.references :invoice, index: true, foreign_key: true
      t.references :part, index: true, foreign_key: true
    end
  end
end
