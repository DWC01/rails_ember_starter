require 'spec_helper'

describe "OPTIONS request to API" do
  
  xit "should return CORS headers" do
    # You can run this in console to confirm CORS is working
    `curl --verbose --request OPTIONS http://localhost:8080/api/users/1 --header 'Origin: http://example.com' --header 'Access-Control-Request-Headers: Origin, Accept, Content-Type' --header 'Access-Control-Request-Method: GET'`
  end
end