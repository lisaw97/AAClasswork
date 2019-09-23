require 'sqlite3'
require 'singleton'

class QuestionsDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Questions
  attr_accessor :id, :title, :body, :user_id

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM questions")
    data.map {|questions| Questions.new(question)}
  end

  def self.find_by_author_id(user_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_id = ?
    SQL
    return nil unless data.length > 0
    data.map {|d| Questions.new(d)}
  end

  def initialize(question)
    @id = question['id']
    @title = question['title']
    @body = question['body']
    @user_id = question['user_id']
  end

  def update
    raise "#{self} not in database" unless self.id
    QuestionsDBConnection.instance.execute(<<-SQL, self.title, self.body, self.user_id, self.id)
      UPDATE
        questions
      SET
        title = ?, body = ?, user_id = ?
      WHERE
        id = ?
    SQL
  end
  
  def insert
    raise "#{self} already in database" if self.id
    QuestionsDBConnection.instance.execute(<<-SQL, self.title, self.body, self.user_id)
      INSERT INTO
        questions (title, body, user_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = QuestionsDBConnection.instance.last_insert_row_id
  end

    def self.find_by_id(id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    return nil unless data.length > 0
    Questions.new(data.first)
  end

end
###############################################

class Users
  attr_accessor :id, :fname, :lname

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM users")
    data.map {|user| Users.new(user)}
  end

  def self.find_by_id(id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return nil unless data.length > 0
    Users.new(data.first)
  end

  def initialize(user)
    @id = user['id']
    @fname = user['fname']
    @lname = user['lname']
  end

  def update
    raise "#{self} not in database" unless self.id
    QuestionsDBConnection.instance.execute(<<-SQL, self.fname, self.lname, self.id)
      UPDATE
        users
      SET
        fname = ?, lname = ?
      WHERE
        id = ?
    SQL
  end
  
  def insert
    raise "#{self} already in database" if self.id
    QuestionsDBConnection.instance.execute(<<-SQL, self.fname, self.lname)
      INSERT INTO
        users (fname, lname)
      VALUES
        (?, ?, ?)
    SQL
    self.id = QuestionsDBConnection.instance.last_insert_row_id
  end

  def authored_questions
    Questions.find_by_author_id(self.id)
  end

  def self.find_by_name(lname)
    user = QuestionsDBConnection.instance.execute(<<-SQL, lname)
      SELECT
        *
      FROM
        users
      WHERE
        lname = ?
    SQL
    return nil if user.length < 1
    user.map { |usr| Users.new(usr) }
  end
end

#######################################################

# question_follows

class QuestionFollows 

  attr_reader :id, :user_id, :question_id

  def self.all
    data = QuestionsDBConnection.instance.execute("SELECT * FROM question_follows")
    data.map {|qf| QuestionFollows.new(qf)}
  end

  def initialize(qf)
    @id = qf['id']
    @user_id = qf['user_id']
    @question_id = qf['question_id']
  end

  def self.find_by_id(qf_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, qf_id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL
    return nil if data.length == 0
    QuestionFollows.new(data.first)
  end

  def self.followers_for_question_id(q_id)
    data = QuestionsDBConnection.instance.execute(<<-SQL, q_id)
      SELECT
        users.*
      FROM
        question_follows
      JOIN
        users ON question_follows.user_id = users.id
      WHERE
        question_follows.question_id = ?
    SQL
    return nil if data.length == 0
    data.map { |row| Users.new(row) }
  end

  def self.most_followed_questions(n)
    data = QuestionsDBConnection.instance.execute(<<-SQL, n)
      SELECT
        question_id
      FROM
        question_follows 
      GROUP BY
        question_id
      ORDER BY
        COUNT(*) DESC LIMIT ?
      SQL

      return nil if data.length == 0
      data.map {|row| Questions.find_by_id(row)}
      
  end
end