require "spec_helper"
 
describe Api::UsersController do

  describe "GET /api/users" do

    before do
      10.times do
        FactoryGirl.create :user, first_name: 'David'
      end
    end
    
    before do
      get '/api/users'
    end

    it 'returns status 200 OK' do
      expect(response).to be_success
    end

    it 'returns users' do
      body = JSON.parse(response.body)
      first_names = body.map { |m| m["first_name"] }

      expect(first_names.length).to eq(10)     
      expect(first_names.first).to eq('David')
      expect(first_names.last).to eq('David')
    end
    
  end

end
 