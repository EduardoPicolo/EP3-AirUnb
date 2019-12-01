class PagesController < ApplicationController
    def home
        @spots = Spot.take(3)
    end

    def account_selection
    end

    def profile
        @user = User.find(params[:id])
    end
end
