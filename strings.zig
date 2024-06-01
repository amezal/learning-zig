const std = @import("std");

pub fn main() void {
    var name = "Goku";
    name = "Goka";
    std.debug.print("name: {s}, typeof name: {any}\n", .{ name, @TypeOf(name) });

    // an array of 3 booleans with false as the sentinel value
    const a = [3:true]bool{ false, true, false };

    // This line is more advanced, and is not going to get explained!
    std.debug.print("{any}\n\n", .{std.mem.asBytes(&a).*});

    for (name) |char| {
        std.debug.print("{c}\n", .{char});
    }
}
