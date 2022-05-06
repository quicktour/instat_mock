class FeedController < ApplicationController
  def index
    file_name = "#{params['tpl']}"

    if params['team_id']
      file_name += "_#{params['team_id']}"
    elsif params['player_id']
      file_name += "_#{params['player_id']}"
    end

    file_data = File.read(Rails.root.join('temp_files', "#{file_name}.json"))

    render json: JSON.parse(file_data)
  rescue
    render status: 404
  end
end
