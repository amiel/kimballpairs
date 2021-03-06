ActiveAdmin.register KimballPair do
  filter :category
  filter :words
  filter :created_at

  form do |f|
    f.inputs do
      f.input :category
      f.input :words
      f.input :comments
    end

    f.buttons
  end

  index do
    column(:words, sortable: 'words') { |resource| link_to resource, [:admin, resource] }
    column(:comments, sortable: false)
    column(:submitted_by, sortable: false)
    column(:category, sortable: false)
    default_actions
  end

  show title: :to_s do
    attributes_table :words, :category, :comments, :submitted_by, :created_at do
      row(:submission) do
        link_to "Submission", admin_submission_path(resource.submission) if resource.submission
      end
    end

    active_admin_comments
  end
end
