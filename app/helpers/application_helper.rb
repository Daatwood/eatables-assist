module ApplicationHelper

  def random_color
    (0..2).map{"%0x" % (rand * 0x80 + 0x80)}.join
  end
end
