class LandingController < ApplicationController

  def how_this_works
  end

  def xml
  end

  def json
  end

  def saved_queries
    @saved_queries = SavedQuery.all
  end
end
