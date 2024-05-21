module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type.to_sym
    when :notice then "alert-success"
    when :success then "alert-success"
    when :error then "alert-danger"
    when :alert then "alert-warning"
    else "alert-info"
    end
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(
        content_tag(:div, class: "flash-message alert #{bootstrap_class_for(msg_type)} alert-dismissible fade show", role: 'alert') do
          concat(
            content_tag(:button, '', class: "btn-close", data: { bs_dismiss: 'alert' }, aria: { label: 'Close' })
          )
          concat message
        end
      )
    end
    nil
  end
end
