class LandingController < ApplicationController
  layout 'application', except: 'guest'

  def how_this_works
  end

  def xml
  end

  def json
  end

  def guest
    render layout: false
  end

  def saved_queries
    @saved_queries = SavedQuery.all
  end
end
