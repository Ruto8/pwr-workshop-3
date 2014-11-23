class Api::DigsController < ApplicationController
  def index
    render json: Dig.order("owner_id").all
  end

  def vote
   	user = User.find("1")
  	dig = Dig.find( params[:id] )
  	render json: dig.votes.create!(:voter => user, :amount => params[:amount])
  end

  def update
  	dig = Dig.find(params[:id])
  	dig.update(dig_params)

  	render json: dig
  end

  def create
  	dig = current_user.digs.new(dig_params)
  	dig.save!

  	render json: dig
  end

  def destroy
  	dig = Dig.find(params[:id])
  	dig.destroy

  	render json: {resp: 'success'}
  end

  private
  	def dig_params
  		params.require(:dig).permit(:title, :body, :owner_id)
  	end
end
