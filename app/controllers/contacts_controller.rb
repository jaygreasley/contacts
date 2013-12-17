 require 'csv'
 class ContactsController < ApplicationController
   #load_and_authorize_resource
   before_filter :authenticate_user!, :except => [:show_byorder, :getcsvfororder, :getcsv, :new]


  
  def index
      @contacts = Contact.all
      respond_to do |format|
          format.html # index.html.erb
          format.xml  { render :xml => @contacts }
          format.json { render :json => @contacts }
         
       end

  end

  def todays
      @contacts = Contact.where("created_at > ?", (Time.now.midnight - 1.day)).order("created_at DESC")
      respond_to do |format|
          format.html # index.html.erb
          format.xml  { render :xml => @contacts }
          format.json { render :json => @contacts }
         
       end

  end
    
  def show
    @contact = Contact.find(params[:id])
    #@statuses = LeadStatus.all
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contacts }
      end
  end
  
  def new
     @contact = Contact.new
     @orders = Order.all
     @ordertypes = OrderType.all

     
     respond_to do |format|
       format.html # new.html.erb
       format.xml  { render :xml => @contact}
     end
  end
   
  def create
    @contact = Contact.new(params[:contact])
    
    @contact.lead_status = LeadStatus.find(1)


       
    raise ArgumentError, "no order" if params[:contact][:order_id].empty?
    # @contact.errors.add :order_id, "no order"
    
    @order = Order.find(params[:contact][:order_id]) unless params[:contact][:order_id].empty?
     
     respond_to do |format|
       if @contact.save
         format.html { redirect_to(@contact, :notice => 'Lead was successfully created.ID = ' + @contact.id.to_s ) }
         format.xml  { render :xml => @contact, :status => :created, :location => @contact }
       else
         format.html { render :action => "new" }
         format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }
       end
     end
  end

  def edit
     @contact = Contact.find(params[:id])
     
     respond_to do |format|
       format.html # show.html.erb
       format.xml  { render :xml => @contacts }
       end
   end

  def update
      @contact = Contact.find(params[:id])
       @leadstatus = LeadStatus.find(params[:lead_status][:id])

        @contact.lead_status = @leadstatus
          
      respond_to do |format|
        if @contact.update_attributes(params[:contact])
          format.html { redirect_to(@contact, :notice => 'Lead was successfully updated.') }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
        end
      end
  end
    
  def showbyorder
   
    @order = Order.find(params[:id])  
     @contacts = Contact.where(:order_id => params[:id])
      respond_to do |format|
       # if @order.company == current_user.company || current_user.roles[0].name == 'admin'
          format.html # showbyorder.html.erb
          format.xml  { render :xml => @contacts }
        #else
        #  format.html { render :controller => "home", :action => "index"}
      #end
    
  end
  
 end


  def showbystatus
   
    @status = LeadStatus.find(params[:status_id]).name
     @contacts = Contact.where(:lead_status_id => params[:status_id], :order_id => params[:order_id])
      respond_to do |format|

          format.html # showbyorder.html.erb
        
  end
  
 end

 
  def getcsvfororder
    
    @order = Order.find(params[:id])
    
    if @order.company == current_user.company || current_user.roles[0].name == 'super_admin'
     if params[:id].to_i >0
       
        @contacts = Contact.where(:order_id => params[:id])
       
        
     else
       @contacts = Contact.all
     end
              csv_string = CSV.generate do |csv| 
              csv << ["Title","Firstname", "Surname", "Age", "Phone number", "Door number", "Street", "Postcode", "Employment", "Monthly income", "Rent or mortgage", "Gas" ]
              @contacts.each do |e|
                csv << [e.Firstname, e.Surname, e.Age, e.PhoneNumber, e.DoorNumber, e.Street, e.Postcode, e.Employment, e.incomePCM, e.RentOrMortgage, e.Gas]
            end
          end
          send_data csv_string, :type => "text/plain", 
           :filename=>"Contacts.csv",
           :disposition => 'attachment'
    end  
          
end

  def getcsv

        @contacts = Contact.all
       
        csv_string = CSV.generate do |csv| 
              csv << ["Title","Firstname", "Surname", "Age", "Phone number", "Door number", "Street", "Postcode", "Employment", "Monthly income", "Rent or mortgage", "Gas" ]
              @contacts.each do |e|
                csv << [e.Firstname, e.Surname, e.Age, e.PhoneNumber, e.DoorNumber, e.Street, e.Postcode, e.Employment, e.incomePCM, e.RentOrMortgage, e.Gas]
              end
            end
            send_data csv_string, :type => "text/plain", 
             :filename=>"Contacts.csv",
             :disposition => 'attachment'
      end  


end

