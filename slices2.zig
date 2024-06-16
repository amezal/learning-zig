const std = @import("std");

fn Slice(comptime T: type, size: usize) type {
    return struct {
        size: usize,
        ptr: *[size]T,

        const Self = @This();

        fn init(ptr: *[size]T) Self {
            return .{ .size = size, .ptr = ptr };
        }

        fn getItem(self: Self, index: usize) T {
            return self.ptr[index];
        }
    };
}

pub fn main() void {
    var arr = [_]u8{ 0, 1, 2, 3, 4 };
    var slice = Slice(u8, arr.len).init(&arr);
    std.debug.print("{}\n", .{slice.getItem(2)});
    _ = &slice;
}
