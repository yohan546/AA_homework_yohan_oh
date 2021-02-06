require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def self.find_by_title(title)
    play = PlayDBConnection.instance.execute(<<-SQL, title)

      SELECT 
        *
      from 
        plays
      where 
        title = ?
      SQL
    return nil unless play.length > 0 

    Play.new(play.first)
  end

  def self.find_by_playwright(name)
    playwright = Playwright.find_by_name(name)
   

    plays = PlayDBConnection.instance.execute(<<-SQL, playwright.id)
      select 
        *
      from 
        plays
      where 
        playwright_id = ?
      SQL

      plays.map {|play| Play.new(play)}
  end



  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end

class Playwright 
  attr_accessor :id, :name, :birth_year 

  def self.all 
    data = PlayDBConnection.instance.execute("select * from playwrights")
    data.map { |datum| Playwright.new(datum) }
  end

  def self.find_by_name(name)
    person = PlayDBConnection.instance.execute(<<-SQL, name)
      select
        *
      from 
        playwrights
      where 
        name = ?
    SQL
    return nil unless person.length > 0 

    Playwright.new(person.first)
  end

  def initialize(wrights)
    @id = wrights['id']
    @name = wrights['name']
    @birth_year = wrights['birth_year']
  end

  def create
 
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year, self.id)

      insert into 
        playwrights (name= ?, birth_year = ?)
      values 
        (?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update 
    
    PlayDBConnection.instance.execute(<<-SQL, self.name, self.birth_year, self.id)

      update
        playwrights 
      set 
        name = ?, birth_year = ?
      where 
        id = ?
    SQL
  end

  def get_plays 
    plays = PlayDBConnection.instance.execute(<<-SQL, self.id)
      select
        *
      FROM 
        plays
      where 
        playwright_id = ?
    SQL

    plays.map { |play| Play.new(play)}
  end

end