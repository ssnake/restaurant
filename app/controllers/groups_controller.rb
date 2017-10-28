class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :create]
  before_action :set_joiners, only: [:show]

  include CurrentCart
  before_action :set_group_cart, only: [:show]


  # GET /groups
  # GET /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1
  # GET /groups/1.json
  def show
  end

  # GET /groups/new
  def new
    #@group = Group.new
    @new_group = @user.groups.build
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    #@group = Group.new(group_params)
    @new_group = @user.groups.build(group_params)
    respond_to do |format|
      if @new_group.save
        # создателя группы также записываем в члены группы
        @user.members.create(group_id: @new_group.id, user_id: @user.id)
        format.html { redirect_to @new_group, notice: 'Группа создана! Вы можете ей управлять' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @new_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to @group, notice: 'Группа обновлена' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Группа успешно удалена' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:name)
    end

    def set_user
      @user = current_user
    end

    def set_joiners
      @joiners = Joiner.where(group_id: @group.id)
    end


end
