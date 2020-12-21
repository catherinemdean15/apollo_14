class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job
  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions

  def self.average_age
    average(:age)
  end

  def alphabetical_missions
    self.missions.alphabetical
  end

  def time_in_space
    self.missions.sum(:time_in_space)
  end
end
