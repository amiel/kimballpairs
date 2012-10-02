ActiveAdmin.register Submission do
  index do
    column(:words)
    column(:rationale) { |resource| truncate resource.rationale }
    column(:created_at)
    default_actions
  end

  show title: :to_s do
    attributes_table :words, :rationale, :created_at

    active_admin_comments
  end

  sidebar 'Approve' do
    div do
      p("Eventually there will be an 'Approve' button here. Like this:").html_safe +
      button_to('Approve', '#', method: :get).html_safe +
      p("Right now it does nothing, but eventually it will send you to the #{ link_to "new kimball pair page", new_admin_kimball_pair_path } with the relevant fields already filled out").html_safe
    end
  end

#  member_acton :approve, method: :post do
#    submission = Submission.find params[:id]
#    kimball_pair = KimballPair.new # ...
#    redirect_to [:admin, kimball_pair]
#  end
end
