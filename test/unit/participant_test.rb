require 'test_helper'

class ParticipantTest < ActiveSupport::TestCase

  setup do
    @event = Event.new
    @event.maximum_participant = 5
    @event.save
  end

  test "participant can have one user" do
    user = User.new
    user.email = "test@test.de"
    user.login = "foo"
    user.password = "abcd"
    user.password_confirmation = "abcd"
    user.first_name = "daniel"
    user.second_name = "seifarth"
    user.city = "Leipzig"
    user.birthday = Date.new(1981,2,22)
    user.save

    participant = Participant.new
    participant.user = user
    participant.self_registration = true
    participant.event = @event
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
    participant.self_registration = true
    participant.event = @event
    participant.save

    assert_equal participant.csv_line, ["1", "Seifarth", "Daniel", "Leipzig", "männlich", "32", "true"]
  end

  test "create one participan with and write it down as row with all attributes" do
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
    participant.self_registration = false
    participant.first_name= "Klaus"
    participant.second_name= "Günther"
    participant.city= "Leipzig"
    participant.male = true
    participant.birthday= Date.parse('01-01-1981')
    participant.event = @event
    participant.save

    assert_equal participant.csv_line, ["1", "Günther", "Klaus", "Leipzig", "männlich", "32", "true"]
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
    participant.self_registration = true
    participant.event = @event
    participant.save

    user = User.new
    user.email = "test2@test.de"
    user.login = "foo2"
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
    participant.self_registration = true
    participant.event = @event
    participant.save

    result = Participant.to_csv
    assert_equal result, "1,Seifarth,Daniel,Leipzig,männlich,32,true\n2,Seifarth,Daniel,Leipzig,männlich,32,true\n"
  end

end
