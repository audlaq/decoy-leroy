class IssuesController < AdminController
  def index
    # TODO: find the decoy by the session
    @decoy = @decoys.first

    key = "1-DSE4Cq_iKpHcDeJdkL-7NNxdVm6Z806AQdxjo4BgCc"
    leroy = "od6"
    troy = "om8lfa4"
    sheet = leroy || troy

    response = HTTParty.get("https://spreadsheets.google.com/feeds/list/#{key}/#{sheet}/public/values?alt=json")

    @issues = response['feed']['entry'].map do |entry|
      a = OpenStruct.new({title: entry["title"]["$t"]})
      a.content = entry["content"]["$t"]
      a
    end
  end


  def create
    title = params[:title]
    content = params[:content]

    decoy = session[:decoy]

    user = User.random_decoy(decoy)

    user.tweet(current_user: current_user, title: title, content: content)
    redirect_to issues_path
  end
end
