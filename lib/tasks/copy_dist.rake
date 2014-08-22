def ec(cmd)
  puts cmd
  puts `#{cmd}`
end

task :copy_dist => :environment do
  #ember = File.expand_path(Rails.root + "/../ember")
  ember = "/code/orig/toptal_project/ember"
  rails = Rails.root

  ec "cd #{ember} && ember build"

  ec "rm -rf #{rails}/public/assets"
  ec "rm  #{rails}/public/index.html"

  ec "cp #{ember}/dist/index.html #{rails}/public"
  ec "cp -r #{ember}/dist/assets #{rails}/public"
end