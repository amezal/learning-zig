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

    std.debug.print("Arrival time: {s}\n", .{arrivalTimeDesc(6, true)});

    const needle: u32 = 2;
    const haystack = [_]u32{ 1, 2, 4 };
    var haystack2 = [_]u32{ 1, 3, 4 };

    std.debug.print("Needle: {}, Haystack: {any}, Contains: {}\n", .{ needle, haystack, contains(&haystack, needle) });
    std.debug.print("Index of needle: {any}\n", .{indexOf(&haystack, needle)});
    std.debug.print("Arr1: {any}, Arr2: {any}, Eql: {}\n", .{ haystack, haystack2, eql(u32, &haystack, &haystack2) });

    // Iterate over ranges
    // The upper bound is exclusive: 0,1,2,3,4,5,6,7,8,9
    for (0..10) |i| {
        std.debug.print("{d}\n", .{i});
    }
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

// For loops

fn contains(haystack: []const u32, needle: u32) bool {
    for (haystack) |value| {
        if (needle == value) {
            return true;
        }
    }
    return false;
}

// We can iterate through two sequences at once, as long as they have the same length
fn eql(comptime T: type, a: []const T, b: []const T) bool {
    // if they aren't the same length, they can't be equal
    if (a.len != b.len) return false;

    for (a, b) |a_elem, b_elem| {
        if (a_elem != b_elem) return false;
    }
    return true;
}

// We iterate through haystack and the full range (0..)
fn indexOf(haystack: []const u32, needle: u32) ?usize {
    for (haystack, 0..) |value, i| {
        if (needle == value) {
            return i;
        }
    }
    return null;
}
