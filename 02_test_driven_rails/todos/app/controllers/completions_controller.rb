class CompletionsController < ApplicationController
  def create
    # touch, update the specified timestamps of the model with the current time
    current_user.todos.find(params[:todo_id]).touch :completed_at
    redirect_to todos_path
  end
end
