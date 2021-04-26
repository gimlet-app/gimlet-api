require 'faraday'
require 'json'

#
# Delete a User from an Account
#

# Required API Variables
require './vars.rb'

# Set API method variables
user_id = 1 # User ID to destroy /
            # You cannot destroy your own account

# URL and Path
url = "https://#{DOMAIN}.gimlet.us"
path = "/api/v1/users/#{user_id}.json"

# New connection with base URL and path
conn = Faraday.new(url: url)              # New connection with base URL
conn.basic_auth(EMAIL, API_KEY)           # Set the authentication header
response = conn.delete(path)              # DELETE API request

# Print the results
results = JSON.parse(response.body)
puts "RESULTS: #{results.inspect}"
