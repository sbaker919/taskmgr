
class TasksController < ApplicationController
   
  def show
    @task = Task.find( params[:id] )
  end
  
  def new
    @title = "Add New Task"
  end
end # end TasksController class