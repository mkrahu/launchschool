require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"

Minitest::Reporters.use!

require_relative 'todo_list'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_title
    assert_equal(@list.title, "Today's Todos")
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    shifted_todo = @list.shift
    assert_equal(shifted_todo, @todo1)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    pop_todo = @list.pop
    assert_equal(pop_todo, @todo3)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    refute(@list.done?)

    @todo1.done = true
    refute(@list.done?)

    @todo3.done = true
    refute(@list.done?)

    @todo2.done = true
    assert(@list.done?)
  end

  def test_type_error
    assert_raises(TypeError) { @list.add(1) }
    assert_raises(TypeError) { @list.add('task') }
  end

  def test_shovel
    todo = Todo.new('Walk the dog')
    @list << todo
    @todos << todo

    assert_equal(@todos, @list.to_a)
  end

  def test_add_alias
    todo = Todo.new('Feed the cat')
    @list.add(todo)
    @todos << todo

    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(3) }

    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(3) }

    @list.mark_done_at(1)

    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_done_at(3) }

    @todos.each { |todo| todo.done! }
    @list.mark_undone_at(1)

    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
    assert_equal(true, @todo3.done?)
  end

  def test_done!
    @list.done!

    assert_equal(true, @todos.all? { |todo| todo.done? })
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(3) }

    @list.remove_at(1)
    assert_equal(2, @list.size)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)

    @todo1.done!

    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)

    @list.done!

    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each
    result = []
    @list.each { |todo| result << todo }
    assert_equal([@todo1, @todo2, @todo3], result.to_a)

    @list.each { |todo| todo.done! }
    assert_equal(true, @list.done?)
  end

  def test_each_returns_original_list
    result = @list.each { |todo| nil }
    assert_same(@list, result)
  end

  def test_select
    @todo1.done!
    result = @list.select { |todo| todo.done? }
    list = TodoList.new(@list.title)
    list.add(@todo1)

    assert_instance_of(TodoList, result)
    assert_equal(list.to_s, result.to_s)
    assert_equal(false, @list.equal?(result))
  end

  def test_find_by_title
    @list.add(@todo1)
    assert_equal(@list.find_by_title(@todo1.title), @todo1)
    assert_equal(@list.find_by_title(@todo2.title), @todo2)
  end

  def test_all_done
    @todo1.done!
    @todo3.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)
    list.add(@todo3)

    assert_equal(list.title, @list.title)
    assert_equal(list.to_a, @list.all_done.to_a)
  end

  def test_all_not_done
    @todo1.done!
    @todo3.done!
    list = TodoList.new(@list.title)
    list.add(@todo2)

    assert_equal(list.title, @list.title)
    assert_equal(list.to_a, @list.all_not_done.to_a)
  end

  def test_mark_done
    @list.mark_done('Clean room')

    assert_equal(true, @todo2.done?)
    assert_equal(false, @todo1.done?)
    assert_equal(false, @todo3.done?)
  end

  def test_mark_all_done
    @list.mark_all_done

    assert_equal(true, @list.done?)
  end

  def test_mark_all_undone
    @todos.each { |todo| todo.done! }
    @list.mark_all_undone

    assert_equal([@todo1, @todo2, @todo3], @list.all_not_done.to_a)
  end
end
