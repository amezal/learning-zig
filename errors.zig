const std = @import("std");

pub fn main() !void {
    const req: Request = .{ .url = "https://amezal.com" };
    var res: Response = undefined;
    // action(req, res) catch |err| {
    //     if (err == error.BrokenPipe or err == error.ConnectionResetByPeer) {
    //         return;
    //     } else if (err == error.BodyTooBig) {
    //         res.status = 431;
    //         res.body = "Request body is too big";
    //         std.debug.print("status: {d}, {s}\n", res);
    //     } else {
    //         res.status = 500;
    //         res.body = "Internal Server Error";
    //         std.debug.print("status: {d}, {s}\n", res);
    //         // todo: log err
    //     }
    // };
    action(req, res) catch |err| switch (err) {
        error.BrokenPipe, error.ConnectionResetByPeer => return,
        error.BodyTooBig => {
            res.status = 431;
            res.body = "Request body is too big";
            std.debug.print("status: {d}, {s}\n", res);
            return;
        },
        else => {
            res.status = 500;
            res.body = "Internal Server Error";
            std.debug.print("status: {d}, {s}\n", res);
        },
    };
}

fn action(req: Request, res: Response) !void {
    std.debug.print("{any}, {any}\n", .{ @TypeOf(req), @TypeOf(res) });
    std.debug.print("\x1b[1;31m", .{});
    return HttpError.BodyTooBig;
}

const Request = struct { url: []const u8 };

const Response = struct {
    status: u32,
    body: []const u8,
};

const HttpError = error{
    BrokenPipe,
    ConnectionResetByPeer,
    BodyTooBig,
    XdddXd,
};
