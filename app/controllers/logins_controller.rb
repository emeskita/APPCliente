class LoginsController < ApplicationController
  def login

  end
  
  def create
    cliente = Cliente.find_by(email: params[:login][:email].downcase)
    if cliente && cliente.authenticate(params[:login][:password])
      log_in cliente
      redirect_to cliente
    else
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'login'
    end
  end
  
  def destroy
    log_out
    redirect_to "/login"
  end 
  
  
end
