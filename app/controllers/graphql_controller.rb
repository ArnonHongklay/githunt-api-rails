require 'ostruct'

class GraphqlController < ApplicationController
  def new
  end

  def create
    query_string = params[:query]
    query_variables = ensure_hash(params[:variables])
    result = GithuntSchema.execute(query_string,
      variables: query_variables, context: { user: default_user })
    render json: result
  end

  private

  def ensure_hash(query_variables)
    if query_variables.blank?
      {}
    elsif query_variables.is_a?(String)
      JSON.parse(query_variables)
    else
      query_variables
    end
  end

  # not going to mess with login for now, everyone can be me!
  def default_user
    OpenStruct.new(
      login: 'tmeasday',
      avatar_url: 'https://avatars1.githubusercontent.com/u/132554?v=3&s=466',
      html_url: 'https://github.com/tmeasday'
    )
  end

end
