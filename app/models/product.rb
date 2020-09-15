class Product < ApplicationRecord
  before_save :titleize_name_and_category

  belongs_to :user
  has_many :cart_products

  validates :name, presence: true
  validates :category, presence: true
  validates :desc1, presence: true
  validates :desc2, presence: true

  private

  def self.active_products
    Product.where(active: true)
  end

  def self.categories
    Product.pluck(:category).uniq
  end

  def self.brands
    Product.pluck(:brand).uniq
  end

  def titleize_name_and_category
    self.name = self.name.titleize
    self.category = self.category.titleize
  end

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :brand, :category, :desc2, :price ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
