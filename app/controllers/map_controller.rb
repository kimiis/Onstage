class MapController < ApplicationController
  def show
    @stages = Stage.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @stages.geocoded.map do |stage|
      {
        lat: stage.latitude,
        lng: stage.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {map: map}),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end
end
