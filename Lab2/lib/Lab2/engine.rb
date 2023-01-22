require 'pony'
require_relative 'zipper'
require_relative 'parser'


class Engine 

  def threads()
    parser = Parser. new(/Pro/)
    t1 = Thread.new{parser.parse('https://stylus.ua/iphone-170/')}
    t2 = Thread.new{parser.parse('https://stylus.ua/ipad-390/')}
    t3 = Thread.new{parser.parse('https://stylus.ua/macbook/')}

    t1.join
    t2.join
    t3.join
  end

  def archive()
    Zipper.new.run('rb', 'output.zip')
  end

  def email()
    Pony.mail(
      :to => 'o.matviy@chnu.edu.ua',
      :via => :smtp,
      :via_options => {
        :address              => 'smtp.gmail.com',
        :port                 => '587',
        :enable_starttls_auto => true,
        :user_name            => 'user',
        :password             => 'password_see_note',
        :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
        :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
      },
      :attachments => { "output.zip" => File.read("./output.zip") }
    )
  end
end