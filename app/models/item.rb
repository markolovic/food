class Item < ActiveRecord::Base
  has_and_belongs_to_many :daily_plans

end
