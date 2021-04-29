<?php
require './vars.php';

// Set API method variables
$user_id = 1; // User ID to update

$api_url = "https://{$DOMAIN}.gimlet.us/api/v1/users/{$user_id}.json";

// Change these to be what you actually need!
$fields = [
  "user[email]=example@library.org",
  "user[administrator]=true",
  "user[site_ids][]=1",
  "user[site_ids][]=2"
];

$req = curl_init($api_url);
$credentials = "{$EMAIL}:{$API_KEY}";
curl_setopt($req, CURLOPT_USERPWD, $credentials);
curl_setopt($req, CURLOPT_CUSTOMREQUEST, "PUT");
curl_setopt($req, CURLOPT_POSTFIELDS, join($fields,'&'));
curl_setopt($req, CURLOPT_RETURNTRANSFER, true);

$data = curl_exec($req);
$parsed = json_decode($data);

// Do what you need with the data
var_dump($parsed);
// ?>
