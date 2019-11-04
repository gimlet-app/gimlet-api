# Gimlet's REST API

[Gimlet](https://gimlet.us) has a simple REST API for importing and exporting question data, along with some of the other information you might need to do those things.

## Getting help

If this guide isn't enough for you, please file an issue or contact support@gimlet.us and we'll give you a hand.

### Getting an API key

To get an API key, have an administrator head to:

Account -> Branches -> Users

and click the "Generate API Key" button.

The API key grants a user access to add and query questions for sites they are a member of.

### URLs and authentication

The API is accessible at:

```
https://<yourdomain>.gimlet.us/api/v1/
```

Use HTTP Basic authentication; username is your Gimlet email, and password is your API key.

### Branches (aka "sites")

```
GET https://<yourdomain>.gimlet.us/api/v1/sites
```

Returns a JSON object with one attribute: `branches` which is an array of objects containing the following attributes:

* `id` Integer, indicating the id of this branch/site.
* `name` String.
* `status` String, will be 'active', 'archive_pending', or 'archived'
* `question_count` Integer, indicates the current number of questions for this branch/site.
* `use_initials` Boolean, true if initials are stored with questions
* `use_difficulty` Boolean, true if difficulty is enabled
* `use_qa` Boolean, true if question/answer text are stored with questions
* `use_tagging` Boolean, true if tags are stored with questions

### Facets

```
GET https://<yourdomain>.gimlet.us/api/v1/sites/<site_id>/facets
```

Returns a JSON object with one attribute: `facets` which is an array of objects containing the following attributes:

* `id` Integer, indicating the ID of this facet
* `type` String. One of 'Duration', 'Format', 'Location', 'Questioner', 'QuestionType', 'Difficulty'
* `name` String.

### Questions

#### Listing questions

```
GET https://<yourdomain>.gimlet.us/api/v1/sites/<site_id>/questions?start_date=YYYY-MM-DD&end_date=YYYY-MM-DD
```

All times and dates are in your account's local time zone. Start and end dates are inclusive.

Returns a JSON object with one attribute: `questions` which is an array of questions occurring between `start_date` and `end_date`. The array contains:

* `question_number` Integer
* `initials` String (or null)
* `email` String, email of the user logging this question
* `location` String, name of the location facet
* `duration` String, name of the duration facet
* `format` String, name of the format facet
* `asked_by` String, name of the asked_by (Questioner) facet
* `question_type` String, name of the question_type facet
* `difficulty` String, name of the difficulty facet value
* `asked_at` Date and time in the "Asked at" field
* `question_date` Date portion of `asked_at`
* `question_time` Time portion of `asked_at`
* `question_half_hour` Question time, rounded to nearest half-hour
* `question_weekday` String, weekday of question
* `added_at` Date and time the question was added to the database
* `tags` String. Space-separated list of tags
* `site` String. Branch name
* `account` String. Account name
* `question` String. Question text
* `answer` String. Answer text
