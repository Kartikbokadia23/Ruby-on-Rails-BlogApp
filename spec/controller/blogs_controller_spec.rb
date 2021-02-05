# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BlogsController, type: :controller do
  describe 'GET index' do
    it 'has a 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe 'Show blog' do
    it 'shows the blog' do
      get :show, params: { id: 2 }
      expect(response.status).to eq(200)
    end
  end

  describe 'New blog' do
    it 'shows the new blog' do
      get :new
      expect(response.status).to eq(200)
    end
  end

  describe 'create blog' do
    it 'creates the blog' do
      post :create,
           params: { blog: { title: 'yoo', read_time: '02:00', image: '', body: 'qwehjfdsb', category_id: 1,
                             member_id: 7 } }
      expect(response.status).to eq(302)
    end
  end

  describe 'update blog' do
    it 'updates the blog' do
      # patch :update,  params: params

      patch :update,
            params: { id: 2,
                      blog: { title: 'yoo', read_time: '02:00', image: '', body: 'qwehjfdsb', category_id: 1,
                              member_id: 7 } }

      expect(response.status).to eq(302)
    end
  end

  describe 'destroy blog' do
    it 'destroys the blog' do
      # patch :update,  params: params

      delete :destroy, params: { id: 2 }

      expect(response.status).to eq(302)
    end
  end
end
