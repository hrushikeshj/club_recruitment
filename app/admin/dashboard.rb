# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: '' do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        div "Users: #{User.count}"
        div "Clubs: #{Club.count}"
        div "Applications: #{Application.count}"
        div "Submissions: #{ApplicationSubmission.count}"
      end
    end


    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
