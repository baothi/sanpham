class Product < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  validates :name,:price,:description,:avatar, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :name, uniqueness: true
  validates :avatar, allow_blank: true, format: {
            with:
            %r{\.(gif|jpg|png)\Z}i,
            message: 'must be a URL for GIF, JPG or PNG image.'
            }
  # byebug
  # scope :search ,-> (text) {where("name like ?","%#{text}%")}
  # def self.search(text)
  #   if text
  #     where('name LIKE ?', "%#{text}%")
  #   else
  #     puts "1111111111111111111111111111111"
  #   end
  # end

  private
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
end
