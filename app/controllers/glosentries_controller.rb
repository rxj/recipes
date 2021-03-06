
class GlosentriesController < ApplicationController

http_basic_authenticate_with name: "rxj", password: "secret", except: [:index, :show]

  def glosentry_params
    params[:glosentry].permit(:picture, :explanation, :keyword)
  end


  # GET /glosentries
  # GET /glosentries.json
  def index
    @glosentries = Glosentry.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @glosentries }
    end
  end

  # GET /glosentries/1
  # GET /glosentries/1.json
  def show
    @glosentry = Glosentry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @glosentry }
    end
  end

  # GET /glosentries/new
  # GET /glosentries/new.json
  def new
    @glosentry = Glosentry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @glosentry }
    end
  end

  # GET /glosentries/1/edit
  def edit
    @glosentry = Glosentry.find(params[:id])
  end

  # POST /glosentries
  # POST /glosentries.json
  def create
    @glosentry = Glosentry.new(glosentry_params)

    respond_to do |format|
      if @glosentry.save
        format.html { redirect_to @glosentry, notice: 'Glosentry was successfully created.' }
        format.json { render json: @glosentry, status: :created, location: @glosentry }
      else
        format.html { render action: "new" }
        format.json { render json: @glosentry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /glosentries/1
  # PUT /glosentries/1.json
  def update
    @glosentry = Glosentry.find(params[:id])   

    respond_to do |format|
      if @glosentry.update_attributes(glosentry_params)
        format.html { redirect_to @glosentry, notice: 'Glosentry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @glosentry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glosentries/1
  # DELETE /glosentries/1.json
  def destroy
    @glosentry = Glosentry.find(params[:id])
    @glosentry.destroy

    respond_to do |format|
      format.html { redirect_to glosentries_url }
      format.json { head :no_content }
    end
  end
end
