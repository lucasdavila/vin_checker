# frozen_string_literal: true

require 'json'

# This class decode some data from a VIN, like Make and Model year.
class VinDecoder
  @common_wmis = JSON.parse(File.read('./config/common_wmis.json'))
  @base_year = 1980
  @years_interval = 30
  @year_codes = 'ABCDEFGHJKLMNPRSTVWXY123456789'

  def self.decode(vin)
    return if vin.nil? || vin.size < 17

    {
      make: make(vin),
      model_year: model_year(vin)
    }
  end

  def self.make(vin)
    @common_wmis[vin[0..2]] || @common_wmis[vin[0..1]]
  end

  def self.model_year(vin)
    year = @year_codes.index(vin[9])
    is_new_model = vin[6].match?(/[[:alpha:]]/)
    base_year = is_new_model ? @base_year + @years_interval : @base_year

    base_year + year
  end

  private_class_method :make, :model_year
end
