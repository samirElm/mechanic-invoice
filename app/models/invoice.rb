class Invoice < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer
end
