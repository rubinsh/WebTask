class Category < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, :through => :categorizations
  has_many :categorizations, :dependent => :destroy

end

# == Schema Information
#
# Table name: categories
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  color      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

