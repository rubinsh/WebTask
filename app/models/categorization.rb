class Categorization < ActiveRecord::Base
  belongs_to :task
  belongs_to :category

end

# == Schema Information
#
# Table name: categorizations
#
#  id          :integer         not null, primary key
#  category_id :integer
#  task_id     :integer
#  position    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

