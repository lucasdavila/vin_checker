# frozen_string_literal: true

require './vin_checker'
require './vin_decoder'

vin = ARGV[0]
valid = VinChecker.valid?(vin)
result = valid ? 'VALID' : 'INVALID'

puts "Provided VIN: #{vin}"
puts "Check Digit: #{result}"

if valid
  puts 'This looks like a VALID vin!'
  puts 'Decoded data:'

  data = VinDecoder.decode(vin)
  data.each { |name, value| puts "\t#{name}: #{value}" }
else
  valid_suggestion = VinChecker.valid_suggestion(vin)

  puts "Suggested VIN(s):\n\n\t* #{valid_suggestion}" unless valid_suggestion.nil?
end
