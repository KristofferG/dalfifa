class Player < ActiveRecord::Base
  has_many :fixtures
  has_many :results
  has_and_belongs_to_many :matches
  has_and_belongs_to_many :cups
end
