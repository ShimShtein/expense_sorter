class CsvProcessor
    attr_reader :dispatcher

    def class << self
        def name=(name)
            @name = name
        end

        def name
            @name
        end

        def header_lines=(header_lines)
            @header_lines = header_lines
        end
    
        def header_lines
            @header_lines.to_i
        end
    
        def separator=(separator)
            @separator = separator
        end
    
        def separator
            @separator || ','
        end

        def line_processor(&callback)
            @line_processor = callback
        end

        def process_line(tokens)
            @line_processor.call(tokens)
        end
    end


    def initialize(dispatcher)
        @dispatcher = dispatcher
    end

    def process(file)
        file.rewind
        self.class.skip_lines.times { file.readline }
   
        expenses_attributes = []
        file.each_line do |line|
            row = line.split(self.class.separator)
            expenses_attributes << expense.new(self.class.process_line(row))
        end

        expenses_attributes
    end
end