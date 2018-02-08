require('minitest/autorun')
require('minitest/rg')

require_relative('../location_counter')

class TestLocationCounter < MiniTest::Test
  def setup()
    @location_counter = LocationCounter.new()
    @json_file = JSON.parse(File.read('./../public/test.json'))

  end

  def test_json_has_size()
    assert_equal(2, @json_file.length())
  end

end
