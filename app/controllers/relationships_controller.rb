class RelationshipsController < ApplicationController
  before_action :signed_in_user
  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    # responde de manera distinto dependiendo del tipo de la petición
    respond_to do |format|
      format.html {redirect_to @user}
      # format.js llamaría en este caso al archivo create.js.erb ya que es el nombre
      # de la función desde donde se llama respondiendo a una petición javascript
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_to do |format|
      format.html {redirect_to @user}
      format.js
    end
  end
end
