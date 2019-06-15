# frozen_string_literal: true

class AssignmentsController < ApplicationController
  def index
    @assignments = Assignment.all
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.create(assignment_params)
    if @assignment.save
      flash[:success] = 'Assignment successfully added'
    else
      flash[:alert] = 'Assignment couldn\'t be created'
    end
    redirect_to assignments_path
  end

  private

  def assignment_params
    params.require(:assignment).permit(:work_order_id, :worker_id)
  end
end
