module ApplicationHelper
  def flash_class(key)
    case key
    when 'notice'
      'success'
    when 'alert'
      'danger'
    end
  end
end
