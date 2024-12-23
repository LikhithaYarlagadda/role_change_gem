module RoleManager
  class RoleChanger
    def self.change_role(user, new_role)
      if user && user.respond_to?(:role)
        user.update!(role: new_role)
        return "Role updated to #{new_role}"
      else
        raise "Invalid user or user does not have a role attribute"
      end
    end
  end
end
