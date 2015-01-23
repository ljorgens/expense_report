class Category
  attr_reader(:description, :id)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_categories = DB.exec("SELECT * FROM categories;")
    category_array = []
    returned_categories.each() do |category|
      description = category.fetch("description")
      id = category.fetch("id").to_i()
      category_array.push(Category.new({:description => description, :id => id}))
    end
    category_array
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO categories (description) VALUES ('#{@description}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_category|
    self.description().==(another_category.description()).&(self.id().==(another_category.id()))
  end

  define_method(:expenses) do
    
    result = DB.exec("SELECT expenses.* FROM categories JOIN expenses_categories ON (categories.id = expenses_categories.category_id) JOIN expenses ON (expenses_categories.expense_id = expenses.id) WHERE categories.id = #{id};")
    expense_array = []
    result.each() do |expenses|
      description = expenses.fetch("description")
      amount = expenses.fetch("amount").to_f()
      date = expenses.fetch("date")
      id = expenses.fetch("id").to_i()
      expense_array.push(Expense.new({:description => description, :amount => amount, :date => date, :id => id}))
    end
    expense_array
  end

  define_method(:add_expense) do |expense|
    category_id  = self.id.to_i()
    expense_id = expense.id().to_i()
    DB.exec("INSERT INTO expenses_categories (category_id, expense_id) VALUES (#{category_id}, #{expense_id});")
  end
end
