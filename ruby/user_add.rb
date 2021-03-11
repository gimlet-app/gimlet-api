require 'faraday'
require 'json'

#
# Add a User to an Account
#

# Required API Variables
domain  = 'your_domain'
email   = 'your_email_address'
api_key = 'your_api_key'

# URL and Path
url = "https://#{domain}.gimlet.us"
path = "/api/v1/users.json"

# Example User values
params = {}
params['user'] = {}
params['user']['email'] = 'example@test.com' # New email/user to create
params['user']['site_ids']= [1,2]            # Your site ids for membership

# New connection with base URL and path
conn = Faraday.new(url: url)              # New connection with base URL
conn.basic_auth(email, api_key)           # Set the authentication header
response = conn.post(path, params)        # POST API request

# Do what you need with the data
results = response.body
