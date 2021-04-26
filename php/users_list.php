<?php
require './vars.php';

$api_url = "https://{$DOMAIN}.gimlet.us/api/v1/users";

$req = curl_init($api_url);
$credentials = "{$EMAIL}:{$API_KEY}";

curl_setopt($req, CURLOPT_USERPWD, $credentials);
curl_setopt($req, CURLOPT_RETURNTRANSFER, true);

$data = curl_exec($req);
$parsed = json_decode($data);

// Do what you need with the data
var_dump($data);
?>
