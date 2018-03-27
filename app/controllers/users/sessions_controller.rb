class Users::SessionsController < Devise::SessionsController

  def new
    super
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    super
  end
end
