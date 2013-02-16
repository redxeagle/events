require 'test_helper'

class ParticipantTest < ActiveSupport::TestCase

  test "create single participant" do
    participant = Participant.new
    assert participant.save
  end

  test "participant can have one user" do
    user = User.new
    user.email = "test@test.de"
    user.login = "foo"
    user.password = "abcd"
    user.password_confirmation = "abcd"
    user.save

    participant = Participant.new
    participant.user = user
    participant.save

    assert_equal participant.user, user
    assert_equal participant.user_id, 1
  end

  test "create one participan and write it down as row with all attributes" do
    user = User.new
    user.email = "test@test.de"
    user.login = "foo"
    user.password = "abcd"
    user.password_confirmation = "abcd"
    user.first_name = "Daniel"
    user.second_name = "Seifarth"
    user.city = "Leipzig"
    user.male = true
    user.birthday = Date.parse('22-02-1981')

    user.save

    participant = Participant.new
    participant.user = user
    participant.power= true
    participant.save


    assert_equal participant.csv_line, ["1", "Seifarth", "Daniel", "Leipzig", "männlich", "31", "true"]
  end

  test "can extract all participants as csv" do
    user = User.new
    user.email = "test@test.de"
    user.login = "foo"
    user.password = "abcd"
    user.password_confirmation = "abcd"
    user.first_name = "Daniel"
    user.second_name = "Seifarth"
    user.city = "Leipzig"
    user.male = true
    user.birthday = Date.parse('22-02-1981')

    user.save

    participant = Participant.new
    participant.user = user
    participant.power= true
    participant.save

    result = Participant.to_csv
    assert_equal result, "f"
  end

end
