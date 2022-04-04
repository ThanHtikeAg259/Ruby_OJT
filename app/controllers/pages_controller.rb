class PagesController < ApplicationController

  # Restrict access so only logged in users can access the secret page:
  before_action :authorize, only: [:index]

  def secret
  end
end
