module Admin
  class TagsController < BaseController
    before_action :set_tag, only: %i[destroy]

    def index
      @tags = Tag.all
    end

    def new
      authorize Tag

      @tag = Tag.new
    end

    def create
      authorize Tag

      @tag = Tag.create(tag_params)

      unless @tag.save
        render :new
        return
      end

      flash[:notice] = 'Tag was successfully created.'
      redirect_to admin_tags_path
    end

    def destroy
      authorize @tag

      @tag.destroy
      flash[:notice] = 'Tag was successfully deleted.'
      redirect_to admin_tags_path
    end

    private

    def set_tag
      @tag = Tag.find_by(slug: params[:slug])
    end

    def tag_params
      params_array = %i[name guideline about text_color_hex bg_color_hex]
      params.require(:tag).permit(params_array)
    end
  end
end
