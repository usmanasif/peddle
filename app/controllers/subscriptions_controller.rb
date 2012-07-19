class SubscriptionsController < ApplicationController
  def new
    account = Account.find(params[:account_id])
    @subscription = account.subscriptions.build
    if params[:PayerID]
      @subscription.paypal_customer_token = params[:PayerID]
      @subscription.paypal_payment_token = params[:token]
      #@subscription.email = PayPal::Recurring.new(token: params[:token]).checkout_details.email
    end
  end

  def paypal_checkout
    #return render :json => params
    account = Account.find(params[:account_id])
    ppr = PayPal::Recurring.new(
        return_url: subscriptions_new_url(:account_id => account.id),
        cancel_url: root_url,
        description: account.title,
        amount: account.price,
        currency: "USD"
    )
    response = ppr.checkout
    if response.valid?
      redirect_to response.checkout_url
    else
      raise response.errors.inspect
    end
  end
end
