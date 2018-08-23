require 'test_helper'

class CategoryTest  < ActiveSupport::TestCase
  
  def setup
   @category = Category.new(name: "sport")
  end 
  
  test "category should be valid" do
    assert @category.valid?
  end
 
  test "should not be valid" do
    @category.name = " "
  assert_not @category.valid?
  end
  
  test "should  be unique " do 
    @category.save
    category2=Category.new(name: "sport")
    assert_not category2.valid?
  end 
 
  
  test "should not be too long " do
    @category.name = "a" * 26
    assert_not @category.valid?
  end
  
  test "should not be to short" do
    @category.name = "aa"
    assert_not @category.valid?
  end 
  
    
  
end