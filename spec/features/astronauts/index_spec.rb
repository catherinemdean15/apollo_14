require 'rails_helper'

describe 'astronaut index page', type: :feature do
  it 'lists astronauts and info' do
    @astronaut1 = Astronaut.create(name:"Neil Armstrong", age: 30, job:"Pilot")
    @astronaut2 = Astronaut.create(name:"Buzz Aldrin", age: 20, job:"Commander")
    @astronaut3 = Astronaut.create(name:"Sally Ride", age: 25, job:"Command Module")

    @mission1 = Mission.create(title:"Apollo 13", time_in_space: 4)
    @mission2 = Mission.create(title:"Capricorn 4", time_in_space: 5)
    @mission3 = Mission.create(title:"Gemini 7", time_in_space: 6)

    AstronautMission.create(astronaut_id: @astronaut1.id, mission_id: @mission1.id)
    AstronautMission.create(astronaut_id: @astronaut1.id, mission_id: @mission2.id)
    AstronautMission.create(astronaut_id: @astronaut1.id, mission_id: @mission3.id)
    AstronautMission.create(astronaut_id: @astronaut2.id, mission_id: @mission1.id)
    AstronautMission.create(astronaut_id: @astronaut3.id, mission_id: @mission3.id)
    AstronautMission.create(astronaut_id: @astronaut3.id, mission_id: @mission2.id)


    visit '/astronauts'

    expect(page).to have_content(@astronaut1.name)
    expect(page).to have_content(@astronaut1.age)
    expect(page).to have_content(@astronaut1.job)

    expect(page).to have_content(@astronaut2.name)
    expect(page).to have_content(@astronaut2.age)
    expect(page).to have_content(@astronaut2.job)

    expect(page).to have_content(@astronaut3.name)
    expect(page).to have_content(@astronaut3.age)
    expect(page).to have_content(@astronaut3.job)

  end



  it 'shows average age of all astronauts' do
    @astronaut1 = Astronaut.create(name:"Neil Armstrong", age: 30, job:"Pilot")
    @astronaut2 = Astronaut.create(name:"Buzz Aldrin", age: 20, job:"Commander")
    @astronaut3 = Astronaut.create(name:"Sally Ride", age: 25, job:"Command Module")

    @mission1 = Mission.create(title:"Apollo 13", time_in_space: 4)
    @mission2 = Mission.create(title:"Capricorn 4", time_in_space: 5)
    @mission3 = Mission.create(title:"Gemini 7", time_in_space: 6)

    AstronautMission.create(astronaut_id: @astronaut1.id, mission_id: @mission1.id)
    AstronautMission.create(astronaut_id: @astronaut1.id, mission_id: @mission2.id)
    AstronautMission.create(astronaut_id: @astronaut1.id, mission_id: @mission3.id)
    AstronautMission.create(astronaut_id: @astronaut2.id, mission_id: @mission1.id)
    AstronautMission.create(astronaut_id: @astronaut3.id, mission_id: @mission3.id)
    AstronautMission.create(astronaut_id: @astronaut3.id, mission_id: @mission2.id)

    visit '/astronauts'

    expect(page).to have_content("Average Age: 25")
  end



  it 'lists each space mission in alphabetical order for each astronaut' do
    @astronaut1 = Astronaut.create(name:"Neil Armstrong", age: 30, job:"Pilot")

    @mission1 = Mission.create(title:"Apollo 13", time_in_space: 4)
    @mission2 = Mission.create(title:"Capricorn 4", time_in_space: 5)
    @mission3 = Mission.create(title:"Gemini 7", time_in_space: 6)

    AstronautMission.create(astronaut_id: @astronaut1.id, mission_id: @mission1.id)
    AstronautMission.create(astronaut_id: @astronaut1.id, mission_id: @mission2.id)
    AstronautMission.create(astronaut_id: @astronaut1.id, mission_id: @mission3.id)

    visit '/astronauts'

      expect(page.all('.missions')[0]).to have_content("Apollo 13")
      expect(page.all('.missions')[1]).to have_content("Capricorn 4")
      expect(page.all('.missions')[2]).to have_content("Gemini 7")


  end

  it 'shows total time in space for each astronaut' do
    @astronaut1 = Astronaut.create(name:"Neil Armstrong", age: 30, job:"Pilot")

    @mission1 = Mission.create(title:"Apollo 13", time_in_space: 4)
    @mission2 = Mission.create(title:"Capricorn 4", time_in_space: 5)
    @mission3 = Mission.create(title:"Gemini 7", time_in_space: 6)

    AstronautMission.create(astronaut_id: @astronaut1.id, mission_id: @mission1.id)
    AstronautMission.create(astronaut_id: @astronaut1.id, mission_id: @mission2.id)
    AstronautMission.create(astronaut_id: @astronaut1.id, mission_id: @mission3.id)

    visit '/astronauts'
    save_and_open_page
    expect(page).to have_content("Time in Space: 15")

  end
end
