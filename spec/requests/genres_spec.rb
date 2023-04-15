# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Genres' do
  describe 'GET /index' do
    let!(:genres) { create_list(:genre, 4) }

    it 'show all genres' do
      get genres_path
      expect(response).to render_template(:index)
      expect(response.body).to include(genres[0].name, genres[1].name, genres[2].name)
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
