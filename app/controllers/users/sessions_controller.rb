class Users::SessionsController < Devise::SessionsController

  def new
    super
  end

  def create
    super
  end

# 認証が失敗した場合に呼び出されるアクション
  def login_error
  end

  protected
  def auth_options
    # 失敗時に recall に設定したパスのアクションが呼び出されるので変更
    # { scope: resource_name, recall: "#{controller_path}#new" } # デフォルト
    { scope: resource_name, recall: "#{controller_path}#login_error" }
  end

end
