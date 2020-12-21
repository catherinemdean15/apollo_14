require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'methods' do
    it 'average age' do
      @astronaut1 = Astronaut.create(name:"Neil Armstrong", age: 30, job:"Pilot")
      @astronaut2 = Astronaut.create(name:"Buzz Aldrin", age: 20, job:"Commander")
      @astronaut3 = Astronaut.create(name:"Sally Ride", age: 25, job:"Command Module")

      expect(Astronaut.average_age).to eq(25)
    end
  end

  it 'alphabetical_missions' do
    @astronaut1 = Astronaut.create(name:"Neil Armstrong", age: 30, job:"Pilot")

    @mission1 = Mission.create(title:"Apollo 13", time_in_space: 4)
    @mission2 = Mission.create(title:"Capricorn 4", time_in_space: 5)
    @mission3 = Mission.create(title:"Gemini 7", time_in_space: 6)

    AstronautMission.create(astronaut_id: @astronaut1.id, mission_id: @mission1.id)
    AstronautMission.create(astronaut_id: @astronaut1.id, mission_id: @mission2.id)
    AstronautMission.create(astronaut_id: @astronaut1.id, mission_id: @mission3.id)

    expect(@astronaut1.alphabetical_missions).to eq([@mission1, @mission2, @mission3])

  end

  it "time_in_space" do
    @astronaut1 = Astronaut.create(name:"Neil Armstrong", age: 30, job:"Pilot")

    @mission1 = Mission.create(title:"Apollo 13", time_in_space: 4)
    @mission2 = Mission.create(title:"Capricorn 4", time_in_space: 5)
    @mission3 = Mission.create(title:"Gemini 7", time_in_space: 6)

    AstronautMission.create(astronaut_id: @astronaut1.id, mission_id: @mission1.id)
    AstronautMission.create(astronaut_id: @astronaut1.id, mission_id: @mission2.id)
    AstronautMission.create(astronaut_id: @astronaut1.id, mission_id: @mission3.id)

    expect(@astronaut1.time_in_space).to eq(15)
  end


end
