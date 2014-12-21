require 'spec_helper'

describe User do
  
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

   it { should validate_presence_of    :first_name }
   it { should validate_presence_of    :last_name }

end
