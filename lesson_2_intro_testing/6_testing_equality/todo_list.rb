# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  # rest of class needs implementation
  
  def add(other_list)
    raise TypeError, "Can only add Todo objects" unless other_list.class == Todo
    @todos << other_list 
  end
  
  alias_method :<<, :add
  
  def size
    todos.size
  end
  
  def first
    todos.first
  end
  
  def last
    todos.last
  end
  
  def to_a
    todos.map do |current_todo|
      current_todo
    end
  end
  
  def done?
    todos.all? do |current_todo|
      current_todo.done == true
    end
  end
  
  def item_at(integer)
    todos.fetch(integer)
  end
  
  def mark_done_at(integer)
    item_at(integer).done!
  end
  
  def mark_undone_at(integer)
    item_at(integer).undone!
  end
  
  def done!
    todos.each do |current_todo|
      current_todo.done!
    end
  end
  
  def shift
    todos.shift
  end
  
  def pop
    todos.pop
  end
  
  def remove_at(integer)
    current_todo = item_at(integer)
    todos.delete_at(integer)
    current_todo
  end
  
  def to_s
    text = "---- #{title} ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end
  
  def each
    counter = 0
    
    until counter == todos.size do
      yield(todos[counter])
      counter += 1
    end
    self
  end
  
  def select
    new_list = TodoList.new("New Todo List!")
    each do |current_todo|
      new_list << current_todo if yield(current_todo)
    end
    new_list
  end
  
  def find_by_title(string)
    select { |todo| todo.title == string }.first
  end
  
  def all_done
    select { |todo| todo.done? }
  end
  
  def all_not_done
    select { |todo| todo.done? == false }
  end
  
  def mark_done(string)
    each do |todo|
      if todo.title == string
        todo.done!
        return
      end
    end
  end
  
  def mark_all_done
    each { |todo| todo.done! }
  end
  
  def mark_all_undone
    each { |todo| todo.undone! }
  end
  
  protected
  attr_accessor :todos

end
