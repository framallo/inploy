module Inploy
  module Templates
    module Rails2
      def remote_setup
        if branch.eql? "master"
          checkout = ""
        else
          checkout = "&& $(git branch | grep -vq #{branch}) && git checkout -f -b #{branch} origin/#{branch}"
        end
        remote_run "cd #{path} && 
        #{@sudo}git clone --depth 1 #{repository} #{application} && 
        cd #{application} #{checkout} && 
        #{@sudo}rake inploy:local:setup environment=#{environment}"
      end

      def remote_update
        remote_run "cd #{application_path} && #{@sudo}rake inploy:local:update environment=#{environment}#{skip_steps_cmd}"
      end

      def update_code
        run "git pull origin #{branch}"
      end

      def install_gems
        run "rake gems:install"
      end
    end
  end
end
