require 'faraday'
require 'json'

# 
# List all Users within an Account
#

# Required API Variables
domain  = 'your_domain'
email   = 'your_email_address'
api_key = 'your_api_key'

# URL and Path
url = "https://#{domain}.gimlet.us"
path = "/api/v1/users.json"

# New connection with base URL and path
conn = Faraday.new(url: url)    # New connection with base URL
conn.basic_auth(email, api_key) # Set the authentication header
response = conn.get(path)       # GET API request

# Do what you need with the data
results = JSON.parse(response.body)
