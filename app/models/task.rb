class Task < ActiveRecord::Base

  validates :name, :presence => true

  has_and_belongs_to_many :users
  has_and_belongs_to_many :categories

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
