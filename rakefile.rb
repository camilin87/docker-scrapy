task :build, [:image_name] => [:clean] do |t, args|
    image_name = args[:image_name]
    raise "image_name required" unless image_name
    full_image_name = "camilin87/#{image_name}"

    puts "Generating #{full_image_name}..."

    pwd = File.dirname(__FILE__)

    requirements_file = File.join(pwd, "requirements/", image_name, "./requirements.txt")

    raise "Requirements file #{requirements_file} not found" unless File.exist?(requirements_file)

    mkdir "gen"

    tmp_requirements_file = File.join(pwd, "./gen/requirements.txt")
    cp requirements_file, tmp_requirements_file

    dockerfile = File.join(pwd, "./Dockerfile")
    tmp_dockerfile = File.join(pwd, "./gen/Dockerfile")
    cp dockerfile, tmp_dockerfile

    Dir.chdir("gen") do
        sh %{
            docker build -f Dockerfile -t #{full_image_name} .
        }
    end

    puts "Successfully generated #{full_image_name}"
end

task :clean do
    rm_rf "gen"
end
