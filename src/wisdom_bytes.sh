#!/bin/bash

api="https://api.funnylabz.com/proverbs"
user_agent="Dart/3.0 (dart:io)"

function get_contents() {
	# 1 - language: (string): <language - default: en>
	# 2 - category_id: (integer): <category_id - default: 0>
	# 3 - country_id: (integer): <country_id - default: 0>
	# 4 - only_validated: (integer): <only_validated - default: 0>
	# 5 - order_by_score: (integer): <order_by_score - default: 0>
	curl --request GET \
		--url "$api/contents/${1:-en}" \
		--user-agent "$user_agent" \
		--header "categoryid: ${2:-0}" \
		--header "countryid: ${3:-0}" \
		--header "onlyvalidated: ${4:-0}" \
		--header "orderbyscore: ${5:-0}"
}

function get_categories() {
	# 1 - language: (string): <language - default: en>
	curl --request GET \
		--url "$api/categories/${1:-en}" \
		--user-agent "$user_agent" \
		--header "content-type: application/json"
}

function get_content_score() {
	# 1 - content_id: (integer): <content_id>
	curl --request GET \
		--url "$api/content/score/$1" \
		--user-agent "$user_agent" \
		--header "content-type: application/json"
}

function react_to_content() {
	# 1 - content_id: (integer): <content_id>
	# 2 - reaction: (integer): <reaction - 1 = like, 2 = unlike>
	curl --request POST \
		--url "$api/vote/$1/$2" \
		--user-agent "$user_agent"
}

function report_content() {
	# 1 - content_id: (integer): <content_id>
	curl --request POST \
		--url "$api/report/$1" \
		--user-agent "$user_agent"
}
