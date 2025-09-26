class MoviesController < ApplicationController
  def index
    @sort_by = params[:sort]

    if @sort_by
      @movies = Movie.order(@sort_by)
    else
      @movies = Movie.all
    end
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
      render 'new'
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
      render 'edit'
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path, notice: "#{@movie.title} foi deletado com sucesso."
  end

  
  private # define que os métodos abaixo são privados

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end
end
