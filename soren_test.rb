require_relative "classes"
require_relative "soren"
require 'minitest/autorun'

class TestSoren < MiniTest::Unit::TestCase
  def test_soren
    assert(NullObject)
    assert_equal(NullObject, NilFree.new.nil_returner )
    assert_equal(NullObject, NilFree.class_nil_returner )
    assert_equal(4, NilFree.new.addition(1, 3) )
    assert_equal(NullObject, NilFree.new.addition(nil, 3) )
    assert_equal(NullObject, NilFree.new.addition(nil, nil) )
    assert_equal(NullObject, NilFree.new.addition(2, nil) )

    assert_equal(4, NilFree.class_addition(1, 3) )
    assert_equal(NullObject, NilFree.class_addition(nil, 3) )
    assert_equal(NullObject, NilFree.class_addition(nil, nil) )
    assert_equal(NullObject, NilFree.class_addition(2, nil) )

    assert_equal(NullObject, NilFree.new.new_string_with_block("Soren"))
    assert_equal("Hi, Soren", NilFree.new.new_string_with_block("Soren"){|name| "Hi, #{name}" })

    assert_equal(NullObject, NilFree.new_string_with_block("Soren"))
    assert_equal("Hi, Soren", NilFree.new_string_with_block("Soren"){|name| "Hi, #{name}" })
  end

end
