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
  belongs_to :user
  has_many :tasks, :through => :categorizations
  has_many :categorizations
end
