class Place < ApplicationRecord
  has_many :entries
  # talks to the "places" table
end
