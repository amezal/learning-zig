const std = @import("std");

pub fn main() void {
    const method = "head";

    // if (std.mem.eql(u8, method, "GET") or std.mem.eql(u8, method, "HEAD")) {
    //     std.debug.print("GETTING DATA", .{});
    // } else if (std.mem.eql(u8, method, "POST")) {
    //     std.debug.print("SENDING DATA\n", .{});
    // } else {
    //     std.debug.print("UNKNOWN METHOD\n", .{});
    // }

    if (std.ascii.eqlIgnoreCase(method, "GET") or std.ascii.eqlIgnoreCase(method, "HEAD")) {
        std.debug.print("GETTING DATA\n", .{});
    } else if (std.ascii.eqlIgnoreCase(method, "POST")) {
        std.debug.print("SENDING DATA\n", .{});
    } else {
        std.debug.print("UNKNOWN METHOD\n", .{});
    }

    const power: i32 = 9001;
    // Conditional expressions, zig has no need for ternary operator
    const super = if (power > 9000) true else false;

    std.debug.print("Super: {}\n", .{super});

    std.debug.print("Anniversary: {s}\n", .{anniversaryName(4)});

    std.debug.print("Anniversary: {s}\n", .{arrivalTimeDesc(6, true)});
}

// Switch
fn anniversaryName(years_married: u16) []const u8 {
    switch (years_married) {
        1 => return "paper",
        2 => return "cotton",
        3 => return "leather",
        4 => return "flower",
        5 => return "wood",
        6 => return "sugar",
        else => return "no more gifts for you",
    }
}

fn arrivalTimeDesc(minutes: u16, is_late: bool) []const u8 {
    switch (minutes) {
        0 => return "arrived",
        1, 2 => return "soon",
        3...5 => return "no more than 5 minutes",
        else => {
            if (!is_late) {
                return "sorry, it'll be a while";
            }
            return "never";
        },
    }
}
