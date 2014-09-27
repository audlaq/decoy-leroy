class IssuesController < AdminController
  def index
    unless session[:decoy]
      redirect_to decoys_path
      return
    end
    key = "1-DSE4Cq_iKpHcDeJdkL-7NNxdVm6Z806AQdxjo4BgCc"
    leroy = "od6"
    troy = "om8lfa4"

    sheet = session[:decoy].to_sym == :leroy ? leroy : troy

    response = HTTParty.get("https://spreadsheets.google.com/feeds/list/#{key}/#{sheet}/public/values?alt=json")

    @issues = response['feed']['entry'].map do |entry|
      a = OpenStruct.new({title: entry["title"]["$t"]})
      a.content = entry["content"]["$t"]
      a
    end
  end


  def create
    title = params[:title]
    content = params[:content].gsub("excuses: ", "").gsub("Excuses: ", "")

    decoy = session[:decoy]

    user = User.random_decoy(decoy)

    user.tweet(current_user: current_user, title: title, content: content)
    redirect_to issues_path, notice: raw("<a href='https://twitter.com/#{current_user.name}'>Check your twitter!</a>")
  end
end
