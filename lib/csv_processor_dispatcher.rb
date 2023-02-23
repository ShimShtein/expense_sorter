class CsvProcessorDispatcher
    def self.processors
      CsvProcessor.descendants
    end

    def self.process_file(processor_id:, file:)
      processor = processor_id.constantize
      raise ArgumentError.new("#{processor} is not in #{self.class.processors}") unless self.class.processors.contains(processor)

      processor.process(file)
    end
end