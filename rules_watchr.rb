require 'open3'
ENV["WATCHR"] = "1"
system 'clear'
system "rm __pycache__ -rf"

def run(cmd, enviroment={})
  puts(cmd)
  system(enviroment, cmd)
#  stdin, stdout, stderr = Open3.popen3(cmd)
#  puts stdout.gets(nil)
#  puts stderr.gets(nil)
end

def growl(result)
  message = result ? "OK" : "FAILED"
  growlnotify = `which notify-send`.chomp
  title = "Watchr Test Results"
  image = (result) ? ".watchr_images/passed.png" : ".watchr_images/failed.png"
  options = %("#{title}" "#{message}" -i #{File.expand_path(image)})
  system %(#{growlnotify} #{options} &)
end

watch( '(.+)\.md' )  do |md|
#  system 'clear'
  puts "#{md[0]} was updated"
  result = run("kramdown #{md[0]} --template document.html --smart-quotes lsquo,rsquo,laquo,raquo -o html > #{md[1]}.html")
  growl result
  puts ("\n\n")
end
