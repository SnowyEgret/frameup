module DS
module FrameUp

  Sketchup.require(File.join(PLUGIN_DIR, 'trimmable'))
  Sketchup.require(File.join(PLUGIN_DIR, 'util'))
  Sketchup.require(File.join(PLUGIN_DIR, 'lumber'))

  class SheetBase
    include Trimmable
    include Util

    def initialize(parameters, position)
      @par = parameters
      @position = position
      @lumber = Lumber.new(parameters)
    end

    def self.test
      Sketchup.require(File.join(PLUGIN_DIR, 'drywall'))
      Sketchup.require(File.join(PLUGIN_DIR, 'strapping'))
      Sketchup.require(File.join(PLUGIN_DIR, 'sheathing_interior'))
      Sketchup.require(File.join(PLUGIN_DIR, 'sheathing_exterior'))
      model = Sketchup.active_model
      model.start_operation('Test', true)
      sel = model.selection
      sel.add(model.active_entities.first) if sel.empty?
      modifier = sel.first
      # sheet = Drywall.new(Parameters.new.parameters, Geom::Point3d.new(0, 0, 0))
      # sheet = Strapping.new(Parameters.new.parameters, Geom::Point3d.new(0, 0, 0))
      # sheet = SheathingExterior.new(Parameters.new.parameters, Geom::Point3d.new(0, 0, 0))
      sheet = SheathingInterior.new(Parameters.new.parameters, Geom::Point3d.new(0, 0, 0))
      sheet.frame(modifier.parent, modifier.copy)
      model.commit_operation
    end
  end
end
end
