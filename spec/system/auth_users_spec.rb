# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'AuthUsers', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'log in the user' do
    visit '/'

    fill_in 'Email', with: 'kartikbokadia@gmail.com'
    fill_in 'Password', with: '123'

    click_button 'Log in'

    expect(page).to have_content 'Members'
  end
end
