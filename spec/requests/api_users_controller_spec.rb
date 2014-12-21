require 'spec_helper'
 
describe Api::UsersController do
  
  context 'GET #index' do
    
    before do
      FactoryGirl.create_list(:user, 10)
      get '/api/users'
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end

    it 'retreives all users' do
      users = json.map {|m| m['id']}
      expect(users.length).to eq(10)     
    end
  end

  context 'GET #show' do
    
    before do
      user = FactoryGirl.create :user, first_name: 'Bob'
      get "/api/users/#{user.id}"
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end

    it 'retreives a specific user' do
      expect(json['first_name']).to eq('Bob')
    end
  end

  context 'PATCH #update' do
    
    before do
      user = FactoryGirl.create :user, first_name: 'David'
      user.update(first_name: 'Shmavid')
      get "/api/users/#{user.id}"
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end

    it 'retreives a specific user' do
      expect(json['first_name']).to eq('Shmavid')
    end
  end

  context 'DELETE #destroy' do

    before do
      user = FactoryGirl.create :user, first_name: 'Test'
      @id = user.id
      user.delete
    end

    it "should destroy the resource" do
      expect { User.find(@id) }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

end
 