module LinkedIn
  class Message
    
    attr_accessor :subject, :body, :recipients
    
    def to_xml
      "<mailbox-item>
        <recipients>
          #{recipients.to_xml}
        </recipients>
        <subject>#{subject}</subject>
        <body>#{body}</body>
      </mailbox-item>"
    end
    
  end
  
  class InvitationMessage < Message
    
    attr_accessor :auth_token
    
    def to_xml
      xml = "<mailbox-item>
        <recipients>
          #{recipients.to_xml}
        </recipients>
        <subject>#{subject}</subject>
        <body>#{body}</body>
        <item-content>
          <invitation-request>
            <connect-type>friend</connect-type>"
      xml << "
              <authorization>
                <name>#{auth_token.split(/:/)[0]}</name>
                <value>#{auth_token.split(/:/)[1]}</value>
              </authorization>" if auth_token.present?
      xml << "
          </invitation-request>
        </item-content>
      </mailbox-item>"
      xml
    end
  end
  
end

# <mailbox-item>
#   <recipients>
#     <recipient>
#       <person path='/people/~'/>
#     </recipient>
#     <recipient>
#       <person path="/people/abcdefg" />
#     </recipient>
#   </recipients>
#   <subject>Congratulations on your new position.</subject>
#   <body>You're certainly the best person for the job!</body>
# </mailbox-item>
