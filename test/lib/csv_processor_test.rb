require "test_helper"
require 'stringio'

class CsvProcessorTest < ActiveSupport::TestCase
    test 'Sets processor name' do
        class ProcessorNameTestProcessor < CsvProcessor
            processor_name 'test processor'
        end

        assert_equal 'test processor', ProcessorNameTestProcessor.processor_name
    end

    test 'Processes lines correctly' do
        class HeaderLinesTestProcessor < CsvProcessor
            header_lines 2
            separator "\t"

            line_processor do |id, line|
                {
                    id: id,
                    line: line
                }
            end
        end

        file = StringIO.new("skip 1\nskip 2\ntest1\tf12\ntest2\tf22")

        processor = HeaderLinesTestProcessor.new
        attributes = processor.process(file)

        assert_equal 2, attributes.count
        assert_equal ['test1', 'f12'], attributes.first[:line]
        assert_equal 3, attributes.first[:id]
        assert_equal ['test2', 'f22'], attributes.last[:line]
        assert_equal 4, attributes.last[:id]
    end
end
