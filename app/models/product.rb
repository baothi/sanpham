class Product < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  validates :name,:price,:description,:avatar, presence: true
  validates :price, inclusion: { in: 0..9 }
  # scope :search_name ,-> (name){where("name like ?","#{name}%")}
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
