module ApplicationHelper

  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    link_to 'Github repository', "https://github.com/#{author}/#{repo}", target: :blank
  end
end
