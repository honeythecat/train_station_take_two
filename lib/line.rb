class Line
  attr_reader(:line_name, :id)

  define_method(:initialize) do |attributes|
    @line_name = attributes.fetch(:line_name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_lines = DB.exec("SELECT * FROM lines;")
    lines = []
    returned_lines.each() do |line|
      line_name = line.fetch("line_name")
      id = line.fetch("id").to_i()
      lines.push(Line.new({:line_name => line_name, :id => id}))
    end
    lines
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO lines (line_name) VALUES ('#{@line_name}') RETURNING id;")
    id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_line|
    self.line_name().==(another_line.line_name()).&(self.id().==(another_line.id()))
  end



end