const std = @import("std");
const user = @import("./models/user.zig");

pub fn main() void {
    const goku = user.User{
        .name = "goku",
        .power = 9001,
    };

    std.debug.print("{s}'s power is {d}\n", .{ goku.name, goku.power });
    std.debug.print("{d}", .{user.xd});
}
