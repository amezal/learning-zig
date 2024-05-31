const std = @import("std");
const User = @import("./models/user.zig").User;

pub fn main() void {
    var a = [_]i32{ 1, 2, 3, 4, 5 };
    var end: usize = 4;
    end += 1;
    var b = a[1..end];
    b = b[1..];
    // const d = c[1..];

    // std.debug.print("{any}\n", .{@TypeOf(b)});
    std.debug.print("{any}\n", .{b});
}
