class MoviesController < ApplicationController
  
  helper_method :highlight_class

  def index
    @all_ratings = Movie.all_ratings
    
    if params[:commit] == "Refresh" && params[:ratings].nil?
      @ratings_to_show = []
      @permitted_ratings_hash = {}
    elsif params[:ratings]
      @permitted_ratings_hash = params.require(:ratings).permit(@all_ratings.map(&:to_sym)).to_h
      @ratings_to_show = @permitted_ratings_hash.keys
    else
      @ratings_to_show = @all_ratings
      @permitted_ratings_hash = @all_ratings.index_with('1')
    end
    
    @sort_by = params[:sort]

    @movies = Movie.where(rating: @ratings_to_show).order(@sort_by)
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} foi criado com sucesso."
    else
      flash.now[:alert] = "Não foi possível criar o filme."
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path(@movie), notice: "#{@movie.title} foi atualizado com sucesso."
    else
      flash.now[:alert] = "Não foi possível atualizar o filme."
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path, notice: "'#{@movie.title}' foi deletado com sucesso."
  end

  private

  def highlight_class(column_name)
    'bg-yellow-200' if @sort_by == column_name
  end

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end
end
