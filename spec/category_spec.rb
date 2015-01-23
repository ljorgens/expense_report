require('spec_helper')

describe(Category) do
  describe('.all') do
    it("shows all categorys") do
      expect(Category.all()).to(eq([]))
    end
  end
  describe('#description') do
    it("it returns the description provided") do
      category_test = Category.new({:description => "food", :id => nil})
      expect(category_test.description()).to(eq("food"))
    end
  end

  describe('#save') do
    it("sends a new category to the table") do
      category_test = Category.new({:description => "food", :id => nil})
      category_test.save()
      expect(Category.all()).to(eq([category_test]))
    end
  end
  describe("#==") do
    it("alters == to make things equal") do
      category_test = Category.new({:description => "food", :id => nil})
      category_test2 = Category.new({:description => "food", :id => nil})
      expect(category_test).to(eq(category_test2))
    end
  end
  describe("#expenses") do
    it("returns the total amount for all the expenses for a given category") do
      category_test = Category.new({:description => "food", :id => nil})
      category_test.save()
      expense_test = Expense.new({:description => "hamburger", :amount => 10.45, :date => "1889-12-12", :id => nil})
      expense_test.save()
      category_test.add_expense(expense_test)
      # organizer_test = Organizer.new({:expense_id => expense_test.id(), :category_id => category_test.id(), :id => nil})
      # organizer_test.save()
      category_test2 = Category.new({:description => "clothing", :id => 1})
      category_test2.save()
      expense_test2 = Expense.new({:description => "sweater", :amount => 12.50, :date => "2015-12-12", :id => nil})
      expense_test2.save()
      category_test2.add_expense(expense_test2)
      # organizer_test2 = Organizer.new({:expense_id => expense_test2.id(), :category_id => category_test2.id(), :id => nil})
      # organizer_test2.save()
      expect(category_test2.expenses()).to(eq([expense_test2]))
    end
  end

  # describe("#add_expense") do
  #   it("adds expense to a category and a category to an expense") do
  #     test_category = Category.new({:description => "clothing", :id => nil})
  #     test_category.save()
  #     test_expense= Expense.new({:description => "shirt", :amount => 12.56, :date => "1222-11-11", :id =>nil})
  #     test_expense.save()
  #     test_category.add_expense(test_expense)
  #     expect(test_category.expense()).to(eq([test_expense]))
  #   end
  end
end
