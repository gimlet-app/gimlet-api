# Users

## List Users JSON

```ruby
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
puts "RESULTS: #{results.inspect}"

```

```php
<?php
// @TODO
?>
```

> The above command returns JSON structured like this:

```json
{
  "users": [
    {
      "id": 1,
      "email": "jane@library.org",
      "current_sign_in_at": "2021-03-24T10:39:48.000-05:00",
      "last_sign_in_at": "2021-03-23T13:19:42.000-05:00",
      "sites": [
        {
          "id": 2
        },
        {
          "id": 1
        }
      ]
    },
    {...}
  ]
}
```

This endpoint retrieves all account users as JSON.

### HTTP Request

`GET https://<DOMAIN>.gimlet.us/api/v1/users.json`

## Add User

```ruby
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

```

```php
 // @TODO
```

> The above command returns JSON structured like this:

```json
{
  "id": 3,
  "email": "example@library.org",
  "site_ids": [
    2,
    1
  ]
}
```

This endpoint adds a new user.

### HTTP Request

`POST https://<DOMAIN>.gimlet.us/api/v1/users.json`

### URL Parameters

Parameter | Example | Description
--------- | ----------- | -----------
user[email]| example@library.org | The EMAIL for a new user
user[site_ids]| [1,2] | The Branch/Site IDs for user membership

## Update User

```ruby
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

# URL and Path
url = "https://#{DOMAIN}.gimlet.us"
path = "/api/v1/users/#{user_id}.json"

# Example User values
params = {}
params['user'] = {}
params['user']['email'] = 'jane_doe@library.org' # Update user email address
params['user']['site_ids']= [1] # Update site ids for membership /
                                # Cannot be an empty array

# New connection with base URL and path
conn = Faraday.new(url: url)                 # New connection with base URL
conn.basic_auth(EMAIL, API_KEY)              # Set the authentication header
response = conn.put(path, params)            # PUT API request

# Print the results
results = JSON.parse(response.body)
puts "RESULTS: #{results.inspect}"


```

```php
 // @TODO
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "email": "jane_doe@library.org",
  "site_ids": [
    2,
    1
  ]
}
```

This endpoint updates an existing user.

### HTTP Request

`PUT https://<DOMAIN>.gimlet.us/api/v1/users/<USER_ID>.json`

### URL Parameters

Parameter | Example | Description
--------- | ----------- | -----------
user[email]| example@library.org | Update the EMAIL for an existing user
user[site_ids]| [1,2] | Update the Branch/Site IDs for user membership

## Delete User

```ruby
require 'faraday'
require 'json'

#
# Delete a User from an Account
#

# Required API Variables
require './vars.rb'

# Set API method variables
user_id = 1                               # User ID to destroy /
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

```

```php
 // @TODO
```

> The above command returns PLAIN text structured like this:

```txt
"OK"
```

This endpoint deletes a user.

### HTTP Request

`DELETE https://<DOMAIN>.gimlet.us/api/v1/users/<USER_ID>.json`
