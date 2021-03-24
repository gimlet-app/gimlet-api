require 'faraday'
require 'json'

#
# Update a User from an Account
#
# * Add or remove user site memberships
# * Update a user's email address
#

# Required API Variables
require './vars.rb'

# Set API method variables
user_id = 1                                  # User ID to update

# Example User values
params = {}
params['user'] = {}
params['user']['email'] = 'jane@library.org' # Update user email address
params['user']['site_ids']= [1,2]            # Update site ids for membership /
                                             # Cannot be an empty array

# URL and Path
url = "https://#{DOMAIN}.gimlet.us"
path = "/api/v1/users/#{user_id}.json"

# New connection with base URL and path
conn = Faraday.new(url: url)                 # New connection with base URL
conn.basic_auth(EMAIL, API_KEY)              # Set the authentication header
response = conn.put(path, params)            # PUT API request

# Print the results
results = JSON.parse(response.body)
puts "RESULTS: #{results.inspect}"
