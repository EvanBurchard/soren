require_relative "classes"
require_relative "soren"
require 'minitest/autorun'

class TestSoren < MiniTest::Unit::TestCase
  def test_creates_null_object
    assert(NullObject)
  end

  def test_no_nil
    assert_equal(NullObject, NilFree.new.nil_returner )
    assert_equal(NullObject, NilFree.class_nil_returner )
  end

  def test_arguments
    assert_equal(4, NilFree.class_addition(1, 3) )
    assert_equal(NullObject, NilFree.class_addition(nil, 3) )
    assert_equal(NullObject, NilFree.class_addition(nil, nil) )
    assert_equal(NullObject, NilFree.class_addition(2, nil) )
  end

  def test_blocks
    assert_equal(NullObject, NilFree.new.new_string_with_block("Soren"))
    assert_equal("Hi, Soren", NilFree.new.new_string_with_block("Soren"){|name| "Hi, #{name}" })
    assert_equal(NullObject, NilFree.new_string_with_block("Soren"))
    assert_equal("Hi, Soren", NilFree.new_string_with_block("Soren"){|name| "Hi, #{name}" })
  end

  def test_method_missing
    assert_equal(NullObject, NilFree.new.not_a_real_method("Soren"))
    assert_equal(["Soren"], NilFree.new.should_return_args("Soren"))

    assert_equal(NullObject, NilFree.not_a_real_method("Soren"))
    assert_equal(["Soren"], NilFree.should_return_args("Soren"))
  end
end
