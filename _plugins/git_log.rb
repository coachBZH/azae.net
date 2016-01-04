require 'git'
require 'pathname'

module Jekyll

  class GitLogGenerator < Jekyll::Generator
    safe :true
    priority :high

    def generate(site)
      git = Git.open(site.source)
      root = Pathname.new site.source

      site.posts.docs.each do |post|
        relative = Pathname.new(post.path).relative_path_from(root).to_s
        contributors = git.log.object(relative).map {|l| l.author.name }.uniq.sort
        post.data['contributors'] = contributors
        post.data['updated'] = git.log.object(relative).first.date
      end
    end
  end
end
