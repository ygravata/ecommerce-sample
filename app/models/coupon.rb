class Coupon < ApplicationRecord
require 'securerandom'

  validates :coupon_code, presence: true
  validates_uniqueness_of :coupon_code
  validates :discount, presence: true

  private

  def self.generate_coupon
    # Random, unguessable number as a base20 string
    #  .reverse ensures we don't use first character (which may not take all values)
    @raw_string = SecureRandom.random_number( 2**80 ).to_s( 8 ).reverse
    # e.g. "3ecg4f2f3d2ei0236gi"

    @long_code = @raw_string.tr( '0123456789abcdefghij', '234679QWERTYUPADFGHX' )
    # Convert Ruby base 20 to better characters for user experience
    # e.g. "6AUF7D4D6P4AH246QFH"

    @short_code = @long_code[0..3] + '-' + @long_code[4..7]
    # Format the code for printing
    # e.g. "6AUF-7D4D-6P4A"

    Coupon.create!(coupon_code: @short_code, discount: 5)

  end

end
