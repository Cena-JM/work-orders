class WorkOrdersController < ApplicationController
  def new
    @work_order = WorkOrder.new
  end

  def create
    @work_order = work_orders.build(work_orders_params)
    if @work_order.save
      flash[:success] = 'Work Order successfully added'
    else
      flash[:alert] = 'Work Order couldn\'t be created'
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def work_orders_params
    params.require(:work_order).permit(:title, :description, :deadline)
  end
end
