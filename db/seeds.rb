require 'csv'
require 'date'



ad_table_path  = File.dirname(__FILE__) + "/../ad_table.csv"
if File.exist?(ad_table_path)
  ad_table = File.open(ad_table_path){|f| f.read}
  rows  = CSV.parse(ad_table)
  keys  = rows.shift
  puts "keys:#{keys}"
  rows.each do |row|
    puts name            = row[0].gsub(" ","-")
    puts column_count    = row[1]
    puts grid_width      = row[2]
    puts grid_height     = row[3]
    # AdTemplate.where(name: name, column_count: column_count, grid_width: grid_width, grid_height: grid_height).first_or_create
    # create template folder
    section_template_folder = "#{Rails.root}/public/section_template"
    puts ad_template_path = section_template_folder + "/#{name}"
    system("mkdir -p #{ad_template_path}") unless File.directory?(ad_template_path)
  end
end


config = {
  name: "내일신문",
  paper_size: "A2",
  width: 1190.55,
  height: 1683.78,
  margin: 50,
  page_count: 24,
  sections: %w{one two three four five six seven eight nine ten twelve thirteen fourteen fifteen sixteen seventeen eightteen nineteen twenty twenty-one twenty-two twenty-three twenty-four}
}
publication = Publication.where(config).first_or_create


issue_plan_path  = File.dirname(__FILE__) + "/../issue_plan.csv"
if File.exist?(issue_plan_path)
  spread_plan = File.open(issue_plan_path){|f| f.read}
  date = Date.new(2016, 12, 5)
  Issue.where(publication_id: publication.id, date: date, spread_plan: spread_plan).first_or_create
end




GRID_PATTERNS = {

  '6x6/1':[[0, 0, 1, 1]],
  '6x6/3':[[0, 0, 1, 1], [0, 0, 1, 1], [0, 0, 1, 1]],
  '7x11/3':[[0, 0, 4, 6], [4, 0, 3, 6], [0, 6, 7, 5]],
  '7x11/4':[[0, 0, 4, 5], [4, 0, 3, 5], [0, 5, 3, 6], [3, 5, 4, 6]],
  '7x11/5':[[0, 0, 7, 3], [0, 3, 4, 3], [4, 3, 3, 4], [0, 6, 4, 5], [4, 7, 3, 4]],
  '7x11/6':[[0, 0, 4, 3], [4, 0, 3, 4], [0, 3, 4, 3], [4, 4, 3, 3], [0, 6, 4, 5], [4, 7, 3, 4]],
  '7x12/H/4':[[0, 0, 7, 1], [0, 1, 4, 4], [4, 1, 3, 4], [0, 5, 7, 2], [0, 7, 7, 5]],
  '7x12/4':[[0, 1, 4, 4], [4, 1, 3, 4], [0, 5, 7, 2], [0, 7, 7, 5]],
  '7x12/H/5':[[0, 0, 7, 1], [0, 1, 4, 3], [4, 1, 3, 4], [0, 4, 4, 5], [4, 5, 3, 4], [0, 9, 7, 3]],
  '7x12/5':[[0, 0, 7, 3], [0, 3, 4, 3], [4, 3, 3, 4], [0, 6, 4, 5], [4, 7, 3, 4]],
  '7x12/5_1':[[0, 0, 4, 3], [0, 3, 4, 3], [4, 0, 3, 6], [0, 6, 4, 6], [4, 6, 3, 6]],
  '7x12/5_2':[[0, 0, 7, 6], [0, 3, 4, 3], [4, 3, 3, 3], [0, 6, 4, 3], [4, 6, 3, 3]],
  '7x12/6':[[0, 0, 4, 3], [4, 0, 3, 5], [0, 3, 4, 2], [0, 5, 4, 2], [4, 5, 3, 2], [0, 7, 7, 5]],
  '7x12/6_1':[[0, 0, 4, 3], [0, 3, 4, 3], [4, 0, 3, 6], [0, 6, 4, 6], [4, 6, 3, 3], [4, 3, 3, 3]],
  '7x12/6_2':[[0, 0, 7, 6], [0, 6, 4, 3], [0, 3, 2, 3], [2, 3, 2, 3], [4, 6, 3, 3], [4, 3, 3, 3]],
  '7x12/6_3':[[0, 0, 7, 6], [0, 6, 4, 3], [0, 3, 2, 3], [2, 3, 2, 3], [4, 6, 3, 3], [4, 3, 3, 3]],
  
  '7x15/5':[[0, 0, 7, 6], [0, 6, 4, 3], [0, 3, 2, 3], [2, 3, 2, 3], [4, 6, 3, 3]],
  '7x15/6':[[0, 0, 7, 6], [0, 6, 4, 3], [0, 3, 2, 3], [2, 3, 2, 3], [4, 6, 3, 3],[0,0,1,1]],
  '7x15/6_1':[[0, 0, 7, 6], [0, 6, 4, 3], [0, 3, 2, 3], [2, 3, 2, 3], [4, 6, 3, 3], [4, 3, 3, 3]]
  
  }

 GRID_PATTERNS.each do |k, v|
   puts k
   grid_key = k.to_s
   grid_base = grid_key.split('/').first
   section = SectionTemplate.where(grid_key: grid_key, grid_base: grid_base).first_or_create
   v.each do |box|
     article = ArticleBox.where(grid_frame: box, section_template_id: section.id).first_or_create
   end
 end
 
