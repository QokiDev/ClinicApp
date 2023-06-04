require 'nokogiri'
require 'open-uri'
require 'csv'

namespace :hospitals do
  task parse_site: :environment do
    url = 'https://www.hospitalsafetygrade.org/all-hospitals'
    user_agent = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36'

    doc = Nokogiri::HTML(URI.open(url, 'User-Agent' => user_agent))

    doc.css('.column1 #BlinkDBContent_849210 ul li a').each do |link|
      name = link.text.strip
      dep = Department.create(name: name, address: 'Kyiv', founding_date: '01.01.2000')
    end
  end

  task parse_csv: :environment do
    csv_file = File.join(__dir__, 'hospitals.csv')

    CSV.foreach(csv_file, headers: true) do |row|
      name = row['Facility.Name']
      city = row['Facility.City']
      state = row['Facility.State']

      dep = Department.create(name: name, address: "#{city} #{state}", founding_date: '01.01.2003')
    end
  end
end
