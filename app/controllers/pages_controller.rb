class PagesController < ApplicationController
    def home
        @spots = Spot.take(3)
    end

    def account_selection
    end

    def profile
        @user = User.find(params[:id])
        if @user.type == 'Customer'
            @profile_name = @user.first_name + @user.last_name
        elsif @user.type == 'Host'
            @profile_name = @user.company_name
        end

    end
end
