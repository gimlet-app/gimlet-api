# Questions

## List Questions JSON

```ruby
require 'date'
require 'faraday'
require 'json'

#
# List all Questions from a Branch/Site for the past 30 days as JSON
#

# Required API Variables
require './vars.rb'

# Report Dates
today = Date.today
thirty_days_ago = today - 30

# URL and Path
url = "https://#{DOMAIN}.gimlet.us"
path = "/api/v1/sites/#{SITE_ID}/questions.json?start_date=#{thirty_days_ago.to_s}&end_date=#{today.to_s}"

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

$thirty_days_ago = date('Y-m-d', strtotime('-30 days'));
$today = date('Y-m-d');

$api_url = "https://${DOMAIN}.gimlet.us/api/v1/sites/${SITE_ID}/questions?start_date=${thirty_days_ago}&end_date=${today}";

$req = curl_init($api_url);
$credentials = "${EMAIL}:${API_KEY}";
curl_setopt($req, CURLOPT_USERPWD, $credentials);
curl_setopt($req, CURLOPT_RETURNTRANSFER, true);

$data = curl_exec($req);
$parsed = json_decode($data);

// Do what you need with the data
var_dump($parsed);
// ?>
```

> The above command returns JSON structured like this:

```json
{
  "questions":
  [
    {
      "question_number": 801,
      "initials": "test",
      "email": "jane@library.org",
      "location": "Reference",
      "duration": "0-5 minutes",
      "format": "Phone",
      "asked_by": "Staff",
      "question_type": "Technology",
      "difficulty": null,
      "asked_at": "2021-03-24 10:42:00 AM",
      "question_date": "2021-03-24",
      "question_time": "10:42:00 AM",
      "question_half_hour": "10:30:00 AM",
      "question_weekday": "Wednesday",
      "added_at": "2021-03-24 10:42:32 AM",
      "tags": "example_tag",
      "site": "Humanities Library",
      "account": "Big Campus",
      "question": "Test at 10:42 AM!",
      "answer": "Test question."
    },
    {
      ...
    }
  ]
}
```

This endpoint retrieves all questions as JSON.

### HTTP Request

`GET https://<DOMAIN>.gimlet.us/api/v1/sites/<SITE_ID>/questions.json`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
start_date | null | YYYY-MM-DD
end_date | null | YYYY-MM-DD

## List Questions CSV

```ruby
require 'csv'
require 'date'
require 'faraday'

#
# List all Questions from a Branch/Site for the past 30 days as CSV
#

# Required API Variables
require './vars.rb'

# Report Dates
today = Date.today
thirty_days_ago = today - 30

# URL and Path
url = "https://#{DOMAIN}.gimlet.us"
path = "/api/v1/sites/#{SITE_ID}/questions.csv?start_date=#{thirty_days_ago.to_s}&end_date=#{today.to_s}"

# New connection with base URL, path, and accepting CSV
conn = Faraday.new(url: url, headers: {'Accept': 'text/csv'})
conn.basic_auth(EMAIL, API_KEY) # Set the authentication header
response = conn.get(path)       # GET API request

# Print the results
results = CSV.parse(response.body)
puts "RESULTS: #{results.inspect}"

```

```php
<?php
require 'vars.php';

$thirty_days_ago = date('Y-m-d', strtotime('-30 days'));
$today = date('Y-m-d');

$api_url = "https://${DOMAIN}.gimlet.us/api/v1/sites/${SITE_ID}/questions?start_date=${thirty_days_ago}&end_date=${today}";

$req = curl_init($api_url);
$credentials = "${EMAIL}:${API_KEY}";
curl_setopt($req, CURLOPT_USERPWD, $credentials);
curl_setopt($req, CURLOPT_HTTPHEADER, array('Accept: text/csv'));
curl_setopt($req, CURLOPT_RETURNTRANSFER, true);

$data = curl_exec($req);

echo($data);
?>
```
> The above command returns CSV structured like this:

```csv
[["800", "test", "jane@library.org", "Reference", "0-5 minutes", "Phone", "Staff", "Technology", nil, "2021-03-24 10:40:00 AM", "2021-03-24", "10:40:00 AM", "10:30:00 AM", "Wednesday", "2021-03-24 10:40:28 AM", "example_tag", "Humanities Library", "Big Campus", "Test at 10:40 AM!", "Another test!"], ["801", "test", "jane@library.org", "Reference", "0-5 minutes", "Phone", "Staff", "Technology", nil, "2021-03-24 10:42:00 AM", "2021-03-24", "10:42:00 AM", "10:30:00 AM", "Wednesday", "2021-03-24 10:42:32 AM", "example_tag", "Humanities Library", "Big Campus", "Test at 10:42 AM!", "Another test!"][...]]
```

