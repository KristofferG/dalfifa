class Match < ActiveRecord::Base
  default_scope {order(created_at: 'ASC')}
  belongs_to :cup
  has_and_belongs_to_many :players
  has_many :results, dependent: :destroy
  accepts_nested_attributes_for :cup, :players
end
