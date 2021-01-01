# frozen_string_literal: true

class ServicesController < ApplicationController
  before_action :authenticate_user!, except: [:index] # 非ログインユーザーのアクセス制限
  def index
    @services = Service.all.page(params[:page]).per(6)
  end

  def show
    @service = Service.find(params[:id])
    @review = Review.new
  end

  def edit
    @service = Service.find(params[:id])
    redirect_to services_path, alert: '不正なアクセスです。' if @service.user != current_user
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.user_id = current_user.id
    if @service.save
      redirect_to service_path(@service), notice: '投稿に成功しました。'
    else
      render :new # アクションを返さずにviewを返す
    end
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      redirect_to service_path(@service), notice: '更新に成功しました。'
    else
      render :edit # アクションを返さずにviewを返す
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to services_path
  end

  private

  def service_params
    params.require(:service).permit(:company, :device, :problem, :price, :days, :result, :body, :image)
  end
end
