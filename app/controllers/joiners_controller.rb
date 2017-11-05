class JoinersController < ApplicationController
  before_action :set_joiner, only: [:destroy]

  # выбор юзеров, давших запрос на вступление в группу
  def index
    @joiners = Joiner.all
  end


  # создание нового запроса
  def new
    @joiner = Joiner.new
  end


  # создаем запись запроса на вступление в группу
  def create
    @joiner = Joiner.new(group_id: params[:group_id], user_id: params[:user_id])
    if @joiner.save
      redirect_to root_path, notice: 'Вы дали запрос на вступление в группу'
    else
      render :new, alert: 'Запрос на группу не добавлен, что то пошло не так'
    end
  end


  # удаление запроса на вступление в группу
  def destroy
    @joiner.destroy
    redirect_to group_path(@joiner.group_id), 
      alert: 'Запрос ' + @joiner.user.name + ' на добавление в группу удален'
  end

  private
    # установить подавшего запрос на вступление в группу
    def set_joiner
      @joiner = Joiner.find(params[:id])
    end

    # получение параметров подавшего уведомление на вступление в группу
    def joiner_params
      params.require(:joiner).permit(:group_id, :user_id)
    end
end
