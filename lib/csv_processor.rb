class CsvProcessor
    attr_reader :dispatcher

    def self.header_lines=(header_lines)
        @header_lines = header_lines
    end

    def self.header_lines
        @header_lines.to_i
    end

    def self.separator=(separator)
        @separator = separator
    end

    def self.separator
        @separator || ','
    end

    def initialize(dispatcher)
        @dispatcher = dispatcher
    end

    def process(file)
        file.rewind
        self.class.skip_lines.times { file.readline }
   
        file.each_line do |line|
            row = line.split(self.class.separator)
            process_line(row, dispatcher)
        end
    end
end