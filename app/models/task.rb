# == Schema Information
# Schema version: 20110316130329
#
# Table name: tasks
#
#  id          :integer         not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  description :text(255)
#  completed   :boolean
#  due_date    :date
#  name        :string(255)
#

class Task < ActiveRecord::Base

  validates :name, :presence => true

  after_destroy :delete_from_join_model

  has_many :user_category_tasks
  has_many :users, :through => :user_category_tasks, :uniq => true
  has_many :categories, :through => :user_category_tasks, :uniq => true
#  has_and_belongs_to_many :users
#  has_and_belongs_to_many :categories


  #destroy JoinModel objects when the task is deleted
  def delete_from_join_model
    UserCategoryTask.delete_all(["task_id=?",self.id])
  end

  def overdue?
    due_date < DateTime::now
  end

  def toggle_complete!
    update_attribute(:completed, !self.completed)
  end

  def owned_by?(user)
    not self.users.select {|usr| usr.email == user.email }.empty?
  end
  
end
