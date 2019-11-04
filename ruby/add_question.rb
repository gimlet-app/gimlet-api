require 'date'
require 'faraday'

# Required API Variables
domain  = 'your_domain'
email   = 'your_email_address'
api_key = 'your_api_key'
site_id = 'your_site_id'

# URL and Path
url = "https://#{domain}.gimlet.us";
path = "/api/v1/sites/#{site_id}/questions"

date_time = DateTime.now

# Field values
fields = {}
fields["site_id"] = site_id
fields["question"]= {}
fields["question"]["location_name"] = "Reception desk"
fields["question"]["duration_name"] = "0-9 minutes"
fields["question"]["format_name"]   = "Phone"
fields["question"]["questioner_name"] = "Staff"
fields["question"]["question_type_name"] = "Administrative"
fields["question"]["difficulty_name"] = "1"
fields["question"]["tag_list"] = "example_tag"
fields["question"]["question"] = "Test at #{Time.now.strftime("%I:%M %p")}!"
fields["question"]["answer"] = "Another test!"
fields["question"]["initials"] = "test"
fields["question"]["asked_at_time"] = date_time.strftime("%I:%M %p")
fields["question"]["asked_at_date"] = date_time.strftime("%m/%d/%Y")

# New connection with base URL and path
conn = Faraday.new(url: url)        # New connection with base URL
conn.basic_auth(email, api_key)     # Set the authentication header
response = conn.post(path, fields)  # POST API request

# Do what you need with the data
results = response.body
