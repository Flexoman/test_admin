ActiveAdmin.register Job do

  index do

    resource_class.column_names.each do |name|

      if name.in?(['description', 'seo_title', 'seo_description'])
        column name do |job|
          job[name].to_s.squish.first(50) + (job[name].to_s.squish.size > 50 ? '...' : '')
        end
      else
        column name
      end
    end


    actions
  end

end
