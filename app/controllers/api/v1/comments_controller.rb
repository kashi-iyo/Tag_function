class Api::V1::CommentsController < ApplicationController

  def index
    @data = [
      { author: "Pete Hunt", text: "This is one comment" },
      { author: "Jordan Walke", text: "This is *another* comment"}
    ]
  end
end
