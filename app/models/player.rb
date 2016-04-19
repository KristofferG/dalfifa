class Player < ActiveRecord::Base
  default_scope {order(created_at: 'ASC')}
  has_many :fixtures
  has_many :results
  has_and_belongs_to_many :matches
  has_and_belongs_to_many :cups
  mount_uploader :avatar, AvatarUploader
end
