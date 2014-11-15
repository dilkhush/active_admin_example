class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_address, only: [:edit, :update, :show, :destroy]
  before_action :set_user, only: [:new, :edit, :index]

  def index
    @addresses = @user.addresses
  end

  def new
    @address = @user.addresses.build
  end

  def create
    @address = Address.create(address_params)
    @address.user = current_user
    if @address.save
      flash[:notice] = "Address Succfully created."
      redirect_to user_addresses_path(current_user)
    else
      flash[:alert] = @address.errors.full_messages
      redirect_to :back
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      flash[:notice] = "Address Succfully updated."
      redirect_to user_addresses_path(current_user)
    else
      flash[:alert] = @address.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    if @address.delete
      flash[:notice] = "Address successfully deleted."
    else
      flash[:alert] = "Can not delete address."
    end
    redirect_to user_addresses_path(current_user)
  end

  private
  def set_address
    @address = Address.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def address_params
    params.require(:address).permit(:address1, :address2, :city, :state, :country, :zipcode)
  end
end
