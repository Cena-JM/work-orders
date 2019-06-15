class WorkersController < ApplicationController
  def index
    @workers = Worker.all
  end

  def show
    @worker = Worker.with_work_orders.find(params[:id])
  end

  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.create(worker_params)
    if @worker.save
      flash[:success] = 'worker successfully created'
    else
      flash[:alert] = 'worker couldn\'t be created'
    end
    redirect_to workers_path
  end

  private

  def worker_params
    params.require(:worker).permit(:name, :company_name, :email)
  end
end
