class Team < ActiveRecord::Base

  validates_presence_of :rank, :count, :raw_cap, :percent_cap, :position, :year, :cap

  def initialize

  end

end