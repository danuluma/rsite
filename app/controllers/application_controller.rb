class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include DeviseWhitelist

  include SetSource
  include CurrentUserConcern
  include DefaultPageContent

  def user_for_paper_trail
  # Save the user responsible for the action
  user_signed_in? ? current_user.id : 'Guest'
  end

  
end

