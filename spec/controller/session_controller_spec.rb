# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'logs in and logs out' do
    it 'logs in to app' do
      post :create, params: { session: { email: 'kartikbokadia@gmail.com', password: '123' } }
      expect(response).to redirect_to('/blogapp/index')
    end
    it 'logs out from app' do
      puts session[:member_id]
      post :destroy
      expect(response).to redirect_to('/')
    end
  end
end
