require_relative "toy_class"
require_relative "soren"
require 'minitest/autorun'

class TestSoren < MiniTest::Unit::TestCase
  def test_soren
    assert(NullObject)
    assert_equal(NullObject, Toy.new.nil_returner )
    assert_equal(NullObject, Toy.class_nil_returner )
  end

end
