class GistQuestionService

# c = GistQuestionService.new(Question.first, User.first).call
# JSON.parse(c.body)["html_url"]

def initialize(question, user, client: nil)
    @question = question
    @test = @question.test
    @user = user
    @client = client || Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
#    @client = client || GitHubClient.new
  end

  def call
    puts gist_params.inspect
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
        description: I18n.t('gist.description', question: @question.id, test: @test.id),
        files: {
            "test-guru-#{@question.id}-#{@user.id}.txt" => {
                content: gist_content
            }
        }
    }
  end

  def gist_content
    content = [@question.body,]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

end