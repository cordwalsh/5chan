class Message
  @@posts = []
  @@id_counter = 0
  attr_reader :author, :id
  attr_accessor :content

  def initialize(attributes)
    @@id_counter +=1
    @author = attributes.fetch(:author)
    @content = attributes.fetch(:content)
    @id = @@id_counter
  end

  def self.all
    return @@posts
  end

  def self.add(message)
    @@posts.push(message)
  end

  def self.search(id)
    @@posts.each do |post|
      if post.id == id
        return post
      end
    end
  end

  def self.edit(id, new_content)
    binding.pry
    (@@posts.select {|message| message.id == id})[0].content = new_content
  end

end
