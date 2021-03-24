require 'date'
require 'faraday'
require 'json'

#
# List all Questions from a Branch/Site for the past 30 days as JSON
#

# Required API Variables
require './vars.rb'

# Report Dates
today = Date.today
thirty_days_ago = today - 30

# URL and Path
url = "https://#{DOMAIN}.gimlet.us"
path = "/api/v1/sites/#{SITE_ID}/questions.json?start_date=#{thirty_days_ago.to_s}&end_date=#{today.to_s}"

# New connection with base URL and path
conn = Faraday.new(url: url)    # New connection with base URL
conn.basic_auth(EMAIL, API_KEY) # Set the authentication header
response = conn.get(path)       # GET API request

# Print the results
results = JSON.parse(response.body)
puts "RESULTS: #{results.inspect}"
