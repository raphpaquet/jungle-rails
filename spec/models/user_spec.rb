require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    before(:each) do
    @user = User.new(
      firstname: 'first_name',
      lastname: 'last_name',
      email: 'email@email.com',
      password: 'password',
      password_confirmation: 'password'
    )
    end 
    
    it 'should have an email' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end 

    it 'should have a first name' do
      @user.firstname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname can't be blank", "Firstname is too short (minimum is 3 characters)")
    end 

    it 'should have a last name' do
      @user.lastname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname can't be blank", "Lastname is too short (minimum is 3 characters)")
    end 

    it 'should have a password' do
      @user.password = nil
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank") 
    end 

    it 'password should be longer then 6 characters' do
      @user.password = 'lol'
      @user.password_confirmation = 'lol'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end 

    it 'password confirmation should be the same as password' do
      @user.password = 'LOLLOL'
      @user.password_confirmation = 'lollol'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end 
  end 

  describe '.authenticate_with_credentials' do
    
    before(:each) do
      @user = User.new(
        firstname: 'first_name',
        lastname: 'last_name',
        email: 'email@email.com',
        password: 'password',
        password_confirmation: 'password'
      )
      end 

    it 
  end 
end
