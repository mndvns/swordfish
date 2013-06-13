var client, toPhone, fromPhone;
client = require("twilio")("AC3fea2983e524ef5000265c80d5a2e6cf", "fc64f2b0439f96038f0565388c42b8e0");
toPhone = "+19139077462";
fromPhone = "+19139560008";
client.sendSms({
  to: toPhone,
  from: fromPhone,
  body: "word to your mother."
}, function(err, responseData){
  if (!err) {
    console.log(responseData.from);
    return console.log(responseData.body);
  }
});