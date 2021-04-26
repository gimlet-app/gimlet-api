# Facets

## List Facets JSON

```ruby
require 'faraday'
require 'json'

#
# List all Facets from a Branch/Site
#

# Required API Variables
require './vars.rb'

# URL and Path
url = "https://#{DOMAIN}.gimlet.us"
path = "/api/v1/sites/#{SITE_ID}/facets.json"

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

$api_url = "https://${DOMAIN}.gimlet.us/api/v1/sites/${SITE_ID}/facets";

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
  "facets": [
    {
      "id": 1,
      "type": "Duration",
      "name": "0-5 minutes"
    },
    {
      "id": 14,
      "type": "Format",
      "name": "In person"
    },
    {
      "id": 19,
      "type": "Location",
      "name": "Reference"
    },
    {
      "id": 9,
      "type": "Questioner",
      "name": "Adult"
    },
    {
      "id": 4,
      "type": "QuestionType",
      "name": "Directional"
    },
    {...}
```

This endpoint retrieves all account facets as JSON.

### HTTP Request

`GET https://<DOMAIN>.gimlet.us/api/v1/facets.json`