This endpoint retrieves all account questions as CSV.

### HTTP Request

`GET https://<DOMAIN>.gimlet.us/api/v1/sites/<SITE_ID>/questions.csv`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
start_date | null | YYYY-MM-DD
end_date | null | YYYY-MM-DD

## Add Question

```ruby
require 'date'
require 'faraday'

#
# Add a Question to a Branch/Site
#

# Required API Variables
require './vars.rb'

# URL and Path
url = "https://#{DOMAIN}.gimlet.us"
path = "/api/v1/sites/#{SITE_ID}/questions"

date_time = DateTime.now

# Field values
fields = {}
fields["site_id"] = SITE_ID
fields["question"]= {}
fields["question"]["location_name"] = "Reference"
fields["question"]["duration_name"] = "0-5 minutes"
fields["question"]["format_name"]   = "Phone"
fields["question"]["questioner_name"] = "Staff"
fields["question"]["question_type_name"] = "Technology"
fields["question"]["difficulty_name"] = "1"
fields["question"]["tag_list"] = "example_tag"
fields["question"]["question"] = "Test at #{Time.now.strftime("%I:%M %p")}!"
fields["question"]["answer"] = "Another test!"
fields["question"]["initials"] = "test"
fields["question"]["asked_at_time"] = date_time.strftime("%I:%M %p")
fields["question"]["asked_at_date"] = date_time.strftime("%m/%d/%Y")

# New connection with base URL and path
conn = Faraday.new(url: url)        # New connection with base URL
conn.basic_auth(EMAIL, API_KEY)     # Set the authentication header
response = conn.post(path, fields)  # POST API request

# Print the results
results = response.body
puts "RESULTS: #{results.inspect}"

```

```php
<?php
require 'vars.php';

$api_url = "https://${DOMAIN}.gimlet.us/api/v1/sites/${SITE_ID}/questions";

$now_time = date('G:i');
$now_date = date('m/d/Y');

// Change these to be what you actually need!
$fields = [
    "site_id" => $SITE_ID,
    "question[location_name]" => "Reception desk",
    "question[duration_name]" => "0-9 minutes",
    "question[format_name]" => "Phone",
    "question[questioner_name]" => "Staff",
    "question[question_type_name]" => "Administrative",
    "question[difficulty_name]" => "1",
    "question[tag_list]" => "",
    "question[question]" => "Test at ${now_time}!",
    "question[answer]" => "Another test!",
    "question[initials]" => "test",
    "question[asked_at_time]" => $now_time,
    "question[asked_at_date]" => $now_date,
];

$req = curl_init($api_url);
$credentials = "${EMAIL}:${API_KEY}";
curl_setopt($req, CURLOPT_USERPWD, $credentials);
curl_setopt($req, CURLOPT_POST, true);
curl_setopt($req, CURLOPT_POSTFIELDS, $fields);
curl_setopt($req, CURLOPT_RETURNTRANSFER, true);

$data = curl_exec($req);
$response_code = curl_getinfo($req, CURLINFO_RESPONSE_CODE);
// Do what you need with the data
echo("${response_code} ${data}");

// ?>
```

> The above command returns PLAIN text structured like this:

```txt
"Created"
```

This endpoint adds a new question.

### HTTP Request

`POST https://<DOMAIN>.gimlet.us/api/v1/sites/<SITE_ID>/questions`

### URL Parameters

Parameter | Example | Description
--------- | ----------- | -----------
site_id                | 0 | The ID of the brand/site for the new question
question[location_name]| Reference | The LOCATION facet value
question[duration_name]| 0-5 minutes | The DURATION facet value
question[format_name]  | Phone | The FORMAT facet value
question[questioner_name]| Staff | The QUESTIONER facet value (aka "Asked by")
question[question_type_name]| Technology | The TYPE facet value
question[difficulty_name]| 1 | The DIFFICULTY facet value
question[tag_list]| example_tag | Space separated list of tags (can leave blank)
question[question]| text | Question text (can leave blank)
question[answer]| text | Answer text (can leave blank)
question[initials]| EWL | User Initials value (can leave blank)
question[asked_at_time] | "04:22 PM" | Time of question
question[asked_at_date] | "03/24/2021" | Date of question
