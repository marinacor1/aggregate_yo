namespace :import do
  desc "Call companies api for updates"
    task :company_update do
      Company.company_save
  end
end
