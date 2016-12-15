class Admin::SessionsController < Devise::SessionsController
  layout "admin_devise"

  def create
    super do |resource|
      # User has successfully signed in, so clear any unused reset token
      if resource.reset_password_token.present?
        resource.reset_password_token = nil
        resource.reset_password_sent_at = nil
        resource.save
      end
    end
    store_location_for(resource, params[:redirect_to])
  end

  def destroy
    super
  end
end
