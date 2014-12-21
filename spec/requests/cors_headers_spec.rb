require 'spec_helper'

describe "HTTP OPTIONS requests" do
  
  before do 
    get '/api/users', 'HTTP_ORIGIN' => 'http://example.com'
  end

  it 'responds successfully with an HTTP 200 status code' do
    expect(response).to be_success
    expect(response.code).to eq('200')
  end
# curl --verbose --request OPTIONS http://localhost:8080/api/users --header 'Origin: http://example.com' --header 'Access-Control-Request-Headers: Origin, Accept, Content-Type' --header 'Access-Control-Request-Method: GET'
end