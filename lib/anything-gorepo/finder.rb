module AnythingGorepo
  class Finder
    def initialize src
      @repo_paths = []
      directories(src).each do |host|
        directories(File.join(src, host)).each do |user|
          directories(File.join(src, host, user)).each do |repo|
            @repo_paths << File.join(host, user, repo) # diplay without src
          end
        end
      end
    end

    def find
      _anything_(@repo_paths)
    end

    private

    def directories path
      Dir.entries(path).select do |filename|
        File.directory?(File.join(path, filename))
      end.select do |filename|
        filename != '.' && filename != '..'
      end
    end
  end
end
