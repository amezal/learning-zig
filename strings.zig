const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    // var name = "Goku";
    // name = "Goka";
    // std.debug.print("name: {s}, typeof name: {any}\n", .{ name, @TypeOf(name) });
    //
    // // an array of 3 booleans with false as the sentinel value
    // const a = [3:true]bool{ false, true, false };
    //
    // // This line is more advanced, and is not going to get explained!
    // std.debug.print("{any}\n\n", .{std.mem.asBytes(&a).*});
    //
    // for (name) |char| {
    //     std.debug.print("{c}\n", .{char});
    // }
    var all_characters: [255]u8 = undefined;

    for (0..all_characters.len) |i| {
        all_characters[@intCast(i)] = @intCast(i);
    }

    for (all_characters) |char| {
        print("{u}\n", .{char});
    }
}
