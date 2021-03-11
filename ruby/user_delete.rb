require 'faraday'
require 'json'

#
# Delete a User from an Account
#

# Required API Variables
domain  = 'your_domain'
email   = 'your_email_address'
api_key = 'your_api_key'
user_id = 1                               # User ID to destroy

# URL and Path
url = "https://#{domain}.gimlet.us"
path = "/api/v1/users/#{user_id}.json"

# New connection with base URL and path
conn = Faraday.new(url: url)              # New connection with base URL
conn.basic_auth(email, api_key)           # Set the authentication header
response = conn.delete(path, params)      # DELETE API request

# Do what you need with the data
results = response.body
