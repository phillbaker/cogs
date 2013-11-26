#= require helpers/spec_helper

describe "Gear", ->

  it "Can be created with default values for its attributes", ->
    gear = new Coginator.Models.Gear()
    expect(gear.get('teeth')).toBe(32)
    expect(gear.get('radius')).toBe(80)

  describe "toPath", ->
    gear = new Coginator.Models.Gear()
    path = gear.toPath(teeth: gear.get('teeth'), radisu: gear.get('radius'))

    it "returns an svg string for the path describing the gear", ->
      expect(typeof path).toEqual("string")

    it "should start with moveto", ->
      expect(path).toMatch(/^M/)

    it "should end with closepath", ->
      expect(path).toMatch(/Z$/)