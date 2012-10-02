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
    # button_to 'Approve'
  end

#  member_acton :approve, method: :post do
#    submission = Submission.find params[:id]
#    kimball_pair = KimballPair.new # ...
#    redirect_to [:admin, kimball_pair]
#  end
end
