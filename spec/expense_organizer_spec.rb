require('spec_helper')

describe(Expense) do
  describe('.all') do
    it("shows all expenses") do
      expect(Expense.all()).to(eq([]))
    end
  end
  describe('#description') do
    it("it returns the description provided") do
      expense_test = Expense.new({:description => "hamburger", :amount => 10.00, :date => '1222/22/10',:id => nil})
      expect(expense_test.description()).to(eq("hamburger"))
    end
  end

  describe('#amount') do
    it("it returns the amount provided") do
      expense_test = Expense.new({:description => "hamburger", :amount => 10.00, :date => '1222/22/10', :id => nil})
      expect(expense_test.amount()).to(eq(10.00))
    end
  end

  describe('#date') do
    it("it returns the date provided") do
      expense_test = Expense.new({:description => "hamburger", :amount => 10.00, :date => '1222/22/10', :id => nil})
      expect(expense_test.date()).to(eq("1222/22/10"))
    end
  end

  describe('#save') do
    it("it sends a new expense to the table") do
      expense_test = Expense.new({:description => "hamburger", :amount => 10.00, :date => '1999-10-10', :id => nil})
      expense_test.save()
      expect(Expense.all()).to(eq([expense_test]))
    end
  end
  describe("#==") do
    it("alters == to make things equal") do
      expense_test = Expense.new({:description => "hamburger", :amount => 10.15, :date => '1999-10-10', :id => nil})
      expense_test2 = Expense.new({:description => "hamburger", :amount => 10.15, :date => '1999-10-10', :id => nil})
      expect(expense_test).to(eq(expense_test2))
    end
  end
end
