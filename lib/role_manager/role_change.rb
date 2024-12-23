module RoleManager
    class RoleChanger
      def initialize(current_user, target_user)
        @current_user = current_user
        @target_user = target_user
      end
  
      def change_role(new_role)
        raise "Unauthorized" unless authorized?
  
        @target_user.role = new_role
        if @target_user.save
          { success: true, message: "Role updated successfully." }
        else
          { success: false, errors: @target_user.errors.full_messages }
        end
      end
  
      private
  
      def authorized?
        @current_user.role == "editor"
      end
    end
  end
  