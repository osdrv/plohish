class OversightsController < ApplicationController
  # GET /oversights
  # GET /oversights.xml
  def index
    @oversights = Oversight.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @oversights }
    end
  end

  # GET /oversights/1
  # GET /oversights/1.xml
  def show
    @oversight = Oversight.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @oversight }
    end
  end

  # GET /oversights/new
  # GET /oversights/new.xml
  def new
    @oversight = Oversight.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @oversight }
    end
  end

  # GET /oversights/1/edit
  def edit
    @oversight = Oversight.find(params[:id])
  end

  # POST /oversights
  # POST /oversights.xml
  def create
    @oversight = Oversight.new(params[:oversight])

    respond_to do |format|
      if @oversight.save
        format.html { redirect_to(@oversight, :notice => 'Oversight was successfully created.') }
        format.xml  { render :xml => @oversight, :status => :created, :location => @oversight }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @oversight.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /oversights/1
  # PUT /oversights/1.xml
  def update
    @oversight = Oversight.find(params[:id])

    respond_to do |format|
      if @oversight.update_attributes(params[:oversight])
        format.html { redirect_to(@oversight, :notice => 'Oversight was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @oversight.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /oversights/1
  # DELETE /oversights/1.xml
  def destroy
    @oversight = Oversight.find(params[:id])
    @oversight.destroy

    respond_to do |format|
      format.html { redirect_to(oversights_url) }
      format.xml  { head :ok }
    end
  end
end
