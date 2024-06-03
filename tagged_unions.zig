const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    // Unions can only have one field set at a time
    // error: union initialization expects exactly one field
    // const n = Number{ .int = 32, .float = 35 };
    const n = Number{ .int = 32 };
    print("{d}\n", .{n.int});
    // We can't access an unset field either.
    // error: access or union field 'float' while field 'int' is active
    // print("{d}\n", .{n.float});

    // the 'void' type is set with = {}
    // var n2 = Number{ .nan = {} };

    print("Timestamp type: {any}\n", .{@TypeOf(Timestamp)});
}

const Number = union {
    int: i64,
    float: f64,
    nan: void,
};

const TimestampType = enum {
    unix,
    datetime,
};

const Timestamp = union(enum) {
    // This is also valid
    // const Timestamp = union(TimestampType) {
    unix: i32,
    datetime: DateTime,

    const DateTime = struct {
        year: u16,
        month: u8,
        day: u8,
        hour: u8,
        minute: u8,
        second: u8,
    };

    fn seconds(self: Timestamp) u16 {
        switch (self) {
            .datetime => |dt| return dt.second,
            .unix => |ts| {
                const seconds_since_midnight: i32 = @rem(ts, 86400);
                return @intCast(@rem(seconds_since_midnight, 60));
            },
        }
    }
};
