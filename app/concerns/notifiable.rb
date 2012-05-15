module Notifiable
  extend ActiveSupport::Concern
  
  included do
    after_create :notify_created
    after_update :notify_updated
    after_destroy :notify_destroyed
  end
  
  private
  
    def notify_created
      notify :created
    end
    
    def notify_updated
      notify :updated
    end
    
    def notify_destroyed
      notify :destroyed
    end
    
    def notify(action)
      message = { 
        channel: "/model/#{self.class.name.downcase}/#{action}", 
        data: self.to_json, 
        ext: { auth_token: FAYE_TOKEN } 
      }
      uri = URI.parse("http://localhost:9292/faye")
      Net::HTTP.post_form(uri, message: message.to_json)
    end
    
end