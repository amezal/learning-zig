const std = @import("std");

pub const User = struct {
    power: u64 = 0,
    name: []const u8,

    pub const SUPER_POWER = 9000;

    pub fn diagnose(user: User) void {
        if (user.power >= SUPER_POWER) {
            std.debug.print("It's over {d}!!!!\n", .{SUPER_POWER});
        }
    }
};

pub const xd = 4;
