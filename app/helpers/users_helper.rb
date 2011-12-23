module UsersHelper

  def error_message(error)
    return error if error.is_a?(String)               # Message is just a string, we can't even try to do something nice with it
    method = error[:code].to_s.downcase + "_error_message"
    return send(method, error) if respond_to?(method) # We have a special way of displaying such error
    return error[:description]                        # Just display the description from model
  end

  def invalid_length_error_message(error)
    "length of this text is invalid. Minimum is <strong>#{error[:min]}</strong> and maximum is <strong>#{error[:max]}</strong>".html_safe
  end

end
