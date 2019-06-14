class AssignmentsController < ApplicationController
  def index
    
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = assignment.build(assignment_params)
    if @assignment.save
      flash[:success] = 'Assignment successfully added'
    else
      flash[:alert] = 'Assignment couldn\'t be created'
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def assignment_params
    params.require(:assignment).permit(:work_order_id, :worker_id)
  end
end
