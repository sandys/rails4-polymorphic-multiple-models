class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   # Setup accessible (or protected) attributes for your model
  #attr_accessible :email, :name, :phone, :password, :password_confirmation, :remember_me, :rolable_type, :rolable_attributes

  belongs_to :rolable, :polymorphic => true

  def merchant?
    if rolable_type == 'Merchant'
      true
    end
  end

  def customer?
    if rolable_type == 'Customer'
      true
    end
  end
end
