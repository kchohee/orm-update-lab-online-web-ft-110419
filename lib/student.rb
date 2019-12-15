require_relative "../config/environment.rb"

class Student
  attr_accessor :name, :grade
  attr_reader :id
  def initialize(name, grade, id = nil)
    @name = name
    @grade = grade
    @id = id
  end
  def self.create_table
    sql = <<-SQL
    CREATE TABLE IF NOT EXISTS students (
      id INTEGER PRIMARY KEY,
      name TEXT,
      grade INTEGER
      )
      SQL
    DB[:conn].execute(sql)
  end
  def self.drop_table
    sql = <<-SQL
    DROP TABLE students
    SQL
    DB[:conn].execute(sql)
  end
  def save
    sql = <<-SQL
    INSERT INTO students(
      name, grade
    )
    VALUES (
      ?,?
    )
    SQL
    DB[:conn].execute(sql, self.name, self.grade)
    @id = DB[:conn].execute("Sellect last_insert_rowid() From students")
  end
  def self.create(name:, grade:)

  end
  def self.new_from_db

  end
  def self.find_by_name

  end
  def update

  end
end
