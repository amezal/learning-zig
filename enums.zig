const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    print("{s}\n", .{@tagName(Status.ok)});
    print("{any}\n", .{Status.ok});
    print("Status.ok Type: {any}\n", .{@TypeOf(Status.ok)});
    print("Status Type: {any}\n", .{@TypeOf(Status)});

    print("{}\n", .{Stage.isComplete(Stage.confirmed)});
}

const Status = enum {
    ok,
    bad,
    unknown,
};

const Stage = enum {
    validate,
    awaiting_confirmation,
    confirmed,
    err,

    fn isComplete(self: Stage) bool {
        return self == .confirmed or self == .err;
    }
};
