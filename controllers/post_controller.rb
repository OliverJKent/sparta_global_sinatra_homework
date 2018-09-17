class Post_controller < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), "..")
  set :view, Proc.new { File.join(root, "views") }

configure :development do
  register Sinatra::Reloader
end



# $posts = [
#   {id: 0,
#   title: "book 0",
#   body: "body of book0"
# },
#
#   {id: 1,
#   title: "book 1",
#   body: "body of book1"
# },
#
#   {id: 2,
#   title: "book2",
#   body: "body of book"
# },
#
#   {id: 3,
#   title: "post3",
#   body: "body of post3"
# }
# ]


  get "/test" do
    Post.all.to_yaml
  end


  get "/" do
    @posts = Post.all
    erb :'posts/index'
  end

  get "/new" do
      @posts = {
        id: "",
        title: "",
        body: ""
      }
      erb :'posts/new'
    end

  get "/:id" do
    id = params[:id].to_i
    # @posts = $posts[id]
    @posts = Post.find id
    erb :'posts/posts'
  end




  post '/' do 
    @title = params[:title]
    @body = params[:body]
    Post.create
    redirect "/"
    # "create"

  end

  get '/:id/edit' do
    id = params[:id].to_i
    @posts = $posts[id]
    erb :'posts/edit'
  end

  delete '/:id' do
    id = params[:id].to_i
    Post.delete
    redirect '/'
  end




end
