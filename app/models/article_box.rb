class ArticleBox < ActiveRecord::Base
  belongs_to :section_template
  serialize :grid_frame, Array
end
