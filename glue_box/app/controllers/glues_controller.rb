class GluesController < ApplicationController

	def index

		if current_user
			puts "======================================"
			puts "I'm logged in as #{current_user.email}"
			puts "======================================"
		else
			puts "======================================"
			puts "            I'm logged out            "
			puts "======================================"
		end

		@test = "test test testing"

	end

	def show

		@glue = Glue.find(params[:id])

	end

	def create

		@glue = Post.new(glue_params)

		if @glue.save
			flash[:notice] = "Glued!"
			redirect_to @glue
		else
			flash[:notice] = "Invalid..."
			redirect_to root
		end

	end

	private

		def glue_params
			params.require(:glue).permit(:title, :user, :content)
		end
		
end