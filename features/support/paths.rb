module NavigationHelpers
  def path_to(page_name)
    case page_name
    when /the home page/
      movies_path
    when /the RottenPotatoes home page/
      movies_path
    when /the Create New Movie page/
      new_movie_path
    else
      raise "Não consigo encontrar um caminho para '#{page_name}'. Adicione um em features/support/paths.rb"
    end
  end
end

World(NavigationHelpers)