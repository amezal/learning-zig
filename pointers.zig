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
    std.debug.print("d_ptr[0]: {}, typeof d_ptr: {}\n", .{ d_ptr[0], @TypeOf(d_ptr) });
}
