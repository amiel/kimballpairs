desc 'import kimball pairs'

task import: :environment do
  require 'import'
  Import.import
end
