<?php
require './vars.php';

$api_url = "https://{$DOMAIN}.gimlet.us/api/v1/sites/{$SITE_ID}/questions";

$now_time = date('G:i');
$now_date = date('m/d/Y');

// Change these to be what you actually need!
$fields = [
    "site_id" => $SITE_ID,
    "question[location_name]" => "Reference",
    "question[duration_name]" => "0-5 minutes",
    "question[format_name]" => "Phone",
    "question[questioner_name]" => "Staff",
    "question[question_type_name]" => "Technology",
    "question[difficulty_name]" => "1",
    "question[tag_list]" => "example_tag1 example_tag2",
    "question[question]" => "Test at {$now_time}!",
    "question[answer]" => "Another test!",
    "question[initials]" => "test",
    "question[asked_at_time]" => $now_time,
    "question[asked_at_date]" => $now_date,
];

$req = curl_init($api_url);
$credentials = "{$EMAIL}:{$API_KEY}";
curl_setopt($req, CURLOPT_USERPWD, $credentials);
curl_setopt($req, CURLOPT_POST, true);
curl_setopt($req, CURLOPT_POSTFIELDS, $fields);
curl_setopt($req, CURLOPT_RETURNTRANSFER, true);

$data = curl_exec($req);
$response_code = curl_getinfo($req, CURLINFO_RESPONSE_CODE);
// Do what you need with the data
echo("{$response_code} {$data}");

// ?>
