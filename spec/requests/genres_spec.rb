# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Genres' do
  describe 'GET /index' do
    it 'show all genres' do
      get '/genres'
      expect(response).to render_template(:index)
    end
  end

  # describe 'GET /show' do
  # end

  # describe 'GET /new' do
  # end

  # describe 'POST /create' do
  # end

  # describe 'GET /edit' do
  # end

  # describe 'PUT/PATCH /update' do
  # end

  # describe 'DELETE /delete' do
  # end
end
