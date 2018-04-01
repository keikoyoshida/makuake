class Users::SessionsController < Devise::SessionsController

  respond_to :html, :js

  def new
    super
  end

  def create
    binding.pry
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

# 認証が失敗した場合に呼び出されるアクション
  def login_error
  end

  protected
  def auth_options
    # 失敗時に recall に設定したパスのアクションが呼び出されるので変更
    # { scope: resource_name, recall: "#{controller_path}#new" } # デフォルト
    { scope: resource_name, recall: "#{controller_path}#login_error" }
    binding.pry
  end

end
