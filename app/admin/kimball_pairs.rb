ActiveAdmin.register KimballPair do
  filter :category
  filter :words
  filter :created_at

  form do |f|
    f.inputs do
      f.input :category
      f.input :words
    end

    f.buttons
  end

  index do
    column(:words, sortable: 'words') { |resource| link_to resource, [:admin, resource] }
    column(:category)
    default_actions
  end

  show title: :to_s do
    attributes_table :words, :category, :created_at

    active_admin_comments
  end
end
