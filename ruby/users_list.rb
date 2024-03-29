require 'faraday'
require 'json'

#
# List all Users within an Account
#

# Required API Variables
require './vars.rb'

# URL and Path
url = "https://#{DOMAIN}.gimlet.us"
path = "/api/v1/users.json"

# New connection with base URL and path
conn = Faraday.new(url: url)    # New connection with base URL
conn.basic_auth(EMAIL, API_KEY) # Set the authentication header
response = conn.get(path)       # GET API request

# Print the results
results = JSON.parse(response.body)
puts results.to_json
