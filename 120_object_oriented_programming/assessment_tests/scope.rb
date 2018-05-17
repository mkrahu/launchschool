# scope.rb

  module TestModule
    MODULE_CONSTANT = 'module constant'

    @@module_variable = 'module_variable'

    def test_mixin_method
      test_sub_class_instance_method
    end
  end

  class TestClass
    @@class_variable = 'variable'
    include TestModule

    TEST_CONSTANT = 'Constant'

    def self.test_class_method
      puts "I am a class method"
    end


    def test_instance_method
      puts "I am a test instance method"
      puts MODULE_CONSTANT
      puts @@module_variable 
    end
  end

  class TestSubClass < TestClass
    def test_sub_class_instance_method
      puts TEST_CONSTANT
    end
  end

  TestSubClass.test_class_method
  test_sub_class = TestSubClass.new
  test_sub_class.test_instance_method
  test_sub_class.test_mixin_method