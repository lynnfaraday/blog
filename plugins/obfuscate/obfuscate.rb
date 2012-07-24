class Ruhoh
  module Compiler
    module Pages
      def self.run(target, page)
        FileUtils.cd(target) {
           # FileUtils.mv("index.html", "blog.html")
            FileUtils.mv("rss.xml", "blogrss.xml")
            FileUtils.cp("../cookies.php", "cookies.php")
            FileUtils.cp("../login.php", "login.php")
        }
      end
    end #Pages
  end #Compiler
end #Ruhoh