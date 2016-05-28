class Result < ActiveRecord::Base
  default_scope {order(created_at: 'ASC')}
  serialize :opps
  belongs_to :match
  belongs_to :player
  accepts_nested_attributes_for :match, :player
end
