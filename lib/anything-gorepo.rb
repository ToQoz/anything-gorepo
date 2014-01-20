require "anything-gorepo/version"

module AnythingGorepo
  def self.find paths
    # key:   package name
    # value: package full path
    pkgs = {}

    paths.each do |path|
      packages(path).map do |pkg|
        pkgs[pkg.gsub(path + '/', '')] = pkg
      end
    end

    pkgs[_anything_(pkgs.keys)]
  end

  def self.packages(src, stack = [])
    directories(src).reduce([]) do |pkgs, p|
      pkgs << File.join(src, p)

      if directories(File.join(src, p)).empty?
        pkgs
      else
        pkgs + packages(File.join(src, p))
      end
    end
  end

  private

  def self.directories path
    return [] if Dir.glob(File.join(path, "**/*.go")).empty?

    Dir.entries(path).select do |filename|
      File.directory?(File.join(path, filename))
    end.select do |filename|
      !filename.start_with?('.')
    end
  end
end
