
client = require("twilio")("AC3fea2983e524ef5000265c80d5a2e6cf", "fc64f2b0439f96038f0565388c42b8e0")

to-phone    = "+19139077462"  # Any number Twilio can deliver to
from-phone  = "+19139560008"  # A number you bought from Twilio and can use for outbound communication


client.send-sms {}=
  to:   to-phone
  from: from-phone
  body: "word to your mother."    # body of the SMS message
, (err, responseData) ->          # this function is executed when a response is received from Twilio
  unless err                      # "err" is an error received during the request, if any

    # "responseData" is a JavaScript object containing data received from Twilio.
    # A sample response from sending an SMS message is here (click "JSON" to see how the data appears in JavaScript):
    # http://www.twilio.com/docs/api/rest/sending-sms#example-1

    console.log responseData.from # outputs "+14506667788"
    console.log responseData.body # outputs "word to your mother."

# do -> client.send-sms!
# twilio-api = module.exports = client.send-sms
