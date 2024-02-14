class StampsController < ApplicationController
    before_action :authenticate_user!, only: [:index, :create, :destroy]
    def index
        @newStamp = Stamp.new
        @stamps = current_user.stamps.all
    end

    def create
        @stamp = Stamp.new(stamp_params)
        @stamp.user_id = current_user.id
        if @stamp.save
            redirect_to stamps_path
        else
            @stamps = current_user.stamps.all
            render :index
        end
    end

    def destroy

    end

    private

    def stamp_params
        params.require(:stamp).permit(:event, :record)
    end
end
