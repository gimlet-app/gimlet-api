require 'csv'
require 'date'
require 'faraday'

#
# List all Questions from a Branch/Site for the past 30 days as CSV
#

# Required API Variables
require './vars.rb'

# Report Dates
today = Date.today
thirty_days_ago = today - 30

# URL and Path
url = "https://#{DOMAIN}.gimlet.us"
path = "/api/v1/sites/#{SITE_ID}/questions.csv?start_date=#{thirty_days_ago.to_s}&end_date=#{today.to_s}"

# New connection with base URL, path, and accepting CSV
conn = Faraday.new(url: url, headers: {'Accept': 'text/csv'})
conn.basic_auth(EMAIL, API_KEY) # Set the authentication header
response = conn.get(path)       # GET API request

# Print the results
results = CSV.parse(response.body)
puts "RESULTS: #{results.inspect}"
