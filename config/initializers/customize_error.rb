ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  html = html_tag
  
  form_fields = [
    'textarea',
    'input',
    'select'
  ]

  elements = Nokogiri::HTML::DocumentFragment.parse(html_tag).css form_fields.join(', ')

  elements.each do |e|
    class_attr_index = html_tag.index 'class="'
    if class_attr_index
        html_tag.insert class_attr_index-1, ' autofocus="autofocus" '
        html_tag.insert class_attr_index+30, 'error '
    else
        html_tag.insert html_tag.index('>'), ' class="error" autofocus="autofocus"'
    end    
    
    if form_fields.include? e.node_name
      if instance.error_message.kind_of?(Array)
        html = %(#{html_tag}<span class="help-inline">&nbsp;#{instance.error_message.uniq.join(', ')}</span>).html_safe
      else
        html = %(#{html_tag}<span class="help-inline">&nbsp;#{instance.error_message}</span>).html_safe
      end
    end
  end
  html
end