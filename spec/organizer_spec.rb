  require ('spec_helper')

describe (Organizer) do
  describe('.all') do
    it("shows all organizers") do
      expect(Organizer.all()).to(eq([]))
    end
  end

  describe('#expense_id') do
    it("it returns the expense_id provided") do
      organizer_test = Organizer.new({:expense_id => 1, :category_id => nil, :id => nil})
      expect(organizer_test.expense_id()).to(eq(1))
    end
  end

  describe('#category_id') do
    it("it returns the category_id provided") do
      organizer_test = Organizer.new({:expense_id => 1, :category_id => 2, :id => nil})
      expect(organizer_test.category_id()).to(eq(2))
    end
  end

  describe('#save') do
    it("sends a new organizer to the table") do
      category_test = Category.new({:description => "food", :id => nil})
      category_test.save()
      expense_test = Expense.new({:description => "hamburger", :amount => 10.45, :date => "1889-12-12", :id => nil})
      expense_test.save()
      organizer_test = Organizer.new({:expense_id => expense_test.id(), :category_id => category_test.id(), :id => nil})
      organizer_test.save()
      expect(Organizer.all()).to(eq([organizer_test]))
    end
  end

  describe("#==") do
    it("alters == to make things equal") do
      organizer_test = Organizer.new({:expense_id => 1, :category_id => 3, :id => 5})
      organizer_test2 = Organizer.new({:expense_id => 1, :category_id => 3, :id => 5})
      expect(organizer_test).to(eq(organizer_test2))
    end
  end


end
