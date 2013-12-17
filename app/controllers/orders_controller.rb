class OrdersController < ApplicationController
  before_filter :authenticate_user!, :except => [:for_order_types, :get_criteria_for]
  #load_and_authorize_resource
  
    def index
      @orders = Order.all
      respond_to do |format|
        format.html # index.html.erb
        format.xml  { render :xml => @orders }
      end
    end
    
    def show
      
      @order = Order.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @order }
      end
    end
    
    def new
       @ordertypes= OrderType.all
       @order = Order.new
       
       respond_to do |format|
         format.html # new.html.erb
         format.xml  { render :xml => @order}
       end
    end
    
    def create

       @ordertype = OrderType.find(params[:order_type][:id])
       @order = Order.new(params[:order])
       @order.order_type = @ordertype
       
       respond_to do |format|
         if @order.save
           
             format.html { redirect_to(@order, :notice => 'Order was successfully created.') }
             format.xml  { render :xml => @order, :status => :created, :location => @order }
           else
           format.html { render :action => "new" }
           format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
         
       end
     end
    end
     
    def edit
       
       @order = Order.find(params[:id])
       @ordertypes= OrderType.all
      
       
     end
          
    def update
       @order= Order.find(params[:id])
       @ordertype = OrderType.find(params[:order_type][:id])

        @order.order_type = @ordertype
       respond_to do |format|
         if @order.update_attributes(params[:order])
           format.html { redirect_to(@order, :notice => 'Order was successfully updated.') }
           format.xml  { head :ok }
         else
           format.html { render :action => "edit" }
           format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
         end
       end
     end
     
    def showmy
       if user_signed_in?
        @orders = Order.where(:company => current_user.company)
      end

       respond_to do |format|
        if user_signed_in?
         format.html # show.html.erb
         format.xml  { render :xml => @order }
        else
          format.html { render :controller => "home", :action => "index"}
        end
          end
     end
     
    def for_order_types
            
            @orders = Order.find( :all, :conditions => [" order_type_id = ? and status = 'Live'", params[:id]]  )
            respond_to do |format|
              format.json  { render :json => @orders }      
            end
    end

    def get_criteria_for
         @order = Order.find( :all, :conditions => [" id = ?", params[:id]]  )
         respond_to do |format|
           format.json  { render :json => @order }      
         end

    end
  
 
end
