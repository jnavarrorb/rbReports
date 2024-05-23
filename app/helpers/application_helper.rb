module ApplicationHelper
    def format_time(time, options = {})
    # Set the format
    format = options[:year].nil? ? '%Y/%m/%d at' : '%m/%d at'
    format = if options[:bold]
               "#{format} <strong>%H:%M</strong>"
             else
               "#{format} %H:%M"
             end
    format = "#{format} %:z" if options[:timezone]

    if time.nil? || time.blank?
      # Set the undefined string
      undefined_string = options[:undefinedString] ||
                         Time.zone.now.strftime(format)
      undefined_string.html_safe
    else
      time.strftime(format).html_safe
    end
  end
end
