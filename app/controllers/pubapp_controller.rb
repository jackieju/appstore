class PubappController < ApplicationController

    # used by appreview
    def publish
        appid = params[:appid]
        name = params[:name]
        desc = params[:desc]
        apptype = params[:apptype]
        ver = params[:ver]
        
        p params.inspect
        if appid == nil
          error("Invalid app")
            return
        end
        
        begin
        Pubapp.new({
            :appid=>appid,
            :name=>name,
            :desc=>desc,
            :uid=>@user.id,
            :ver=>ver,
            # :st=>0,
            :type=>apptype,
        }).save!
        rescue Exception=>e
            error(e.message)
            return
        end
        
        success
        
    end
    

    # used by user
    def list
        @list = App.find_by_sql("select * from pubapps order by id desc  limit 50")
    end
    
    def buy
    end
    
    def search
    end
    
    
end
