# == Schema Information
# Schema version: 20110219192345
#
# Table name: categories
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  color      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Category < ActiveRecord::Base
  has_many :user_category_tasks
  has_many :tasks, :through => :user_category_tasks
end
