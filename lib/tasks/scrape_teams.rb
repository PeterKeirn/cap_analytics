namespace :scrape do
  desc 'scrape team positional data from spotrac'
  task teams: :environment do
    POSITIONS = ['quarterback', 'running-back', 'wide-reciever', 'tight-end', 'left-tackle',
                 'right-tackle', 'guard', 'center', 'defensive-end', 'outside-linebacker', 'inside-linebacker',
                 'cornerback', 'free-safety', 'strong-safety', 'kicker', 'punter', 'long-snapper']
    YEAR = 2013..2016
    CAP = {
        2016 => 155_270_000,
        2015 => 143_280_000,
        2014 => 133_000_000,
        2013 => 123_600_000
    }
    POSITIONS.each do |pos|
      YEAR.each do |year|
        team_data = SpotracScraper.new(pos, year)
        Team.create(team_data)
      end
    end
  end
end