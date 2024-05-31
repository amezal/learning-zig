const std = @import("std");
const User = @import("./models/user.zig").User;

pub fn main() void {
    const a = [4]i32{ 1, 2, 3, 4, 5 };

    const b = a[1..];

    std.debug.print("The number is: {d}\n", .{b[1]});
}
