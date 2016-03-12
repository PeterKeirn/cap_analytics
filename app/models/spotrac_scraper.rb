class SpotracScraper
  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'

  TYPE_ARRAY = [:rank, :team, :count, :raw_cap, :percent_cap]
  attr_accessor :rank, :team, :count, :raw_cap, :percent_cap, :position, :year

  def initialize(pos, year)
    url = 'http://www.spotrac.com/nfl/positional/'
    url += year.to_s + '/' if year < 2016
    url += pos + '/'
    page = Nokogiri::HTML(open(url))
    data_arr = page.css('tr.parent').css('td')
    TYPE_ARRAY.each_with_index{ |type, i| instance_variable_set("@#{type}", data_arr[i].text) }
    @position = pos
    @year = year
  end
end