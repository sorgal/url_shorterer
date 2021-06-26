class UrlsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_url, except: :create

  def create
    p params[:url]
    url = Url.new(url: params[:url])
    return render json: url.errors.messages unless url.save
    render json: { slug: url.slug }
  end

  def show
    @url.update_stat(request.env['REMOTE_ADDR'])
    render json: { url: @url.url }
  end

  def stats
    render json: { views_count: @url.views_count, unique_views_count: @url.url_views.count }
  end

  private

  def set_url
    @url = Url.find_by!(slug: params[:slug])
  end
end
