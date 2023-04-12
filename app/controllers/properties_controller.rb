class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
    @nearest_stations = @property.nearest_stations
  end

  def new
    @property = Property.new
    2.times { @property.nearest_stations.build }
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path
    else
      render :new
    end
  end

  def edit
    @property = Property.find(params[:id])
    @property.nearest_stations.build
  end

  def update
    @property = Property.find(params[:id])
    if @property.update(property_params)
      redirect_to properties_path
    else
      render :edit
    end
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to properties_path
  end

  private

  def property_params
    params.require(:property).permit(
                                      :name,
                                      :rent,
                                      :adress,
                                      :age,
                                      :remark,
                                      nearest_stations_attributes: [
                                        :train_line,
                                        :station,
                                        :closeness,
                                        :property_id,
                                        :id,
                                        :_destroy,
                                        ],
                                    )
  end
end
