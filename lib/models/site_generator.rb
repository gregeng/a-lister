require_relative '../../config/environment'

class SiteGenerator

  def self.set_up_dirs
    FileUtils.mkdir_p '_site'
  end

  def self.generate
    generate_index
  end

  def generate_index # this should be renamed to index
    template_content = File.read("lib/views/index.erb") # this should be renamed to index
    index = ERB.new(template_content)
    @correct_answers = CorrectAnswer.all

    File.open('_site/index.html', 'w+') do |f|
    f << index.result(binding)
    end
  end

end

binding.pry

SiteGenerator.generate