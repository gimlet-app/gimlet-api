# Gimlet's REST API

[Gimlet](https://gimlet.us) has a simple REST API for importing and exporting question data, along with some of the other information you might need to do those things.

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

### Questions