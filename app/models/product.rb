class Product < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  validates :name,:price,:description,:avatar, presence: true
  validates :price, inclusion: { in: 0..9 }
  # byebug
  scope :search ,-> (text) {where("name like ?","%#{text}%")}
  # def self.search(text)
  #   if text
  #     where('name LIKE ?', "%#{text}%")
  #   else
  #     puts "1111111111111111111111111111111"
  #   end
  # end
end
