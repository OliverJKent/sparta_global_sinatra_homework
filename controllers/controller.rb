class Controller < Sinatra::Base
  get '/' do
    "Hey Sinatra!"
  end

  set :root, File.join(File.dirname(__FILE__), "..")
  set :view, Proc.new { File.join(root, "views") }

configure :development do
  register Sinatra::Reloader
end

$books = [
  {id: 0,
  title: "Alice in Wonderland",
  desc: "Alice's Adventures in Wonderland (commonly shortened to Alice in Wonderland) is an 1865 novel written by English author Charles Lutwidge Dodgson under the pseudonym Lewis Carroll."
},

  {id: 1,
  title: "The Hobbit",
  desc: "The Hobbit, or There and Back Again is a children's fantasy novel by English author J. R. R. Tolkien."
},

  {id:2,
  title: "The Lion, the Witch and the Wardrobe",
  desc: "The Lion, the Witch and the Wardrobe is a fantasy novel for children by C. S. Lewis, published by Geoffrey Bles in 1950. It is the first published and best known of seven novels in The Chronicles of Narnia (1950–1956)."
},

  {id: 3,
  title: "Harry Potter and the Philosopher's Stone",
  desc: "Harry Potter and the Philosopher's Stone is a fantasy novel written by British author J. K. Rowling. The first novel in the Harry Potter series and Rowling's debut novel, it follows Harry Potter, a young wizard who discovers his magical heritage on his eleventh birthday, when he receives a letter of acceptance to the Hogwarts School of Witchcraft and Wizardry."
},
  {id: 4,
    title: "A Dance with Dragons",
    desc: "A Dance with Dragons is the fifth of seven planned novels in the epic fantasy series A Song of Ice and Fire by American author George R. R. Martin. In some areas the paperback edition was published in two parts titled Dreams and Dust and After the Feast"
}
]

  get "/books/:id" do
    id = params[:id].to_i
    @books = $books[id]
    erb :'books'
  end
end
