namespace :import do
  desc "Call companies api for updates"
    task :company_update do
      Company.company_save
  end

  desc "Call items api for updates"
    task :items_update do
      Items.item_save
    end
end
