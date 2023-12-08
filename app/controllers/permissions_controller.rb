class PermissionsController < InheritedResources::Base

  private

    def permission_params
      params.require(:permission).permit(:subject, :actions, role_ids: [])
    end

end
