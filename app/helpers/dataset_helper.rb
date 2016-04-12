module DatasetHelper
  def count_color(count)
    case count
    when 0..200
      '#75A5D6'
    when 201..500
      '#628AB3'
    when 501..1000
      '#3F5973'
    when 1000..2000
      '#4D6C8C'
    else
      '#34495E'
    end
  end
end
