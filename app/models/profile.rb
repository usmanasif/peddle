class Profile < ActiveRecord::Base

  attr_accessible :cc_type, :number, :verification_value, :month, :year, :first_name, :last_name, :street_1, :city, :state, :country, :zip, :account_id, :store_name
  #accepts_nested_attributes_for :user
  belongs_to :user
  belongs_to :account

  #attr_accessor_with_default :currency,'USD'
  attr_accessor :number, :verification_value

  validate :validate_profile_on_create, :on => :create

  #def validate_profile_on_create(account)
  def validate_profile_on_create
    begin
    logger.debug "===P_validate_profile_on_create #{user.inspect}\n#{inspect}"
    #response = GATEWAY.recurring(account.price, credit_card, recurring)
    response = GATEWAY.recurring(self.account.price*100, credit_card, recurring)

    if response.success?
      self.paypal_profile_number = response.params["profile_id"]
      response = GATEWAY.status_recurring(self.paypal_profile_number)
      logger.debug "######  2 2START22 #### 22START22 ##########START############# 22START START22 ###################"
      logger.debug "==== 222 RESPONSE RESPONSE 2222 #{response.inspect}\n"
      logger.debug "########### 22 END 22 END 22 END 22 END END END END END END END END END END ###########################"
      self.credit_card_number = credit_card.display_number
    else
      response.message.split(".").each do |message|
        errors[:base]<< "#{message}."if message.present? && message != "This transaction cannot be processed"
      end
    end
    rescue
      errors[:base] << "this is an error."
    end
  end


  def credit_card
    logger.debug "===pppppppppppppppppppppppppppppppppp credit_card_details #{self.number.inspect}\n#{inspect}"
    ActiveMerchant::Billing::CreditCard.new(
        :brand => self.cc_type,


        :number => self.number,
        :verification_value => self.verification_value,
        :month => self.month,
        :year => self.year,
        :first_name => self.first_name,
        :last_name => self.last_name
    )

  end

  def recurring
    {

        :description => self.store_name,
        :start_date => Time.now,
        :period => "Month",
        #:amount => (self.user.account.price*100),
        :frequency => 1,
        :auto_bill_outstanding_amount => false,
        :max_failed_payments => 1
    }
  end

  #def status_recurring(profile_id)
  #  raise_error_if_blank('profile_id', profile_id)
  #  commit 'GetRecurringPaymentsProfileDetails', build_get_profile_details_request(profile_id)
  #end


end
