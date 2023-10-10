extends Node

var phone: int = 111222333444555
var listURL = "https://raw.githubusercontent.com/jonathanhecl/venga-heladeria-app/main/list.json"
var resultList = []

func reload_list():
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.request_completed.connect(self._http_request_completed)
	
	var error = http_request.request(listURL)
	if error != OK:
		push_error("An error occurred in the HTTP request.")

func _http_request_completed(result, response_code, headers, body):
	var json = JSON.new()
	var err = json.parse(body.get_string_from_utf8())
	resultList = json.get_data()
	if not resultList.has("list"):
		push_error("Invalid list")
