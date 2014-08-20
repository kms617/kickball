require 'sinatra'
require 'CSV'



set :public_folder, File.dirname(__FILE__) + '/public'
set :views_folder, File.dirname(__FILE__) + '/views'


  players = []

  CSV.foreach('public/lackp_starting_rosters.csv', headers: true) do |eachrow|
    players << eachrow
  end

get '/' do
  @playerz = players
  erb :index

end

get '/pos/:position' do
  @playerz = players
  @position = params[:position]

erb :position
end


get '/team/:team_name' do
  @playerz = players
  @team = params[:team_name]

erb :team
end






# players.each do |p|
# html = '''    <!DOCTYPE html>
# <html lang="en">
#   <head>
#     <title>Basic HTML Page</title>
#     <link rel="stylesheet" href="home.css" />
#   </head>

#   <body>
#     <h1>Players</h1>
#     <ul>
# '''

# @players.each do |playa|

#   html += "<li>#{playa}</li>"

# end

# html+= '''
#     </ul>
#   </body>
# </html>
# '''
