class RepositoriesController < ApplicationController

  def index
    github = GithubService.new({'access_token' => session[:token]})
    github.get_repos
    # puts "GITHUB = #{github}"
    # puts "GITHUB REPOS = #{GithubRepo.all}"
    @repos_array = GithubRepo.all
  end

  def create
    newRepo = GithubService.new({'access_token' => session[:token]})  
    # puts "NEWREPO = #{newRepo}"
    newRepo.create_repo(params[:name])
    redirect_to '/'
  end
end
