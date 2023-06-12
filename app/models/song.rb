# frozen_string_literal: true

class Song < ApplicationRecord
  belongs_to :genre, dependent: :destroy
end
