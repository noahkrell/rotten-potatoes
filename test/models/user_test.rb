# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  name          :string           not null
#  email         :string           not null
#  password_hash :string           not null
#  username      :string           not null
#  critic        :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
