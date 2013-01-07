# encoding: utf-8

class Azae < Sinatra::Base
  @flash

  configure do
    set :haml, :format => :html5
  end

  error do
    'Sorry there was a nasty error - ' + env['sinatra.error'].name
  end

  before do
    cache_control :public, :must_revalidate, :max_age => 60
  end

  get '/' do
    @meta = Meta.new;
    @meta.title = "Spécialiste devops"
    @meta.description = 'Azaé, votre partenaire devops'
    @meta.keywords = "Devops, Agile, Scrum, Formation, Linux, Opensource, Puppet, Chef, Architecture web, Cloud, Lille, Roubaix, Tourcoing, Villeneuve d'ascq"
    haml :index
  end

  get '/devops' do
    @meta = Meta.new;
    @meta.title = "Devops"
    @meta.description = "Définition et description du mouvement devops"
    @meta.keywords = "Devops, Autonomie, Scrum, Kanban, Dashboard, Exploitation, Agile, Puppet, Nagios, Git, Collaboration"
    haml :devops
  end

  get '/contact' do
    @meta = Meta.new;
    @meta.title = "Contact"
    @meta.description = "Contacter Azaé"
    @meta.keywords = "Contact, Thomas Clavier, Azaé"
    haml :contact
  end

  get '/merci' do
    @meta = Meta.new;
    @meta.title = "Merci"
    @meta.description = "Contacter Azaé"
    @meta.keywords = "Contact, Thomas Clavier, Azaé"
    flash "Votre message à bien été envoyé"
    haml :contact
  end

  get '/apropos' do
    @meta = Meta.new;
    @meta.title = "À propos"
    @meta.description = "Les valeurs d'Azaé"
    @meta.keywords = "Logiciel libre, Partage, Motivation, Valeurs, Philosophie, Organisation"
    haml :about
  end

  get '/offre' do
    haml :offre
  end

  post '/contact' do
    Pony.mail :to        => "contact@azae.net",
              :from      => params[:email],
              :subject   => "[Azaé.net] demande de contact, #{params[:nom]}",
              :html_body => haml(:contact_email, {:layout => :layout_mail}),
              :via       => :smtp
    flash "Votre message à bien été envoyé"
    redirect '/merci'
  end

  get '/sitemap.xml' do
    map = XmlSitemap::Map.new('azae.net') do |m|
      m.add('/devops')
      m.add('/contact')
      m.add('/apropos')
    end

    headers['Content-Type'] = 'text/xml'
    map.render
  end

  def styled_flash 
    display_messages = Array.new
    if @flash != nil
      @flash.each do |type, messages| 
        messages.each do |message|
          display_messages << "  <div class='flash #{type}'>#{message}</div>\n"
        end
      end
      "<div id='flash'>\n" + display_messages.join + "</div>"
    end
  end

  def flash (message, type = :notice)
    @flash = Hash.new if @flash == nil
    @flash[type] = Array.new if @flash[type] == nil
    @flash[type] << message
  end 
end

class Meta
  attr_accessor :description, :keywords, :title
end
