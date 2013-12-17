class OrderTypesController < ApplicationController
  load_and_authorize_resource

  # GET /order_types
  # GET /order_types.xml
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @order_types }
    end
  end

  # GET /order_types/1
  # GET /order_types/1.xml
  def show
    @order_types = OrderType.all
     
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order_type }
    end
  end

  # GET /order_types/new
  # GET /order_types/new.xml
  def new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @order_type }
    end
  end

  # GET /order_types/1/edit
  def edit
  end

  # POST /order_types
  # POST /order_types.xml
  def create

    respond_to do |format|
      if @order_type.save
        format.html { redirect_to(@order_type, :notice => 'Order type was successfully created.') }
        format.xml  { render :xml => @order_type, :status => :created, :location => @order_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @order_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /order_types/1
  # PUT /order_types/1.xml
  def update

    respond_to do |format|
      if @order_type.update_attributes(params[:order_type])
        format.html { redirect_to(@order_type, :notice => 'Order type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @order_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /order_types/1
  # DELETE /order_types/1.xml
  def destroy

    @order_type.destroy

    respond_to do |format|
      format.html { redirect_to(order_types_url) }
      format.xml  { head :ok }
    end
  end
end
