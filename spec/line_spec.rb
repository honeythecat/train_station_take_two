require('spec_helper')

describe(Line) do
  describe(".all") do
    it("is empty at first") do
      expect(Line.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves a line") do
      test_line = Line.new({:line_name => "red", :id => nil})
      test_line.save()
      expect(Line.all()).to(eq([test_line]))
    end
  end

  describe("#==") do
    it("is the same line if it has the same line name") do
      test_line = Line.new({:line_name => "red", :id => nil})
      test_line2 = Line.new({:line_name => "red", :id => nil})
      expect(test_line).to(eq(test_line2))
    end
  end

  describe("#line_name") do
    it("tells you the line name") do
      test_line = Line.new({:line_name => "Crabby Complex", :id => nil})
      # test_line.save()
      expect(test_line.line_name()).to(eq("Crabby Complex"))
    end
  end

  describe("#id") do
    it("sets an id when you save it") do
      test_line = Line.new({:line_name => "Crabby Complex", :id => nil})
      test_line.save()
      expect(test_line.id()).to(be_an_instance_of(Fixnum))
    end
  end
end