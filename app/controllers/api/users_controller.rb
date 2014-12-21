module Api
  class UsersController < Api::BaseController

    private

      def user_params
        params.require(:user).permit(:first_name, :last_name)
      end

      def query_params
        params.permit()
      end

  end
end