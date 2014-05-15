class RegistrationsController < Devise::RegistrationsController 
  def new_merchant
    resource = build_resource({})
    respond_with resource
  end

  def new_customer
    resource = build_resource({})
    respond_with resource
  end

  def create
    build_resource(sign_up_params)

    #create a linked child-class based on polymorphic associations.
    #remember - this type parameter is coming from routes.rb and different signup types happen from different urls
    child_class = params[:user][:rolable_type].camelize.constantize
    #resource.rolable = child_class.new(params[child_class.to_s.underscore.to_sym])
    resource.rolable = child_class.new(send("#{child_class.to_s.underscore.downcase}_params"))


    if resource.save 
      #UserMailer.registration_confirmation(resource).deliver
      if resource.active_for_authentication?
        set_flash_message :notice, :"signed_up" if is_flashing_format?
        sign_up(resource_name, resource)
        Rails.logger.debug("debug:: User email is #{resource.email}")
	      UserMailer.welcome_mail(resource).deliver
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      Rails.logger.debug("debug:: Sign up failed")
      flash[:notice] = flash[:notice].to_a.concat resource.errors.full_messages
      Rails.logger.debug("debug:: Sign up errors: #{flash[:notice]}")
      respond_with resource
    end
    
  end

  private
  def merchant_params
    params.require(:merchant).permit(:category)
  end
  def customer_params
    params.require(:customer).permit(:something)
  end
end
