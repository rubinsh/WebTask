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
  has_and_belongs_to_many :tasks
  belongs_to :user, :counter_cache => true
end
