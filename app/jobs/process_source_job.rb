class ProcessSourceJob < ApplicationJob
  queue_as :default

  def perform(source)
    source.csv.open do |file|
      expense_hashes = CsvProcessorDispatcher.process_file(file: file, source_id: source.source_type)
      source.expenses.create(expense_hashes)
    end
  end
end
