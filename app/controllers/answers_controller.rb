class AnswersController < ApplicationController

  def new
    # @answer = Answer.new
    if logged_in?
      @answer = Answer.new # this was original - the method was added
    else
      redirect_to root_url, :flash => { :error => "Please sign in to answer a question!" }
    end
  end

  def show
  end

  def create
    @answer = Answer.new(answer_params)
    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer.question, notice: 'You just answered this question. Awesome!' }
        format.json { render action: 'show', status: :created, location: @answer }
      else
        format.html { render action: 'new' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # added this
  # def destroy
  #   if (logged_in? && answer_author?) || (current_user == User.find(1))
  #     @answer.destroy
  #     redirect_to show_question_path
  #   else
  #     redirect_to show_question_path(@question), :flash => { :error => "You can't delete someone else's answer!" }
  #   end
  # end

  private
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def answer_params
      params.require(:answer).permit(:content, :user_id, :question_id)
    end

    # added this
    def answer_author?
      @answer.user == current_user
    end

end
