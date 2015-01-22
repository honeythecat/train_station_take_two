class Station

  attr_reader(:station_name, :id)

  define_method(:initialize) do |attributes|
    @station_name = attributes.fetch(:station_name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_stations = DB.exec("SELECT * FROM stations;")
    stations = []
    returned_stations.each() do |station|
      station_name = station.fetch("station_name")
      id = station.fetch("id").to_i()
      stations.push(Station.new({:station_name => station_name, :id => id}))
    end
    stations
  end

  define_method(:save) do
    DB.exec("INSERT INTO stations (station_name) VALUES ('#{@station_name}') RETURNING id;")
    id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |first_station|
    self.station_name().==(first_station.station_name.()).&(self.id().==(first_station.id()))
  end
end