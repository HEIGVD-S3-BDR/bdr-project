def success(msg: str | None = None):
    res = dict(status="success")
    if msg:
        res["msg"] = msg
    return res


def error(msg: str | None = None):
    res = dict(status="error")
    if msg:
        res["msg"] = msg
    return res
