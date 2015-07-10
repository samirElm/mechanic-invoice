class Part < ActiveRecord::Base
  has_many :invoiced_parts
end
