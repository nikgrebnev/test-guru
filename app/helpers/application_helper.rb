module ApplicationHelper

  def current_year
    Time.now.year
  end

  def github_url(author, repo)
    link_to t('nav.github'), "https://github.com/#{author}/#{repo}", target: :blank
  end

  def flash_message()
    content_tag :p, flash[:alert], class: 'flash alert' if flash[:alert]
  end

  def copyright_line()

  end
end
