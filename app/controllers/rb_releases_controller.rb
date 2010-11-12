include RbCommonHelper

# Responsible for exposing release CRUD.
class RbReleasesController < RbApplicationController
  unloadable

  def index
    @releases = Release.find(:all, :conditions => { :project_id => @project })
  end

  def show
    @remaining_story_points = 0
    @release.stories.each do |s|
      @remaining_story_points += s.story_points
    end
  end

  def destroy
    @release.destroy
    redirect_to :controller => 'rb_releases', :action => 'index', :project_id => @project
  end
  
end