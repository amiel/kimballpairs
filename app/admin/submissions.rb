ActiveAdmin.register Submission do
  actions :index, :show, :destroy


  scope :all
  scope :unapproved, default: true
  scope :approved

  index do
    column(:words)
    column(:rationale) { |resource| truncate resource.rationale }
    column(:approved) { |resource| link_to resource.kimball_pair, [:admin, resource.kimball_pair] if resource.kimball_pair }
    column(:created_at)
    default_actions
  end

  show title: :to_s do
    attributes_table :words, :rationale do
      row(:approved) { |resource| link_to resource.kimball_pair, [:admin, resource.kimball_pair] if resource.kimball_pair }
      row(:created_at)
    end

    active_admin_comments
  end

  sidebar 'Approve', only: :show do
    semantic_form_for([:admin, KimballPair.new]) do |f|
      f.inputs do
        f.input(:words, input_html: { value: resource.words }) +
        f.input(:category) +
        f.input(:submission_id, as: :hidden, value: resource.id)
      end +

      f.button(:approve)
    end
   #  div do
   #    button_to('Approve', new_admin_kimball_pair_path(kimball_pair: { words: resource.words }), method: :get).html_safe
   #  end
  end

#  member_acton :approve, method: :post do
#    submission = Submission.find params[:id]
#    kimball_pair = KimballPair.new # ...
#    redirect_to [:admin, kimball_pair]
#  end
end
