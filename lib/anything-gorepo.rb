require "anything-gorepo/version"
require "anything-gorepo/finder"

module AnythingGorepo
  def self.find src
    File.join(src, Finder.new(src).find)
  end
end
