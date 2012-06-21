# encoding: utf-8

class Azae < Sinatra::Base

  configure do
    set :haml, :format => :html5
  end

  error do
    'Sorry there was a nasty error - ' + env['sinatra.error'].name
  end

  get '/' do
    @meta = Meta.new;
    @meta.title = "Partenaire devops"
    @meta.description = 'Azaé : votre partenaire devops'
    @meta.keywords = "Devops, Agile, Scrum, Formation, Linux, Opensource, Puppet, Chef, Architecture web, Cloud"
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
    redirect '/contact'
  end

  def styled_flash 
    display_messages = Array.new
    debug = ""
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
