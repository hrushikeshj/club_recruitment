ActiveAdmin.register ApplicationSubmission do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :application_id, :club_id, :preference_no, :status, :marks, :selected
  #
  # or
  #
  # permit_params do
  #   permitted = [:application_id, :club_id, :preference_no, :status, :marks, :selected]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
