class PaymentsController < ApplicationController
  def new
    credit_card = {
        :type => '[cc type, e.g. 'visa']',
                                      :number => '[cc number, from test account]',
                                      :verification_value => '123',
                                      :month => '[expiration month, from test account]',
                                      :year => '[expiration year, from test account]',
                                      :first_name => '[first name, can be anything]',
                                      :last_name => '[last name, can be anything]',
                                      :street_1 => '[street address, can be anything]',
                                      :city => '[city, can be anything]',
                                      :state => '[state, can be anything]',
                                      :country => '[use 'US' if you used a U.S. state code above]',
                                                           :zip => '[zip code, can be anything]',
                                                           :email => '[payor email address, can be anything]'
    }
  end
end
