class Order < ActiveRecord::Base
  belongs_to :order_type
  
  has_many :contacts


      def delivered
        self.contacts.length
      end

      
      def remaining
        self.quantity.to_i - self.delivered.to_i
      end
      
      def delivered_today
        self.contacts.where("created_at > ?", (Time.now.midnight - 1.day)).length

      end

      
      def rejections 
        self.contacts.where("lead_status_id = ?", "2").length
      end

      def cutoffs
        self.contacts.where("lead_status_id = ?", "5").length
      end

      def displayname
        self.Invoice_number.to_s + " - " + self.company
      end
end
