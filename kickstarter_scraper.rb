require "nokogiri"
require "pry"



# project = kickstarter.css("li.project.grid_4").first
# projects: kickstarter.css("li.project.grid_4")
# title: project.css("h2.bbcard_name strong a").text
# image_link: project.css("div.project-thumbnail a img").attribute("src").value
# description: project.css("p.bbcard_blurb").text
# location:  project.css("span.location-name").text
# funded_percent:   project.css("li.first.funded strong").text.gsub("%", "").to_i    #gsub("%", "").to_i removes the % symbol 


def create_project_hash

  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)

  projects = {}


  kickstarter.css("li.project.grid_4").each do |project|
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {}
    projects[title.to_sym][:location] =  project.css("span.location-name").text
    projects[title.to_sym][:image_link] = project.css("div.project-thumbnail a img").attribute("src").value
    projects[title.to_sym][:percent_funded] = project.css("li.first.funded strong").text.gsub("%", "").to_i
    projects[title.to_sym][:description] = project.css("p.bbcard_blurb").text

  end

  x = 1

   projects.each do |pro|
    puts "#{x}:: #{pro}"
    x +=1
   end




  # write your code here
end



create_project_hash

