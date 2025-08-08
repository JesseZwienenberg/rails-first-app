class PagesController < ApplicationController
  def home
    @visitor_number = rand(1..100)
  end

  def about
  end

  def contact
  end

  def playground
    @current_time = Time.now
    @random_number = rand(1..100)
    @greeting = "Hello from the controller"
    
    @colors = ["red", "green", "blue", "purple", "yellow"]

    @person = {
      name: "Jesse",
      age: 28,
      city: "Haaksbergen"
    }

    @books = [
      { title: "The Rails Way", author: "Obie Fernandez", year: 2022 },
      { title: "Eloquent Ruby", author: "Russ Olsen", year: 2011 },
      { title: "Practical Rails", author: "Alex Johnson", year: 2024 }
    ]

  end
end
