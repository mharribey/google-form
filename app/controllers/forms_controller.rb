class FormsController < ApplicationController

  def index
    @forms = Form.all
  end

  def new
    if !current_user.admin?
      redirect_to forms_path, notice: "You don't have the rights to access this page."
    else
      @form = Form.new
    end
  end

  def create
    @form = Form.new(form_params)
    if @form.save
      flash[:notice] = 'Successfully created form.'
      redirect_to forms_path
    else
      render :new
    end
  end

  def update
    @form = Form.find(params[:id])
    if @form.update_attributes(form_params)
      redirect_to edit_form_path, notice: 'Successfully updated form'
    else
      render :edit
    end
  end

  def edit
    if !current_user.admin?
      redirect_to forms_path, notice: "You don't have the rights to access this page."
    else
      @form = Form.find(params[:id])
    end
  end

  def show
    @form = Form.find(params[:id])
    if Form.answered(@form, current_user) != true
      render :show
    else
      redirect_to root_path, notice: 'You cannot access to this form.'
    end
  end

  def match
    params[:response].each do |k|
      if !params[:response][k].blank?
      answer = Answer.find(params[:response][k])
      current_user.answers << answer
      end
    end

    redirect_to form_note_path
  end

  def note
    @forms = Form.all
  end

  def destroy
    @form = Form.find(params[:id])
    @form.destroy
    respond_to do |format|
      format.html { redirect_to forms_path, notice: 'Form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def form_params
      params.require(:form).permit(:title, :timer, questions_attributes: [:id, :title, :_destroy, answers_attributes: [:id, :content, :validation, :_destroy]])
    end
end
