class Comment < ActiveRecord::Base
  attr_accessible :content

  belongs_to :user
  belongs_to :task

  validates :content, :presence => true
  validates :user_id, :presence => true
  validates :task_id, :presence => true

end

# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  user_id    :integer
#  task_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

