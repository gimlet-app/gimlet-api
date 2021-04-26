<?php
require './vars.php';

// Set API method variables
$user_id = 1; // User ID to delete
              // You cannot destroy your own account

$api_url = "https://{$DOMAIN}.gimlet.us/api/v1/users/{$user_id}.json";

$req = curl_init($api_url);
$credentials = "{$EMAIL}:{$API_KEY}";
curl_setopt($req, CURLOPT_USERPWD, $credentials);
curl_setopt($req, CURLOPT_CUSTOMREQUEST, "DELETE");
curl_setopt($req, CURLOPT_RETURNTRANSFER, true);

$data = curl_exec($req);

// Do what you need with the data
var_dump($data);

// ?>
