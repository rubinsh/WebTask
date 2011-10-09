require 'test_helper'

class CategorizationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
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

