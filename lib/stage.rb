require 'stage/version'
require 'fileutils'
require 'open3'

module Stage
  class Create
    @@threads = []

    class << self
      def new(name)
        make_base_project(name)
        @@threads.each(&:join)
      end

      private

      def make_project(name)
        make_dir(name)
        Dir.chdir(name)
        make_site_dirs
      end

      def make_site_dirs
        p 'Creating default site...'
        path = File.join(File.dirname(__FILE__), '../templates/webservice/')
        FileUtils.copy_entry(path, '.')
      end

      def make_base_project(name)
        make_dir(name)
        Dir.chdir(name)
        copy_files
        @@threads << Thread.new { npm_install }
        @@threads << Thread.new { bundle_install }
      end

      def npm_install
        p 'Running npm install...'
        `npm install`
        p 'npm install finished'
      end

      def bundle_install
        p 'Running bundle install...'
        `bundle install`
        p 'Bundle install finished'
      end

      def copy_files
        p 'Creating files...'
        path = File.join(File.dirname(__FILE__), '../templates/new')
        FileUtils.copy_entry(path, '.')
      end

      def make_dir(name)
        p 'Creating project...'
        Dir.mkdir(name)
      rescue SystemCallError
        p 'Folder already exists'
        exit 1
      end
    end
  end
end
