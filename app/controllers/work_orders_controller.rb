class WorkOrdersController < ApplicationController
  def index
    @work_orders = WorkOrder.all
  end

  def show
    @work_order = WorkOrder.find(params[:id])
  end

  def new
    @work_order = WorkOrder.new
  end

  def create
    @work_order = WorkOrder.create(work_orders_params)
    if @work_order.save
      flash[:success] = 'Work Order successfully added'
    else
      flash[:alert] = 'Work Order couldn\'t be created'
    end
    redirect_to work_orders_path
  end

  private

  def work_orders_params
    params.require(:work_order).permit(:title, :description, :deadline)
  end
end
