class StaticPagesController < ApplicationController
  def index
  end

  def show
    hed = Array.new
    sub = Array.new
    doc = Nokogiri::HTML(open("http://ngm.nationalgeographic.com/2015/03/table-of-contents"))
    hed = doc.css("div.hed").collect {|node| node.text.strip}
    sub = doc.css("div.sub").collect {|node| node.text.strip}
    hedlength = hed.length
    sublength = sub.length
    @length_mismatch = ""
    if hedlength != sublength
      @length_mismatch = "HEAD & SUB ARRAYS ARE DIFFERENT LEGNTHS.  CHECK YOUR EXTRACT"
    else
      @title = "This Month in National Geographic"
      @divline = "----------------------------------------------------------------"
      @hedsub = []
      incr = 1
      i = 0
      begin
        @hedsub << hed[i]
        @hedsub << sub[i]
        i += incr
      end while i < hedlength
    end
  end
end

  # -- INTERLEAVE THE ARRAYS --
  # a = [1, 2, 3, 4]
  # b = ["a", "b", "c", "d"]
  # c = []
  # a.each_with_index { |x,i| c << x << b[i]}
  # # c is now [1, "a", 2, "b", 3, "c", 4, "d"]