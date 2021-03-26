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
fields["question"]["tag_list"] = "example_tag1 example_tag2"
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
