class TasksController < ApplicationController
  respond_to :html, :json

  def index
    @tasks = Task.all
    respond_with @tasks
  end

  def new
    @task = Task.new
    respond_with @task 
  end
  
  def create
    @task = Task.new(params[:task])
    
    respond_with @task do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def show
    @task = Task.find(params[:id])
    respond_with @task
  end
  
  def update
    @task = Task.find(params[:id])
    respond_with @task do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    respond_with @task
  end

end
