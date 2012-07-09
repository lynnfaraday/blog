class Ruhoh
  module Compiler
    module Pages
      def self.run(target, page)
        FileUtils.cd(target) {
            FileUtils.mv("index.html", "blog.html")
            FileUtils.mv("rss.xml", "blogrss.xml")
        }
      end
    end #Pages
  end #Compiler
end #Ruhoh