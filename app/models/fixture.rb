class Fixture < ActiveRecord::Base
  serialize :coop
  belongs_to :cup
  belongs_to :player
end
