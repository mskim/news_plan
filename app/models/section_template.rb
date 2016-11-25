class SectionTemplate < ActiveRecord::Base
  has_many :article_boxes
  
  
  def svg
    colors = %w{black red orange yellow green blue purple lightGray gray darkGray}
    svg_string = '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="600px" height="800px">\n'
    
    article_boxes.each_with_index do |box, i|
      frame = box.grid_frame.map{|e| e*50}
      svg_string += "<rect x=\"#{frame[0]}\" y=\"#{frame[1]}\" width=\"#{frame[2]}\" height=\"#{frame[3]}\" style=\"fill:#{colors[i]};stroke:black;\"></rect>\n"
    end
    svg_string +='</svg>'
  end
end
