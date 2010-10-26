class FlatmatesController < ApplicationController
  # GET /flatmates
  # GET /flatmates.xml
  def index
    @flatmates = Flatmate.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @flatmates }
    end
  end

  # GET /flatmates/1
  # GET /flatmates/1.xml
  def show
    @flatmate = Flatmate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @flatmate }
    end
  end

  # GET /flatmates/new
  # GET /flatmates/new.xml
  def new
    @flatmate = Flatmate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @flatmate }
    end
  end

  # GET /flatmates/1/edit
  def edit
    @flatmate = Flatmate.find(params[:id])
  end

  # POST /flatmates
  # POST /flatmates.xml
  def create
    @flatmate = Flatmate.new(params[:flatmate])

    respond_to do |format|
      if @flatmate.save
        format.html { redirect_to(@flatmate, :notice => 'Flatmate was successfully created.') }
        format.xml  { render :xml => @flatmate, :status => :created, :location => @flatmate }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @flatmate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /flatmates/1
  # PUT /flatmates/1.xml
  def update
    @flatmate = Flatmate.find(params[:id])

    respond_to do |format|
      if @flatmate.update_attributes(params[:flatmate])
        format.html { redirect_to(@flatmate, :notice => 'Flatmate was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @flatmate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /flatmates/1
  # DELETE /flatmates/1.xml
  def destroy
    @flatmate = Flatmate.find(params[:id])
    @flatmate.destroy

    respond_to do |format|
      format.html { redirect_to(flatmates_url) }
      format.xml  { head :ok }
    end
  end
end
