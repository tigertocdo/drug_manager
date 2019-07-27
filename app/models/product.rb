class Product < ApplicationRecord
  belongs_to :brand_category
  has_one_attached :image

  has_many :options, dependent: :destroy, inverse_of: :product

  accepts_nested_attributes_for :options, reject_if: :all_blank, allow_destroy: true
  validates :name, presence: true, uniqueness: true
  def self.resize_product(product)
    attachment_path = product.path
    image = MiniMagick::Image.open(attachment_path)
    image.resize "320x320"
    image.write attachment_path
    img_new = Rack::Test::UploadedFile.new(attachment_path)
    img_new
  end

end
