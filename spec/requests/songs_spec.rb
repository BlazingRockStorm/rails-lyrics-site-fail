# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Songs' do
  describe 'GET #index' do
    let!(:songs) { create_list(:song, 4) }

    it 'show all songs' do
      get songs_path
      expect(response).to render_template(:index)
      expect(response.body).to include(songs[0].name, songs[1].name, songs[2].name)
    end
  end

  describe 'GET #show' do
    let(:song) { create(:song) }

    it "show a song's json" do
      get song_path(song)
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('application/json')
      expect(response.body).to include(song.name)
      expect(response.body).to include(song.lyric)
    end
  end

  describe 'GET #new' do
    it 'leads to new song page' do
      get new_song_path
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let(:genre) { create(:genre) }

    it 'creates new song' do
      post songs_path, params: { song: { name: 'New song', lyric: "Song's lyric", genre: genre } }
      get songs_path
      expect(response.body).to include('New song')
    end
  end

  describe 'GET #edit' do
    let(:song) { create(:song) }

    it 'leads to edit song page' do
      get edit_song_path(song)
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT/PATCH #update' do
    let(:genre) { create(:genre) }
    let(:song) { create(:song) }

    it "edit the song's name" do
      put song_path(song), params: { id: song.id, song: { name: 'Editted song', lyric: "Editted song's lyric", genre: genre } }
      expect(response).to redirect_to song_path(song)
      get song_path(song)
      expect(response.body).to include('Editted song')
      expect(response.body).to include("Editted song's lyric")
    end
  end

  describe 'DELETE #delete' do
    let(:song) { create(:song) }

    it 'leads to edit song page' do
      delete song_path(song), params: { id: song.id }
      expect(response).to redirect_to songs_path
      get songs_path
      expect(response.body).not_to include(song.name)
      expect(response.body).not_to include(song.lyric)
    end
  end
end
