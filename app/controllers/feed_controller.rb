class FeedController < ApplicationController
  def index
    tpl_path = "#{params['tpl']}"
    team_path = ''
    player_path = ''

    if params['team_id']
      team_path = params['team_id']
    elsif params['player_id']
      player_path = params['player_id']
    end

    file_data = File.read(Rails.root.join('temp_files', tpl_path, team_path, player_path, 'data.json'))

    render json: JSON.parse(file_data)
  rescue
    render status: 404
  end
end
