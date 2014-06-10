namespace :parsing_price do
  desc 'Parsing price.xlsx and load in database'
  task run: :environment do
    #Mark.destroy_all

    last_row  = 6492
    start_row = 3
    
    file = Roo::Excelx.new 'lib/price.xlsx'

    PATTERN_FIND_YEAR  = /\(.{2,}\)|\d{2,}-(?!\d)/
    PATTERN_FIND_MARK  = /^\w{2,}|\sROMEO/
    PATTERN_FIND_MODEL = /((ROMEO\s)|(\s(?!ROMEO)))(\b.{1,})(?=[\s\(][\(\d{2,4}-])/
    COLUMN_AUTO        = 3
    COLUMN_SLENG       = 4
    COLUMN_SECTION     = 7

    start_row.upto(last_row) do |row_index|
      s = String.new
      
      auto    = file.cell(row_index, COLUMN_AUTO).to_s
      sleng   = file.cell(row_index, COLUMN_SLENG).to_s
      section = file.cell(row_index, COLUMN_SECTION).to_s

      mark  = PATTERN_FIND_MARK.match auto
      model = PATTERN_FIND_MODEL.match auto
      year  = PATTERN_FIND_YEAR.match auto

      mark_new       = Mark.find_or_create_by!(name: mark.to_s)
      model_new      = Model.find_or_create_by!(name: (model.nil? ? '' : model[-1]), 
                                                mark: mark_new)
      year_new       = Year.find_or_create_by!(date: year.to_s, model: model_new)
      section_new    = Section.find_or_create_by!(name: section, year: year_new)
      spare_part_new = SparePart.find_or_create_by!(sleng: sleng, 
                                                    section: section_new)
    end
  end
end
