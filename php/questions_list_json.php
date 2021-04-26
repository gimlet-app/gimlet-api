<?php
require './vars.php';

$thirty_days_ago = date('Y-m-d', strtotime('-30 days'));
$today = date('Y-m-d');

$api_url = "https://{$DOMAIN}.gimlet.us/api/v1/sites/{$SITE_ID}/questions?start_date={$thirty_days_ago}&end_date={$today}";

$req = curl_init($api_url);
$credentials = "{$EMAIL}:{$API_KEY}";
curl_setopt($req, CURLOPT_USERPWD, $credentials);
curl_setopt($req, CURLOPT_RETURNTRANSFER, true);

$data = curl_exec($req);
$parsed = json_decode($data);

// Do what you need with the data
var_dump($parsed);
// ?>
