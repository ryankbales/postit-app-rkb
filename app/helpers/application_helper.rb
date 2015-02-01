module ApplicationHelper

  def date_time_sanitizer(obj)
    if obj
      obj = obj.strftime("%A" + ", " "%b %d" + " at " "%l:%M%P %Y")
    end
  end

  def normalize_external_link(label, link)
    if link.include?('http://') || link.include?('https://')
      link = link_to(label, link, target: 'blank')
    else
      link = link_to(label, "http://#{link}", target: 'blank')
    end
  end

  def post_width_class
    width = logged_in? ? "col-md-10 well pull-right" : "col-md-12 well"
  end

end
