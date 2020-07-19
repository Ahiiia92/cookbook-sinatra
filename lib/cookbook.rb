require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)
    # loads file from the CSV file
    @csv_file_path = csv_file_path
    @recipes = []
    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(new_recipe)
    @recipes << new_recipe
    save_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    save_csv
  end

  def find_recipe(recipe_index)
    @recipes[recipe_index]
    save_csv
  end

  private

  # csv_file_path = 'spec/recipes.csv'
  def load_csv
    # read our csv file
    CSV.foreach(@csv_file_path) do |row|
      # push the csv file in our array
      row = Recipe.new(name: row[0], description: row[1], prep_time: row[2], done: row[3], difficulty: row[4])
      @recipes << row
    end
  end

  def save_csv
    # storing our array recipes in a csv
    CSV.open(@csv_file_path, "wb") do |row|
      @recipes.each do |recipe|
        row << [recipe.name, recipe.description, recipe.prep_time, recipe.done, recipe.difficulty]
      end
    end
  end
end
