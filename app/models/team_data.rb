class TeamData

  def initialize
    @data = {}.with_indifferent_access
  end

  def insert_scrape_data(data)
    @data[data.team] = data
  end

end