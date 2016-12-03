class SectionTemplate < ActiveRecord::Base
  has_many :article_boxes

  def setup

  end
    
  def html_path
    "#{Rails.root}/public/template/#{grid_key}.html"
  end

  def svg
    colors = %w{black red orange yellow green blue purple lightGray gray darkGray}
    svg_string = '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="600px" height="800px">'
    puts "article_boxes:#{article_boxes.length}"
    article_boxes.each_with_index do |article_box, i|
      grid_frame =  article_box.grid_frame.map{|e| e*50}
      svg_string += "<rect x=\"#{grid_frame[0]}\" y=\"#{grid_frame[1]}\" width=\"#{grid_frame[2]}\" height=\"#{grid_frame[3]}\" style=\"fill:#{colors[i]};stroke:black;\"></rect>\n"
    end
    svg_string += '</svg>'
  end
  
  # flip the layout for right side page
  def flop_for_right_side
    
  end
  
  # check all article_boxes if they can be used as ad_box
  def has_ad_box
    
  end
  
end
