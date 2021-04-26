<?php
require './vars.php';

$api_url = "https://{$DOMAIN}.gimlet.us/api/v1/users.json";

// Change these to be what you actually need!
$fields = [
  "user[email]=example@library.org",
  "user[site_ids][]=1",
  "user[site_ids][]=2"
];

$req = curl_init($api_url);
$credentials = "{$EMAIL}:{$API_KEY}";
curl_setopt($req, CURLOPT_USERPWD, $credentials);
curl_setopt($req, CURLOPT_POST, true);
curl_setopt($req, CURLOPT_POSTFIELDS, join($fields,'&'));
curl_setopt($req, CURLOPT_RETURNTRANSFER, true);

$data = curl_exec($req);
$parsed = json_decode($data);

// Do what you need with the data
var_dump($parsed);
// ?>
