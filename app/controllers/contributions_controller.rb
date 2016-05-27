class ContributionsController < ApplicationController
  def add_contribution
    c = VisitorContribution.create(search_term: params[:contribution][:search_term], 
                                  description: params[:contribution][:description])
    c.update_attribute(:user_id, params[:contribution][:user_id].to_i)
    redirect_to root_url
    
    #respond_to do |format|
    #  format.js
    #end
  end
end