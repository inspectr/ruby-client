require 'minitest/autorun'
require 'inspectr'

class InspectrTest < Minitest::Test
  def test_talk
    assert_equal "I am Inspectr", Inspectr::Init.talk
  end
end
