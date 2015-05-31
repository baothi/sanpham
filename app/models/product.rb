class Product < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  validates :name,:price,:description,:avatar, presence: true
  validates :price, inclusion: { in: 0..9 }
  scope :search ,-> (name){where("name like ?","#%{text}%")}
end
