# frozen_string_literal: true

# This class validates if a VIN's "check code" is valid.
#
# It can also suggest a valid VIN,
# The suggested VIN will include the valid "check code",
# only 17 chars and all chars in upper case.
class VinChecker
  def self.valid?(vin)
    return false if vin.nil?

    vin[8].to_c == check_digit(vin)
  end

  def self.valid_suggestion(vin)
    return if vin.nil? || vin.size < 17

    suggestion = vin.slice(0..16).upcase
    chk_digit = check_digit(suggestion)

    return if chk_digit.nil?

    suggestion[8] = chk_digit.to_s
    suggestion
  end

  def self.check_digit(vin)
    map = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'X']
    weights = [8, 7, 6, 5, 4, 3, 2, 10, 0, 9, 8, 7, 6, 5, 4, 3, 2]

    sum = vin.chars.each_with_index.reduce(0) do |memo, (char, i)|
      memo + transliterate(char) * weights[i]
    end

    map[sum % 11]
  rescue StandardError
    nil
  end

  def self.transliterate(char)
    '0123456789.ABCDEFGH..JKLMN.P.R..STUVWXYZ'.index(char) % 10
  end

  private_class_method :check_digit, :transliterate
end
