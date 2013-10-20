require_relative '../../config/environment'

class SiteGenerator

  def self.set_up_dirs
    FileUtils.mkdir_p '_site'
  end

  def self.generate
    self.new.tap { |sg| sg.generate_index }
  end

  def generate_index
    template_content = File.read("lib/views/index.erb")
    index = ERB.new(template_content)
    @correct_answers = CorrectAnswer.all

    File.open('_site/index.html', 'w+') do |f|
    f << index.result(binding)
    end
    open_html_page("_site/index.html")
  end

  def open_html_page(link)
    `open #{link}`
  end

end