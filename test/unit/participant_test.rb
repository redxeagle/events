require 'test_helper'

class ParticipantTest < ActiveSupport::TestCase
  test "participant can have one user" do
    user = User.new
    user.save

    participant = Participant.new
    participant.save

    participant.user = user
  end
end
