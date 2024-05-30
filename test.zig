const std = @import("std");
const user = @import("./models/user.zig");

pub fn main() void {
    const sum = add(8999, 2);
    std.debug.print("8999 + 2 = {d}\n", .{sum});
}

fn add(a: i64, b: i64) i64 {
    var sum = a;
    sum += b;
    return sum;
}
