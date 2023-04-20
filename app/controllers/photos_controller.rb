class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc })


    render({ :template => "photo_templates/index.html.erb"})
  end  

  def show
    url_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => url_id })

    @the_photo = matching_photos.at(0)

    render({ :template => "photo_templates/show.html.erb"})
  end  

  def see_ya
    the_id = params.fetch("toast_id")

    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.at(0)
    
    the_photo.destroy 

    #render({ :template => "photo_templates/see_ya.html.erb"})
    redirect_to("/photos")
  
  end
  
  def create
    # Parameters: {"query_image"=>"v", "query_caption"=>"v", "query_owner_id_box"=>"11"}
    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption") 
    input_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save 

    next_url = "/photos/" + a_new_photo.id.to_s

    #render({ :template => "photo_templates/create.html.erb" })
    redirect_to(next_url)
  end  

  def update
    the_id =params.fetch("modify_id")

    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.at(0)

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption") 
  
    the_photo.image = input_image
    the_photo.caption = input_caption

    the_photo.save

    next_url = "/photos/" + the_photo.id.to_s

    #render({ :template => "photo_templates/update.html.erb" })
    redirect_to(next_url)
  end  
end
