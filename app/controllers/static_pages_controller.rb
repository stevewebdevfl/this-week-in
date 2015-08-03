class StaticPagesController < ApplicationController
  def index
  end

  def show
    hed = Array.new
    sub = Array.new
    doc = Nokogiri::HTML(open("http://ngm.nationalgeographic.com/2015/03/table-of-contents"))
    @hed = doc.css("div.hed").collect {|node| node.text.strip}
    @sub = doc.css("div.sub").collect {|node| node.text.strip}
    @length_mismatch = ""
    if @hed.length !> @sub.length
      @length_mismatch = "HEAD & SUB ARRAYS ARE DIFFERENT LENGTHS.  CHECK YOUR EXTRACT"
    end
    @title = "This Month in National Geographic\n\n"
  end
end
