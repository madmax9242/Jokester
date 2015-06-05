class JokesController < ApplicationController

	def index
		@jokes = Joke.all
	end

	def show
		@joke = Joke.find(params[:id])
	end

	def new
		@joke = Joke.new
	end

	def create
		@joke = Joke.new(joke_params)

		respond_to do |format|
			if @joke.save
				format.html { redirect_to @joke, notice: 'Joke saved, funny guy.'}
			else 
				format.html { render :new }
			end
		end
	end

	def update
		respond_to do |format|
			if @joke.update(joke_params)
				format.html { redirect_to @joke, notice: 'Joke was updated'}
			else 
				format.html { render :edit}
			end
		end
	end

	def edit

	end

	def destroy
		Joke.find(params[:id]).destroy
		respond_to do |format|
			format.html { redirect_to jokes_url, notice: 'Joke was removed from list. No more laughing'}
		end
	end

	private 
		def set_jokes
			@joke = Joke.find(params[:id])
		end

		def joke_params
			params.require(:joke).permit(:question, :answer)
		end
end