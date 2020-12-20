require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
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
  
  # Tests go here. Must start with "test_"
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
    return_value = @list.shift
    assert_equal(@todo1, return_value)
    assert_equal([@todo2, @todo3], @list.to_a)
  end
  
  def test_pop
    return_value = @list.pop
    assert_equal(@todo3, return_value)
    assert_equal([@todo1, @todo2], @list.to_a)
  end
  
  def test_done_question
    assert_equal(@list.done?, false)
    @list.mark_all_done
    assert_equal(@list.done?, true)
  end
  
  def test_raise_type_error
    assert_raises(TypeError) { @list.add('string') }
    assert_raises(TypeError) { @list.add(5) }
  end
  
  def test_shovel_method
    new_element = Todo.new("New thing to do")
    @list << new_element
    @todos << new_element
    assert_equal(@list.to_a, @todos)
  end
  
  def test_add_method
    new_element = Todo.new("New thing to do")
    @list.add(new_element)
    @todos << new_element
    assert_equal(@list.to_a, @todos)
  end
  
  def test_item_at
    list_item1 = @list.item_at(1)
    list_item2 = @list.item_at(2)
    assert_equal(list_item1, @todo2)
    assert_equal(list_item2, @todo3)
    assert_raises(IndexError) { @list.item_at(5) }
  end
  
  def test_mark_done_at
    assert_equal(@todo1.done?, false )
    @list.mark_done_at(0)
    assert_equal(@todo1.done?, true )
    
    assert_raises(IndexError) { @list.mark_done_at(1000) }
  end
  
  def test_mark_undone_at
    @list.mark_all_done
    @list.mark_undone_at(1)
    
    assert_equal(@todo1.done?, true)
    assert_equal(@todo2.done?, false)
    assert_raises(IndexError) { @list.mark_done_at(1000) }
  end
  
  def test_done_exclamation
    @todos.each { |todo| assert_equal(todo.done?, false) }
    @list.done!
    @todos.each { |todo| assert_equal(todo.done?, true) }
  end
  
  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    
    removed_item = @list.remove_at(1)
    assert_equal(removed_item, @todo2)
    assert_equal([@todo1, @todo3], @list.to_a)
  end
  
  
  def test_to_s
    output = <<-OUTPUT.chomp.gsub(/^\s+/, "")
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end
  
  def test_to_s_one_done
    @list.mark_done_at(1)
    
    output = <<-OUTPUT.chomp.gsub(/^\s+/, "")
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    OUTPUT
    
    assert_equal(output, @list.to_s)
  end
  
  def test_to_s_all_done
    output = <<-OUTPUT.chomp.gsub(/^\s+/, "")
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    
    @list.mark_all_done
    assert_equal(output, @list.to_s)
  end
  
  def test_each_iteration
    counter = 0
    @list.each do |current_todo|
      assert_equal(current_todo, @todos[counter])
      counter += 1
    end
  end
  
  def test_each_return_value
    return_value = @list.each { |todo| todo }
    assert_equal(return_value, @list)
  end
  
  def test_select
    selection1 = @list.select { |todo| todo.title == @todo1.title }
    assert_equal(selection1.to_a, [@todo1])
  end
  
  def test_title
    assert_equal(@list.item_at(0).title, "Buy milk")
  end
  
end