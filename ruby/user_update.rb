require 'faraday'
require 'json'

#
# Update a User from an Account
#
# * Add or remove user site memberships
# * Update a user's email address
#

# Required API Variables
domain  = 'your_domain'
email   = 'your_email_address'
api_key = 'your_api_key'
user_id = 1                                  # User ID to update

# Example User values
params = {}
params['user'] = {}
params['user']['email'] = 'jane@library.org' # Update user email address
params['user']['site_ids']= [1,2]            # Update site ids for membership

# URL and Path
url = "https://#{domain}.gimlet.us"
path = "/api/v1/users/#{user_id}.json"

# New connection with base URL and path
conn = Faraday.new(url: url)                 # New connection with base URL
conn.basic_auth(email, api_key)              # Set the authentication header
response = conn.put(path, params)            # PUT API request

# Do what you need with the data
results = response.body
