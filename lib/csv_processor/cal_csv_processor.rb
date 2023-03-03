class CalCsvProcessor < CsvProcessor
    processor_name 'Visa C.A.L. report'
    header_lines 3
    separator "\t"
    line_processor do |location, tokens|
        {
            amount: tokens[3].tr('₪', '').to_i,
            source_location: location
        }
    end
end