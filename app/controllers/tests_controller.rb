class TestsController < ApplicationController
  before_action :set_test, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /tests or /tests.json
  def index
    @tests = Test.all
  end

  # GET /tests/1 or /tests/1.json
  def show
    authorize User
  end

  # GET /tests/new
  def new
    authorize User
    @test = Test.new
    @questions = @test.questions.build
    @options = @questions.options.build
    
  end

  # GET /tests/1/edit
  def edit
    authorize User
  end

  # POST /tests or /tests.json
  def create
    puts "========================="*5
    puts test_params
    puts "========================="*5
    byebug
    @test = Test.new(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to test_url(@test), notice: "Test was successfully created." }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1 or /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to test_url(@test), notice: "Test was successfully updated." }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1 or /tests/1.json
  def destroy
    authorize User
    @test.destroy

    respond_to do |format|
      format.html { redirect_to tests_url, notice: "Test was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def test_params
      params.require(:test).permit(:name, :description,
                                    questions_attributes: [:name , :description,
                                      options_attributes: [:description, :is_true]
                                      ])
    end

    #  def product_params
#       params.require(:product).permit(:name, :upc, :available_on,
#         :properties_attributes => [:property_name,
#           :product_properties_attributes => [:value]
#           ])
#     end
end


# def index
#   @products = Product.all
#   gon.products = Product.all
# end

# def show
#   @product = Product.find(params[:id])
#   @properties = Product.find(params[:id])
# end

# def new
#   @product = Product.new
#   @properties = @product.properties.build
#   @product_properties = @properties.product_properties.build
# end

# def create
#   @product = Product.new(product_params)

#   if @product.save
#   redirect_to products_path,
#   notice: 'The product was successfully created.'
#   else
#     render 'new'
#   end
# end

#   private
#     def product_params
#       params.require(:product).permit(:name, :upc, :available_on,
#         :properties_attributes => [:property_name,
#           :product_properties_attributes => [:value]
#           ])
#     end

#     def get_property
#       @property = Property.find(params[:property_id])
#     end

# end
