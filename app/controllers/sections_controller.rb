class SectionsController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in
  before_action :find_page
  #before_action :find_pages, :only => [:new, :create, :edit, :update]
  before_action :set_section_count, :only => [:new, :create, :edit, :update]

  def index
  	@sections = @page.sections.sorted
  end

  def show
  	@section = Section.find(params[:id])
  end

  def new
  	@section = Section.new(:page_id => @page.id)
    @section_count = Section.count + 1
    @pages = Page.sorted
  end

  def create
  	# Instantiate a new object from form parameters
  	@section = Section.new(section_params)
    @section.page =  @page
  	# Save the object
  	if @section.save
  		flash[:notice] = "Section created successfully"
  		redirect_to(sections_path(:page_id => @page.id))
  	else 
  		# Draw the new 
      @section_count = Section.count + 1
      @pages = Page.sorted
  		render('new')
  	end
  end

  def edit
  	# find object using form parameters
  	@section = Section.find(params[:id])
    @section_count = Section.count
    @pages = Page.sorted
  end

  def update
  	# find object using form parameters
  	@section = Section.find(params[:id])
  	if @section.update_attributes(section_params) 
  		flash[:notice] = 'Section updated successfully'
  		redirect_to(section_path(@section, :page_id => @page.id))
  	else
  		# Draw edit again
  		render('edit')
  	end

  end

  def delete
  	@section = Section.find(params[:id])
  end

  def destroy
  	@section = Section.find(params[:id])
  	@section.destroy
  	flash[:notice] = "Section deleted successfully"
  	redirect_to(sections_path(:page_id => @page.id))
  end

  private
  def section_params
    params.require(:section).permit(:name,:position,:visible,:content_type,:content)
  end

  def find_page
    logger.debug("*** Testing the logger. ***")
    logger.debug("Hello world")
    logger.debug("***************Looking for page #{:page_id}****************")
    @page = Page.find(params[:page_id])
  end

  def set_section_count
    @section_count = @page.sections.count
    if params[:action] == 'new' || params[:action] == 'create'
      @section_count += 1
    end
  end

end
