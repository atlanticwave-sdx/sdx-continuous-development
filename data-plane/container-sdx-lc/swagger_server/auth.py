""" basic Auth """


def basic_auth(username, password):
    """ Basic Auth """
    if username == "guest" and password == "secret":
        return {"sub": "guest", "valid": True}
    return None
