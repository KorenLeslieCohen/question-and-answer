class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
    if params[:search]
      @questions = Question.search(params[:search]).order("created_at DESC")
    else
      @questions = Question.all.order('created_at DESC')
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    if logged_in?
      @question = Question.new # this was original - the method was added
    else
      redirect_to questions_path, :flash => { :error => "Make sure you're logged in!!" }
    end
  end

  # GET /questions/1/edit
  def edit
     if !logged_in?
      redirect_to root_path, :flash => { :error => "Make sure you're logged in!" }
    elsif !question_author?
      redirect_to questions_path, :flash => { :error => "You can't edit someone else's question!" }
    end
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Your question was successfully posted. Awesome!' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'You successfully updated your question. Cool!' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    if (logged_in? && question_author?) || (current_user == User.find(1))
      @question.destroy
      redirect_to questions_path
    else
      redirect_to questions_path(@question), :flash => { :error => "You can't delete someone else's question!" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title, :content, :user_id, :tag_ids => [], :tags_attributes => [:id, :name], :answers_attributes => [:content, :user_id])
    end

    def question_author?
      @question.user == current_user
    end
end
