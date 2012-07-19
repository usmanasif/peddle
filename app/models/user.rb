class User < ActiveRecord::Base
  authenticates_with_sorcery!

  attr_accessible :email, :password, :password_confirmation, :name, :authentications_attributes, :profile_attributes, :role, :store_name


  ROLES = [ADMIN, BUYER, SELLER]

  has_many :authentications, :dependent => :destroy
  accepts_nested_attributes_for :authentications

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  has_many :orders
  has_many :feeds
  has_one :profile_image, :class_name => "Image", :foreign_key => :profile_image_id
  accepts_nested_attributes_for :profile_image
  has_one :bg_image, :class_name => "Image", :foreign_key => :bg_image_id
  accepts_nested_attributes_for :bg_image
  has_and_belongs_to_many :roles
  belongs_to :store
  has_one :profile
  accepts_nested_attributes_for :profile

  validates_associated :profile
  #
  #def call_validate_profile
  #  #validate_profile_on_create(account)
  #  logger.debug "===U #{inspect}\n#{profile.inspect}\n#{account.inspect}"
  #  profile.validate_profile_on_create
  #end




  def admin?
    #self.role == ADMIN
    super_admin_role = Role.find(:first, :conditions => ["name = ?", ADMIN])
    if self.roles.include?(super_admin_role)
      return true
    else
      return false
    end
  end

end
