class SectionTemplate < ActiveRecord::Base
  has_many :article_boxes

  def setup

  end

  def html_path
    "#{Rails.root}/public/template/#{grid_key}.html"
  end

  def svg
    colors = %w{pink red orange yellow green blue purple lightGray gray darkGray cynan pink}
    svg_string = '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="600px" height="800px">'
    article_boxes.each_with_index do |article_box, i|
      grid_frame = YAML::load(article_box.grid_frame).map{|e| e*50}
      svg_string += "<a href=\"/article_boxes/#{article_box.id}\"><rect x=\"#{grid_frame[0]}\" y=\"#{grid_frame[1]}\" width=\"#{grid_frame[2]}\" height=\"#{grid_frame[3]}\" style=\"fill:#{colors[i]};stroke:black;\"></rect></a>\n"
    end
    svg_string += '</svg>'
  end

  def svg_thumb
    colors = %w{pink red orange yellow green blue purple lightGray gray darkGray cynan pink}
    svg_string = '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="120px" height="160px">'
    article_boxes.each_with_index do |article_box, i|
      grid_frame = YAML::load(article_box.grid_frame).map{|e| e*10}
      svg_string += "<a href=\"/article_boxes/#{article_box.id}\"><rect x=\"#{grid_frame[0]}\" y=\"#{grid_frame[1]}\" width=\"#{grid_frame[2]}\" height=\"#{grid_frame[3]}\" style=\"fill:#{colors[i]};stroke:black;\"></rect></a>\n"
    end
    svg_string += '</svg>'

  end
  # flip the layout for right side page
  def flip_for_right_side

  end

  # check all article_boxes if they can be used as ad_box
  def has_ad_box

  end

  def collect_box_data
    box_data_array = []
    article_boxes.each do |box|
      box_data_array << YAML::load(box.grid_frame)
    end
    box_data = box_data_array.to_yaml
  end

  def updata_article_box_grid_frame

  end
end
