---
title: Gimlet v1 API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - ruby
  - php

toc_footers:
  - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Slate</a>

includes:
  - questions
  - branches
  - facets
  - users

search: true

code_clipboard: true
---

# REST API

## Introduction

Welcome to the [Gimlet](https://gimlet.us) REST API. You can use our API to access Gimlet API endpoints, which can get information on questions, branches, facets, and users from your account in our database.

We have language examples for both Ruby and PHP. You can view the code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

## Getting help

If this guide isn't enough for you, please create a support ticket by contacting us at [support@gimlet.us](mailto:support@gimlet.us) and we'll give you a hand.

# Authentication

To get an API key, have an account administrator head to:

Account -> Branches -> Users -> (Choose an Email)

and click the "Generate API Key" button.

The API key grants a user access to add and query questions for sites they are a member of. Gimlet expects the API key to be included in all API requests to the server.

```ruby
# Create a file named vars.rb for your API calls
#
# Required API Variables
DOMAIN  = 'your_domain' # Without .gimlet.us
EMAIL   = 'your_email_address'
API_KEY = 'your_api_key'
SITE_ID = 0 # Get this integer from listing branches, or looking at the URL in the new question form

```

```php
<?php
// Create a file named vars.php for your API calls
$DOMAIN = "<your_gimlet_domain>";  // Without .gimlet.us
$EMAIL = "<your_email>";
$API_KEY = "<your_api_key>";
$SITE_ID = 0;  // Get this integer from listing branches, or looking at the URL in the new question form
?>

```

<aside class="success">
Remember — You need an API key to access your data!
</aside>
