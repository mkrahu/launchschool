# todo_list.rb

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
    "[#{ done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError, 'can only add Todo objects' unless todo.instance_of? Todo
    todos << todo
  end

  def <<(todo)
    add(todo)
  end

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def item_at(index)
    todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    todos.delete(item_at(index))
  end

  def done?
    todos.all? { |todo| todo.done? }
  end

  def done!
    todos.each_index { |index| mark_done_at(index) }
  end

  def to_s
    text = "---- #{title} ----\n"
    text << todos.map { |todo| todo.to_s }.join("\n")
    text
  end

  def to_a
    todos
  end

  def each
    todos.each { |todo| yield(todo) }
    self
  end

  def select
    results = TodoList.new(title)
    each { |todo| results << todo if yield(todo) }
    results
  end

  def find_by_title(title)
    select { |todo| todo.title == title }.first
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(title)
    find_by_title(title) && find_by_title(title).done!
  end

  def mark_all_done
    each { |todo| todo.done! }
  end

  def mark_all_undone
    each { |todo| todo.undone! }
  end

  private
  attr_accessor :todos
end

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
todo4 = Todo.new("LaunchSchool")
p list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
list.add(todo4)
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

p list.each { |todo| }

#list.mark_done_at(1)
#p list.select { |todo| todo.done? }
# # <<
# # same behavior as add

# # ---- Interrogating the list -----

# # size
# list.size                       # returns 3

# # first
# list.first                      # returns todo1, which is the first item in the list

# # last
# list.last                       # returns todo3, which is the last item in the list

# # ---- Retrieving an item in the list ----

# # item_at
# #list.item_at                    # raises ArgumentError
# list.item_at(1)                 # returns 2nd item in list (zero based index)
# #list.item_at(100)               # raises IndexError

# # ---- Marking items in the list -----

# # mark_done_at
# #list.mark_done_at               # raises ArgumentError
list.mark_done_at(1)            # marks the 2nd item as done
# #list.mark_done_at(100)          # raises IndexError

# # mark_undone_at
# #list.mark_undone_at             # raises ArgumentError
# list.mark_undone_at(1)          # marks the 2nd item as not done,
# #list.mark_undone_at(100)        # raises IndexError

# # ---- Deleting from the the list -----

# # shift
# list.shift                      # removes and returns the first item in list

# # pop
# list.pop                        # removes and returns the last item in list

# list
# # remove_at
# #list.remove_at                  # raises ArgumentError
# list.remove_at(1)               # removes and returns the 2nd item
# #list.remove_at(100)             # raises IndexError

# # ---- Outputting the list -----

# # to_s
# puts list                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym