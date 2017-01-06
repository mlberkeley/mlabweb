class SubscribersController < ApplicationController
  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      SubscriberMailer.subscribe(@subscriber).deliver_now
      flash[:info] = "Awesome, you have been added to our newsletter database!"
      redirect_to updates_path
    else
      render 'new'
    end
  end

  private

    def subscriber_params
      params.require(:subscriber).permit(:name, :email)
    end
end
