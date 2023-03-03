class CsvProcessor
    # defaults
    def separator
        ','
    end

    class << self
        def processor_name(name)
            define_singleton_method :processor_name do
                name
            end
        end

        def header_lines(header_lines)
            define_method :header_lines do
                header_lines
            end
        end
    
        def separator(separator)
            define_method :separator do
                separator
            end
        end
    
        def line_processor(&callback)
            define_method(:process_line, callback)
        end
    end

    def process(file)
        file.rewind
        header_lines.times { file.readline }
   
        expenses_attributes = []
        file.each_line do |line|
            line.chop! if line.ends_with? "\n"
            row = line.split(separator)
            expenses_attributes << process_line(file.lineno, row)
        end

        expenses_attributes
    end
end