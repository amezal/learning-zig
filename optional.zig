const std = @import("std");

pub fn main() void {
    var home: ?[]const u8 = null;
    var name: ?[]const u8 = "Armando";

    name = "Armandox";
    home = "asdf";
    // std.debug.print("home: {any}, name: {s}\n", .{ home.?, name.? });
    std.debug.print("{s}", .{name.?});

    if (home) |h| {
        std.debug.print(" {s}\n", .{h});
        std.debug.print("home: {any}, h: {any}\n", .{ @TypeOf(home), @TypeOf(h) });
    } else {
        std.debug.print(" is homeless\n", .{});
    }

    const h = home orelse "unknown";
    std.debug.print(" {s}\n", .{h});
}
