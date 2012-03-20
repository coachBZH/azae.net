
class Azae < Sinatra::Base

  configure do
    set :haml, :format => :html5
  end

  error do
    'Sorry there was a nasty error - ' + env['sinatra.error'].name
  end

  get '/' do
    haml :index
  end

  get '/devops' do
    haml :devops
  end

  get '/contact' do
    haml :contact
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
