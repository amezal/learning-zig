const std = @import("std");

pub fn main() void {
    var array = [_]u8{ 0, 1, 2, 3, 4, 5 };
    const array_ptr = array[0..array.len];

    std.debug.print("array_ptr type: {}\n\n", .{@TypeOf(array_ptr)});

    // var zero: usize = 0;

    const a_slice: []u8 = &array;
    a_slice[0] += 1;
    std.debug.print("a_slice[0]: {}, a_slice.len: {}\n\n", .{ a_slice[0], a_slice.len });
}
