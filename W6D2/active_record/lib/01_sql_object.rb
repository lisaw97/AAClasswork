require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject

  def self.columns
    return @columns if !@columns.nil?
    @columns = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name};
    SQL
    @columns.first.map! { |name| name.to_sym}
  end

  def self.finalize!

    self.columns.each do |column|

      define_method(column) do
        self.attributes[column]
      end

      define_method("#{column}=") do |value|
        self.attributes[column] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name || self.to_s.tableize
  end

  def self.all
    
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    col = self.class.columns
    params.each do |attr_name, value|
      if col.include?(attr_name)
        self.class.send("#{attr_name}=", value)
      end
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
