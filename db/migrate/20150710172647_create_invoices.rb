class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :user, index: true, foreign_key: true
      t.references :customer, index: true, foreign_key: true
      t.date :date
      t.text :description_mo
      t.float :time_mo
    end
  end
end
