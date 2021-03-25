# Branches

## List Branches JSON

```ruby
require 'faraday'
require 'json'

#
# List all Branches/Sites from an Account
#

# Required API Variables
require './vars.rb'

# URL and Path
url = "https://#{DOMAIN}.gimlet.us"
path = "/api/v1/sites.json"

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
require 'vars.php';

$api_url = "https://${DOMAIN}.gimlet.us/api/v1/sites";

$req = curl_init($api_url);
$credentials = "${EMAIL}:${API_KEY}";
curl_setopt($req, CURLOPT_USERPWD, $credentials);
curl_setopt($req, CURLOPT_RETURNTRANSFER, true);

$data = curl_exec($req);
$parsed = json_decode($data);

// Do what you need with the data
var_dump($parsed);
?>
```

> The above command returns JSON structured like this:

```json
{
  "branches": [
    {
      "id": 2,
      "name": "Engineering Library",
      "status": "active",
      "help_url": null,
      "question_count": 422,
      "use_initials": true,
      "use_difficulty": true,
      "use_qa": true,
      "use_tagging": true
    },
    {
      "id": 1,
      "name": "Humanities Library",
      "status": "active",
      "help_url": null,
      "question_count": 380,
      "use_initials": true,
      "use_difficulty": true,
      "use_qa": true,
      "use_tagging": true
    }
  ]
}
```

This endpoint retrieves all account branches/sites as JSON.

### HTTP Request

`GET https://<DOMAIN>.gimlet.us/api/v1/sites.json`
