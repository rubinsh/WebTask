class Task < ActiveRecord::Base

  validates :name, :presence => true

  belongs_to :owner, :class_name => "User"
  has_many :categories, :through => :categorizations
  has_many :categorizations, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  scope :completed, lambda { |completed|
    if (completed == "true" || completed == "false")
      where(:completed => completed == "true" ? true : false)
    end
    #else we return all the tasks of the user
  }

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


# == Schema Information
#
# Table name: tasks
#
#  id          :integer         not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  description :text
#  completed   :boolean         default(FALSE)
#  due_date    :date
#  name        :string(255)
#  owner_id    :integer
#

