class Task
  def initialize(name, list_id)
    @name = name
    @list_id = list_id
  end

  def name
    @name
  end

  def list_id
    @list_id
  end

def save
  DB.exec("INSERT INTO tasks (name, list_id) VALUES ('#{@name}', #{@list_id});")
  end

def Task.all
  results = DB.exec("SELECT * FROM tasks;")
  tasks = []
  results.each do |result|
    name = result['name']
    list_id = result['list_id'].to_i
    tasks << Task.new(name, list_id)
    end
    tasks
  end

  def Task.delete(index)
  DB.exec("DELETE FROM tasks WHERE id = index.to_i;")
  end


  def ==(another_task)
    self.name == another_task.name && self.list_id == another_task.list_id
  end
end
