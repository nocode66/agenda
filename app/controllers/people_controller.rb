class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

 
  def index
    @people = Person.all
  end

  def show
    @people = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def edit
  end


  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
      else
        format.html { render action: 'new' }      
    end
  end
end


  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def findbynumber
    person=Person.find_by telephone_number: params[:tn]
    if person 
      redirect_to person_path person
    else
      redirect_to people_path, :flash => { :error => "Contact not finded for this number" }
    end
  end

  def findbyname
    @people=Person.where(first_name: params[:fn])
    if @people.count > 0
      render 'findbyname'
    else
      redirect_to people_path, :flash => { :error => "We didn't find any contacts with this first name" }
    end
  end


  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:first_name, :last_name, :address, :telephone_number, :fax_number)
    end
end
