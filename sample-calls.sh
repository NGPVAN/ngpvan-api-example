
apiname="codingAsActivism"
apikey="sample-uuid"

# Simple hello, world example
curl -i -H "Content-type: application/json" \
       --user "$apiname:$apikey|0" \
       -X POST \
       --data '{ "message": "Hello, world" }' \
       https://api.securevan.com/v4/echoes

echo ""

# Add an activist
curl -i -H "Content-type: application/json" \
       --user "$apiname:$apikey|1" \
       -X POST \
       --data '{ "firstName": "Jane", "lastName": "Doe", "emails": [ { "email": "jdoe@fake.ngpvan.com" } ] } ' \
       https://api.securevan.com/v4/people/findOrCreate


echo ""

# Confirm the activist was added
curl -i -H "Content-type: application/json" \
       --user "$apiname:$apikey|1" \
       -X GET \
       https://api.securevan.com/v4/people/100879417?$expand=emails

echo ""

# Get an event
curl -i -H "Content-type: application/json" \
       --user "$apiname:$apikey|1" \
       -X GET \
       "https://api.securevan.com/v4/events/4306?\$expand=roles,shifts,locations"

echo ""

# Signup to an event
curl -H "Content-type: application/json" \
       --user "$apiname:$apikey|1" \
       -X POST \
       --data '{ "person": { "vanId": 100879417 }, "event": { "eventId": 4306 }, "shift": { "eventShiftId": 5961 }, "role": { "roleId": 198334 }, "status": { "statusId": 1 }, "location": { "locationId": 333 } }' \
       https://api.securevan.com/v4/signups

# Confirm signup
curl -i -H "Content-type: application/json" \
       --user "$apiname:$apikey|1" \
       -X GET \
       https://api.securevan.com/v4/signups?vanId=100879417

echo ""

# Provide canvass data
curl -i -H "Content-type: application/json" \
       --user "$apiname:$apikey|1" \
       -X POST \
       --data '{ "canvassContext": { "dateCanvassed": "2017-08-08", "inputTypeId": 11, "contactTypeId": 8 }, "responses": [ { "type": "ActivistCode", "activistCodeId": 4369730, "action": "Apply" }, { "type": "SurveyResponse", "surveyQuestionId": 259400, "surveyResponseId": 1085255 }] }' \
       https://api.securevan.com/v4/people/100879417/canvassResponses

echo ""
