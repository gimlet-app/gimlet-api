require 'faraday'
require 'json'

#
# Add a User to an Account
#

# Required API Variables
require './vars.rb'

# URL and Path
url = "https://#{DOMAIN}.gimlet.us"
path = "/api/v1/users.json"

# Example User values
params = {}
params['user'] = {}
params['user']['email'] = 'example@library.org' # New email/user to create
params['user']['site_ids']= [1,2]            # Your site ids for membership

# New connection with base URL and path
conn = Faraday.new(url: url)              # New connection with base URL
conn.basic_auth(EMAIL, API_KEY)           # Set the authentication header
response = conn.post(path, params)        # POST API request

# Print the results
results = JSON.parse(response.body)
puts "RESULTS: #{results.inspect}"
