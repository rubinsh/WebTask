require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: tasks
#
#  id          :integer         not null, primary key
#  created_at  :datetime
#  updated_at  :datetime
#  description :text(255)
#  completed   :boolean         default(FALSE)
#  due_date    :date
#  name        :string(255)
#  owner_id    :integer
#

