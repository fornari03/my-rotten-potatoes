module MoviesHelper
  def highlight_class(column_name)
    'bg-yellow-200' if @sort_by == column_name
  end
end
