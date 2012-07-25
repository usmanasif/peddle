task :greet do
  puts "Hello World"
end

desc "update status for the paid users"
task :updateProfile => :environment  do
  Profile.all.each do |profile|
    unless profile.account.free?
      response = GATEWAY.status_recurring(profile.paypal_profile_number)
      #response.billing_start_date
      puts response.params["next_billing_date"]
      profile.expiry_date = response.params["next_billing_date"]
      profile.save!

    end
  end
  #def get_due_date
  #
  #
  #  if profile
  #
  #  end
  #
  #
  #
  #
  #end

end