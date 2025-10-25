Feature: User can manually add movie

Scenario: Add a movie
	Given I am on the RottenPotatoes home page
	When I follow "Adicionar Novo Filme"
	Then I should be on the Create New Movie page
	When I fill in "movie_title" with "Men in Black"
	And I select "PG-13" from "movie_rating"
	And I press "Salvar Filme"
	Then I should be on the RottenPotatoes home page
	And I should see "Men in Black"
