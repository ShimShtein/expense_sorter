class CsvProcessorDispatcher
    class ProcessorSignals
        def initialize(dispatcher)
            @dispatcher = dispatcher            
        end

        def expense_line(line_number:, date:, amount:, shop_name:, remarks:)
        end
    end
    
    def self.dipatchers
        CsvProcessor.descendants
    end

    def process_file(processor_id, file)
    end
end