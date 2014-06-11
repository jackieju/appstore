# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
require 'settings.rb'
require 'git.rb'
require 'json'

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :before_action
  
  def fileInfoFromPath(path)
      p "===>path #{path}"
      b = path.split('/')
      fname = b[b.size-1]
      if path.start_with?("/")
          b = b[1..b.size-1]
      end
          prj = b[0]
       p "===>prj=#{prj} #{b.size}"
       cat = b[1]
       cat2 = nil
       if (b.size > 2)
           cat2 = b[2]
       end
      r =  {
           :path=>path,
           :project=>prj,
           :fname=>fname,
           :cat1=>cat,
           :cat2=>cat2,
           :relative_path=>b[1..b.size-1].join("/"),
           :relative_dir=>b[1..b.size-2].join("/")

       }
       p r
      return {
          :path=>path,
          :project=>prj,
          :fname=>fname,
          :cat1=>cat,
          :cat2=>cat2,
          :relative_path=>b[1..b.size-1].join("/"),
          :relative_dir=>b[1..b.size-2].join("/")
          
      }
  end
  def before_action
      @user = User.new
  end
  def error(msg, data=nil)
       ret = {
          "error"=>msg
      }
      ret = ret.merge(data) if data
      render :text=>ret.to_json
      # render :text=>"{\"error\":\"#{msg}\"}"
  end
  def success(msg="OK", data=nil)
      ret = {
          "OK"=>msg
      }
      ret = ret.merge(data) if data
      render :text=>ret.to_json
      
  end
  
  def repo_url(repo)
      # "#{@user.name}@#{g_SETTINGS[:git_server]}:#{g_SETTINGS[:repo_root]}/#{repo}"
      "#{$git_user}@#{g_SETTINGS[:git_server]}:#{g_SETTINGS[:repo_root]}/#{repo}"
  end
  
  def workspace_path
      "#{g_SETTINGS[:workspace_root]}/#{@user.name}"
  end
  
  def repo_ws_path(repo)
      "#{g_SETTINGS[:workspace_root]}/#{@user.name}/#{repo}"
      
  end
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
