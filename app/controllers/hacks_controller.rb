  class HacksController < ApplicationController
    before_action :set_hack, only: [:show, :edit, :update, :destroy]


    # GET /hacks
    # GET /hacks.json
    def index
      @hacks = Hack.all
    end

    # GET /hacks/1
    # GET /hacks/1.json
    def show

      #transform description in array
      array = @hack.description_deux.split
      start_element = ':element:'
      end_element = ':/element:'


        # removing elements
      tags_removed = []
      @isolated_element = isolating_element(array,start_element,end_element)
      @isolated_element.each do |element|
        tags_element_removed = remove_tags(element,":element:",":/element:")
        tags_removed << tags_element_removed
      end

      @titres = []
      @descriptions = []
      @bullets = []
      tags_removed.each do |tag|
        index_of_title = position(tag, ":desc:")

      #   #isolating titles
        titre = tag[0...index_of_title]
        titre = to_string(titre)
        @titres << titre

        #isolating description
        description = tag[(index_of_title + 1)...(tag.length - 1)]
        if description.include? ":bullet:"
          start_element = ':bullet:'
          index_of_title = position(description, ":bullet:")
          description = description[0...index_of_title] 
          description = to_string(description)
          @descriptions << description
        else
          description
          description = to_string(description)
          @descriptions << description
        end

        #bullet
        if tag.include? ":bullet:"
          start_element = ':bullet:'
          end_element = ':/bullet:'
          isolated_bullet = isolating_element(tag,start_element,end_element)
          isolated_bullet.each do |bullet|
            bullet_tag_removed = remove_tags(bullet,start_element,end_element)
            bullet_tag_removed = to_string(bullet_tag_removed)
            @bullets << bullet_tag_removed
          end
        end
      end
      @bullets


    end
    # GET /hacks/new
    def new
      @hack = Hack.new
    end

    # GET /hacks/1/edit
    def edit
    end


    # POST /hacks
    # POST /hacks.json
    def create
      @hack = Hack.new(hack_params)

      respond_to do |format|
        if @hack.save
          format.html { redirect_to @hack, notice: 'Hack was successfully created.' }
          format.json { render :show, status: :created, location: @hack }
        else
          format.html { render :new }
          format.json { render json: @hack.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /hacks/1
    # PATCH/PUT /hacks/1.json
    def update
      respond_to do |format|
        if @hack.update(hack_params)
          format.html { redirect_to @hack, notice: 'Hack was successfully updated.' }
          format.json { render :show, status: :ok, location: @hack }
        else
          format.html { render :edit }
          format.json { render json: @hack.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /hacks/1
    # DELETE /hacks/1.json
    def destroy
      @hack.destroy
      respond_to do |format|
        format.html { redirect_to hacks_url, notice: 'Hack was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    def search
      @results = Hack.search(params[:query], { hitsPerPage: 10 })
    end


  # retraitement

    def position(array,element)
      position = array.index(element.to_s)
    end

    def isolating_element(array, start_element, end_element)
      isolating_element = []
      while start_index = array.find_index(start_element)
          end_index = array.find_index(end_element)
        isolating_element << array.slice!(start_index..end_index)
      end 
      isolating_element
    end


    def to_string(array)
      array.join(" ")
    end


    def remove_tags(array, start_element, end_element)
      position_start = position(array, start_element)
      position_end = position(array, end_element)
      array = array[(position_start + 1)..(position_end - 1)]
    end


    helper_method :isolating_element
    helper_method :remove_tags
    helper_method :extract


    private
      # Use callbacks to share common setup or constraints between actions.
      def set_hack
        @hack = Hack.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def hack_params
        params.require(:hack).permit(:titre, :description, :categorie_une, :qualite, :image, :chapeau, :titre_deux, :description_deux, :titre_trois, :description_trois, :titre_quatre, :description_quatre, :tag_un, :tag_deux, :tag_trois)
      end
  end





















