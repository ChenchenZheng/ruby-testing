class CompletionsController < ApplicationController
  def create
    # touch, update the specified timestamps of the model with the current time
    todo.touch :completed_at
    redirect_to todos_path
  end

  private

  def todo
    current_user.todos.find(params[:todo_id])
  end
end
