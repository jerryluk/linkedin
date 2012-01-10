module LinkedIn
  class Recipients
    
    attr_accessor :recipients
    
    def to_xml
      str = ''
      recipients.each do |recipient|
        str << "<recipient>"
        str << "<person path=#{recipient.person.path}>"
        str << "<first-name>#{recipient.person.first_name}</first-name>" if recipient.person.first_name.present?
        str << "<last-name>#{recipient.person.last_name}</last-name>" if recipient.person.last_name.present?
        str << "</person>"
        str << "</recipient>"
      end
      str
    end
  end
end
