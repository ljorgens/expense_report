class Expense
  attr_reader(:description, :amount, :date, :id)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @amount = attributes.fetch(:amount)
    @date = attributes.fetch(:date)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_expenses = DB.exec("SELECT * FROM expenses;")
    expense_array = []
    returned_expenses.each() do |expense|
      description = expense.fetch("description")
      amount = expense.fetch("amount").to_f()
      date = expense.fetch("date")
      id = expense.fetch("id")
      expense_array.push(Expense.new({:description => description, :amount => amount, :date => date, :id => id}))
    end
    expense_array
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO expenses (description, amount, date) VALUES ('#{@description}', #{@amount}, '#{@date}') RETURNING id")
    @id = result.first().fetch("id").to_i()

  end

  define_method(:==) do |another_expense|
    self.description().==(another_expense.description()).&(self.amount().==(another_expense.amount())).&(self.date().==(another_expense.date()))
  end

end
