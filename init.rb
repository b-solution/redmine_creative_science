Redmine::Plugin.register :redmine_creative_science do
  name 'Redmine Creative Science plugin'
  author 'Bilel kedidi'
  description 'This is a plugin for Redmine'
  version '0.0.1'

end

class IssueGroupProjectHook < Redmine::Hook::ViewListener
  render_on :view_projects_show_left,
            partial: 'hooks/projects/show_issues_grouped'
end

require 'redmine_creative_science/patches/helpers/projects_helper_patch'
require 'redmine_creative_science/patches/models/time_entry_patch'
require 'redmine_creative_science/patches/models/mailer_patch'
