task :build, [:image_name] do |t, args|
    image_name = args[:image_name]
    raise "image_name required" unless image_name

    puts "Valid image_name received"

    # pwd = File.dirname(__FILE__)

    # requirements_file = File.join(pwd, "requirements/", image_name, )
end