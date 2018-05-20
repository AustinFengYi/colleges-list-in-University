class TodosController < ApplicationController
  before_action :set_todo, only:[:show,:edit,:update,:destroy]

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo =Todo.new(todo_params)
    if @todo.save
       flash[:notice] = "todo was successfully created"
       redirect_to root_path
    else
      flash[:alert] ="todo was failed to create"
      render :new
    end
  end

  def show
     @tasks = @todo.tasks.all
  end

  def edit
     
  end

  def update
    
    if @todo.update(todo_params)
      redirect_to todo_path(@todo)
      flash[:notice] = "todo was successfully updated"
    else
      render :edit
      flash[:alert] ="todo was failed to update"
    end
  end




  def destroy
    #
    @todo.destroy
    redirect_to root_path
    flash[:notice]="todo was successfully deleted"
  end


  def destroy_multiple
  Todo.destroy(params[:todo_ids]) unless params[:todo_ids].blank?

  respond_to do |format|
    format.html { redirect_to root_path }
    format.json { head :no_content }
    flash[:alert]="Departments were all successfully deleted"
  end
end
  

  private
  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:name,:introduction,tasks_attributes:[:id,:name,:introduction,:_destroy])
  end

end
