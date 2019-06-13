class WorkersController < ApplicationController
  def new
    @worker = Worker.new
  end

  def create
    @worker = worker.build(worker_params)
    if @worker.save
      flash[:success] = 'worker successfully created'
    else
      flash[:alert] = 'worker couldn\'t be created'
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @worker = Worker.find_by(id: params[:id])
    @worker.destroy
    flash[:success] = 'Worker deleted'
    redirect_back(fallback_location: root_path)
  end

  def update
    @worker = Worker.find(params[:id])
    if @worker.update_attributes(work_params)
      redirect_to @worker
      flash[:success] = "Worker assigned to work order"
    else
      render action: :edit
    end
  end

  private

  def worker_params
    params.require(:worker).permit(:name, :company_name, :email)
  end

  def work_params
    params.require(:worker).permit(:work_order_id)
  end
end
