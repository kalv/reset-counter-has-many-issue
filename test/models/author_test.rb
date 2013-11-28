require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  test "update post counter cache on an author" do
    author = Author.create(name: "Kalv")

    3.times { |n|
      Post.create!(title: "Article #{n}", author: author)
    }

    assert_equal 3, author.reload.posts_count
  end

  test "update comments counter cache on an author" do
    author = Author.create(name: "Kalv")

    3.times { |n|
      p = Post.create!(title: "Article #{n}", author: author)
      p.comments.create!(description: "Blah Blah")
      p.comments.create!(description: "Blah Blah Another")
    }

    assert_equal 6, author.comments.count, "Can count comments from author"

    assert_equal 6, author.reload.comments_count
  end
end
