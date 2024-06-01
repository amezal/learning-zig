const std = @import("std");

pub fn main() void {
    // Single item pointer to a constant.
    const a: u8 = 0;
    const a_ptr = &a;
    // a_ptr.* += 1; // cannot assign to constant
    std.debug.print("a: {}, typeof a_ptr: {}\n", .{ a, @TypeOf(a_ptr) });

    // Single item pointer to a variable.
    var b: u8 = 0;
    const b_ptr = &b;
    b_ptr.* += 1; // Ok
    std.debug.print("b: {}, typeof b_ptr: {}\n", .{ (&b).*, @TypeOf(b_ptr) });

    // Both ptrs are const and can't be modified themselves.
    // a_ptr = &b; // Cannot assign to constant
    // b_ptr = &a; // Cannot assign to constant

    var c_ptr = a_ptr;
    c_ptr = b_ptr; // Ok
    // var c_ptr = b_ptr;
    // c_ptr = a_ptr;
    // Fails because we're casting from a *const u8 (a_ptr) to a *u8 (c_ptr = b_ptr).
    // Which means going from more restrictive to less restrictive.
    std.debug.print("c: {}, typeof c_ptr: {}\n\n", .{ c_ptr.*, @TypeOf(c_ptr) });

    // Multi-item pointers

    var array = [_]u8{ 1, 2, 3, 4, 5, 6 };
    var d_ptr: [*]u8 = &array;

    std.debug.print("d_ptr[0]: {}, typeof d_ptr: {}\n", .{ d_ptr[0], @TypeOf(d_ptr) });
    // d_ptr[1] += 1;
    d_ptr += 1;
    std.debug.print("d_ptr[0]: {}, typeof d_ptr: {}\n", .{ d_ptr[0], @TypeOf(d_ptr) });
    d_ptr -= 4000;
    std.debug.print("d_ptr[0]: {}, typeof d_ptr: {}\n\n", .{ d_ptr[0], @TypeOf(d_ptr) });

    // Pointers to arrays
    const e_ptr = &array;
    std.debug.print("e_ptr[0]: {}, typeof e_ptr: {}\n", .{ e_ptr[0], @TypeOf(e_ptr) });
    e_ptr[1] += 1;
    std.debug.print("e_ptr[1]: {}, typeof e_ptr: {}\n", .{ e_ptr[1], @TypeOf(e_ptr) });
    std.debug.print("array[1]: {}\n", .{array[2]});
    std.debug.print("e_ptr.len: {}\n\n", .{e_ptr.len});

    // Sentinel terminated pointer.
    array[3] = 0;
    const f_ptr: [*:0]const u8 = array[0..3 :0];
    std.debug.print("f_ptr[1]: {}, typeof f_ptr: {}\n\n", .{ f_ptr[1], @TypeOf(f_ptr) });
}
