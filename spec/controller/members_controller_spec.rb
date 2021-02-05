# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MembersController, type: :controller do
  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'Show member' do
    it 'shows the member' do
      get :show, params: { id: 7 }
      expect(response.status).to eq(200)
    end
  end

  describe 'New member' do
    it 'shows the new member' do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe 'create member' do
    it 'creates the member' do
      post :create,
           params: { member: { name: 'yoo', email: 'yoo', age: 22, role_id: 3, address: 'jdfhjgdhjfg', contact: 345,
                               password: 123 } }
      expect(response.status).to eq(302)
    end
  end

  describe 'does not create member' do
    it 'does not creates the member' do
      post :create,
           params: { member: { name: '', email: 'yoo', age: 22, role_id: 3, address: 'jdfhjgdhjfg', contact: 345,
                               password: 123 } }
      expect(response).to redirect_to('/members')
    end
  end

  describe 'update member' do
    it 'updates the member' do
      # patch :update,  params: params

      patch :update,
            params: { id: 7,
                      member: { name: 'ypppppp', email: 'yoo', age: 22, role_id: 3, address: 'jdfhjgdhjfg',
                                contact: 345, password: 123 } }

      expect(response.status).to eq(302)
    end
  end

  describe 'destroy member' do
    it 'destroys the member' do
      # patch :update,  params: params

      delete :destroy, params: { id: 7 }

      expect(response.status).to eq(302)
    end
  end
end
