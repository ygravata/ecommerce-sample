class Product < ApplicationRecord
  before_save :capitalize_name

  belongs_to :user
  has_many :cart_products

  validates :name, presence: true
  validates :category, presence: true
  # validates :description, presence: true, length: { maximum: 250 , message:  "Maximum of 250 characters" }
  # validates :price, presence: true
  # validates :quantity, presence: true


  def capitalize_name
    self.name = self.name.titleize
  end

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :brand, :category, :desc2 ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
