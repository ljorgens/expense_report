class Organizer
  attr_reader(:expense_id, :category_id, :id)

  define_method(:initialize) do |attributes|
    @expense_id = attributes.fetch(:expense_id)
    @category_id = attributes.fetch(:category_id)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_expense_category = DB.exec("SELECT * FROM expenses_categories;")
    organizer_array = []
    returned_expense_category.each() do |organize|
      expense_id = organize.fetch("expense_id").to_i()
      category_id = organize.fetch("category_id").to_i()
      id = organize.fetch("id").to_i()
      organizer_array.push(Organizer.new({:expense_id => expense_id, :category_id => category_id, :id => id}))
    end
    organizer_array
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO expenses_categories (expense_id, category_id) VALUES (#{@expense_id}, #{@category_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_organizer|
    self.expense_id().==(another_organizer.expense_id()).&(self.category_id().==(another_organizer.category_id()))
  end
end
