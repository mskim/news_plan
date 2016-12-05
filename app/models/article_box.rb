class ArticleBox < ActiveRecord::Base
  belongs_to :section_template
  serialize :grid_frame, Array
  
  def svg
    
    svg_string = '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="600px" height="800px">'
      frame =  grid_frame.map{|e| e*50}
      svg_string += "<rect x=\"#{frame[0]}\" y=\"#{frame[1]}\" width=\"#{frame[2]}\" height=\"#{frame[3]}\" style=\"fill:red;stroke:black;\"></rect>\n"
    svg_string += '</svg>'
  end
end
