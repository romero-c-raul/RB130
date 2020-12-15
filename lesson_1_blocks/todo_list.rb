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


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

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
  
  def size
    todos.size
  end
  
  def first
    todos.first.title
  end
  
  def last
    todos.last.title
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
    todos.fetch(integer).done!
  end
  
  def mark_undone_at(integer)
    todos.fetch(integer).undone!
  end
  
  def done!
    todos.each do |current_todo|
      current_todo.done!
    end
  end
  
  protected
  attr_accessor :todos

end

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
#list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# <<
# same behavior as add

# ---- Interrogating the list -----

# size
list.size                       # returns 3

# first
list.first                      # returns todo1, which is the first item in the list

# last
list.last                       # returns todo3, which is the last item in the list

#to_a
list.to_a                      # returns an array of all items in the list

#done?
list.done?                     # returns true if all todos in the list are done, otherwise false

# ---- Retrieving an item in the list ----

# item_at
#list.item_at                    # raises ArgumentError
list.item_at(1)                 # returns 2nd item in list (zero based index)
#list.item_at(100)               # raises IndexError

# ---- Marking items in the list -----

# mark_done_at
#list.mark_done_at               # raises ArgumentError
list.mark_done_at(1)            # marks the 2nd item as done
#list.mark_done_at(100)          # raises IndexError

# mark_undone_at
#list.mark_undone_at             # raises ArgumentError
list.mark_undone_at(1)          # marks the 2nd item as not done
#list.mark_undone_at(100)        # raises IndexError

# done!
list.done!                      # marks all items as done
