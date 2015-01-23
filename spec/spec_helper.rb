require ("expense_organizer")
require ("pg")
require ("rspec")
require ("category")
require ("organizer")
require ("pry")

DB = PG.connect({:dbname => "expense_organizer_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM expenses *;")
    DB.exec("DELETE FROM categories *;")
    DB.exec("DELETE FROM expenses_categories *;")
  end

end
