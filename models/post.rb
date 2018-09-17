class Post
attr_accessor :id, :title, :body
def self.open_connection
  conn = PG.connect(dbname: "postgres", user: "postgres")
end

def self.find id
  conn = self.open_connection
  sql = "SELECT * FROM post WHERE id = #{id}"
  result = conn.exec (sql)
  post = self.hydrate result[0]
  post
end

def self.delete id
  conn = self.open_connection
  sql = "DELETE * FROM post WHERE id = #{id}"
end

def self.create
  conn = self.open_connection
  length = "SELECT COUNT(*) FROM post"

  post_id = length
  post_title = @title
  post_body = @body
  sql = "INSERT * INTO post (id, title, body)
VALUES (#{post_id}, #{post_title}, #{post_body})"
end




def self.all
  conn = self.open_connection
  sql = "SELECT id, title, body FROM post ORDER BY id"
  result = conn.exec (sql)

  posts = result.map do |tuple|
    self.hydrate tuple
end
session[:visits] += 1
posts
end

def self.hydrate post_data
  post = Post.new

  post.id = post_data['id']
  post.title = post_data['title']
  post.body = post_data['body']

  post
end


end
