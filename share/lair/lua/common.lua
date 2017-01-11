math.randomseed(os.time())

function get_tag_count(variable)
        if type(variable) == "table" then
                return variable.c
        else
                return "0"
        end
end

function print_tag_count(variable)
        if type(variable) == "table" then
                print("  Generator " .. tostring(variable) .. " Particle Count: " .. get_tag_count(variable))
        else
                return "0"
        end
end

function where_in_floor_get_x()
        return tonumber(generator_coarse_x.x) + tonumber(room_coarse_x.x)
end

function where_in_floor_get_y()
        return tonumber(generator_coarse_y.y) + tonumber(room_coarse_y.y)
end

function where_in_room_gen_x()
        return generator_coarse_x.x
end
function where_in_room_gen_y()
        return generator_coarse_y.y
end
function how_long_room_gen_w()
        return generator_coarse_w.w
end
function how_long_room_gen_h()
        return generator_coarse_h.h
end
function what_pixel_is_gen_x()
        return generator_x.x
end
function what_pixel_is_gen_y()
        return generator_y.y
end
function where_is_room_corner_x()
        return room_coarse_x.x
end
function where_is_room_corner_y()
        return room_coarse_y.y
end
function where_is_room_farcorner_x()
        return room_coarse_xw.x
end
function where_is_room_farcorner_y()
        return room_coarse_yh.y
end
function what_pixel_is_room_corner_x()
        return room_x.x
end
function what_pixel_is_room_corner_y()
        return room_y.y
end
function what_pixel_is_room_farcorner_x()
        return room_xw.x
end
function what_pixel_is_room_farcorner_y()
        return room_yh.y
end
function how_long_room_pixels_w()
        return generator_w.w
end
function how_long_room_pixels_h()
        return generator_h.h
end
function how_many_particles_so_far()
        return generator_particle_count.c
end
function how_many_mobiles_so_far()
        return generator_mobile_count.c
end

function print_general_props()
        print("  Generator is at Coarse X: " .. generator_coarse_x.x .. " in the room")
        print("  Generator is at Coarse Y: " .. generator_coarse_y.y .. " in the room")
        print("  Generator is at Coarse X: " .. where_in_floor_get_x() .. " on the floor")
	print("  Generator is at Coarse Y: " .. where_in_floor_get_y() .." on the floor")
        print("  Generator Segment Coarse Width: " .. generator_coarse_w.w)
	print("  Generator Segment Coarse Height: " .. generator_coarse_h.h)
	print("  Generator is at X: " .. generator_x.x)
	print("  Generator is at Y: " .. generator_y.y)
        print("  Segment Starts at Coarse X: " .. room_coarse_x.x)
	print("  Segment Starts at Coarse Y: " .. room_coarse_y.y)
        print("  Segment Ends at Coarse X+Width: " .. room_coarse_xw.x)
	print("  Segment Ends at Coarse Y+Height: " .. room_coarse_yh.y)
        print("  Segment Starts at X: " .. room_x.x)
	print("  Segment Starts at Y: " .. room_y.y)
        print("  Segment Ends at X+Width: " .. room_xw.x)
	print("  Segment Ends at Y+Height: " .. room_yh.y)
        print("  Generator Segment Height: " .. generator_w.w)
	print("  Generator Segment Width: " .. generator_h.h)
        print("  Generator Particle Count: " .. generator_particle_count.c)
	print("  Generator Mobile Count: " .. generator_mobile_count.c)
end
