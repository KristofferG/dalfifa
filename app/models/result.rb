class Result < ActiveRecord::Base
  serialize :opps
  belongs_to :match
  belongs_to :player
  accepts_nested_attributes_for :match, :player
end
