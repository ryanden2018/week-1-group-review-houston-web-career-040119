# begin to build a simple program that models Instagram

# you should have a User class, a Photo class and a comment class

require "pry"

class User 
    attr_reader :name
    attr_accessor :photos 
    def initialize(name)
        @name = name 
        @photos = []
    end

end

class Photo 
    attr_reader :user 
    attr_accessor :comments
    def initialize
        @comments = []
    end

    def make_comment(comment)
        Comment.new(comment,self)
    end

    def user=(user)
        @user = user 
        user.photos << self 
    end
end

class Comment 
    attr_accessor :comment
    @@all  = []

    def initialize(comment, photo)
        @comment = comment 
        photo.comments << self 
        @@all << self 
    end

    def self.all 
        @@all 
    end
end



sandwich_photo = Photo.new
sophie = User.new("Sophie")
sandwich_photo.user = sophie
sandwich_photo.user.name
# => "Sophie"
sophie.photos
# => [#<Photo:0x00007fae2880b370>]


sandwich_photo.comments
# => []

sandwich_photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch")
a = sandwich_photo.comments
# => [#<Comment:0x00007fae28043700>]


Comment.all
#=> [#<Comment:0x00007fae28043700>]

