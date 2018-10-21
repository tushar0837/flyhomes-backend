class Api::V1::SurveysController < ApplicationController
  before_action :authenticate_user!

  def create
    create_params = (survey_params || {}).merge(user_id: current_user.id)
    survey = Survey.new(create_params)
    if survey.save!
      render json: {survey: survey}, status:201
    else
      render json: {error: 'Error creating survey'}, status:400
    end
  end

  def show
    survey = Survey.where('user_id =?',current_user.id).first
    if survey
      render json: { message: 'success', survey: survey }, status: 200
    else
      render json: { message: 'No survey Exists for active user'}, status: 404
    end
  end


  def update
    survey = Survey.where('user_id =?',current_user.id).first
    if survey.update(survey_params)
      render json: { message: 'Survey updated', survey: survey}, status: 200
    else
      render json: { message: 'Unable to update survey. Please try again!', survey: survey}, status: 404
    end
  end

  private
  def survey_params
    params.require(:survey).permit(:price_min, :price_max, :places)
  end
end
