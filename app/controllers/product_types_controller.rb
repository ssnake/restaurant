class ProductTypesController < ApplicationController

  # устанавливаем список продуктов, типов продуктов и выбираем все из списка
  # для отображения всего каталога на index странице
  before_action :set_all_product_types, only: [:index, :show]
  before_action :set_product_type, only: [:show, :edit, :update, :destroy]
  before_action :set_products_by_product_type, only: [:show]

  # выводим исключение если неверно указан id категории меню
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_product_type
  

  # gjrfpfnm dct njdfhs
  def index
  	@products_all = Product.all.order('title ASC')
    respond_to do |format|
      format.html
      # для экспорта данных в файл
      format.csv { send_data @products_all.to_csv }
    end
  end


  # создание нового типа меню
  def new
  	@product_type = ProductType.new
  end


  # создание и запись нового типа меню
  def create
  	@product_type = ProductType.new(product_type_params)
  	if @product_type.save
  	  redirect_to product_types_path, notice: 'Категория меню добавлена'
  	else
  	  render :new
  	end
  end


  def show
  end


  def edit
  end


  # обновление нового типа меню
  def update
    @product_type.update(product_type_params)
    redirect_to product_types_path, notice: 'Раздел меню обновлен'
  end


  # удаление типа меню
  def destroy
    @product_type.destroy
    redirect_to product_types_path, alert: 'Раздел меню удален'
  end


  private

  # 
  def product_type_params
  	params.require(:product_type).permit(:title)
  end

  def set_all_product_types
    @product_types = ProductType.all
  end

  def set_product_type
    @product_type = ProductType.find(params[:id])
  end

  def set_products_by_product_type
    @products_by_product_type = @product_type.products.order('title ASC')
  end

  # выдаем исключение при неправильно указанном типе меню
  def invalid_product_type
    logger.error "Попытка доступа к несуществующей категории меню #{params[:id]}"
    redirect_to root_path, alert: 'Некорректно указана категория меню'
  end

end
