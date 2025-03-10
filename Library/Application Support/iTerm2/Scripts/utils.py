import iterm2


def hex_to_rgb(*, hexa: str):
    hx = hexa.lstrip("#")
    return tuple(int(hx[i : i + 2], 16) for i in (0, 2, 4))


async def new_tab(
    *,
    window,
    cmd: str = "",
    hexa: str = "",
    title: str = "",
):
    tab = await window.async_create_tab()
    if title:
        await tab.async_set_title(title)
    session = tab.current_session
    if cmd:
        await session.async_send_text(cmd)
    if hexa:
        await set_color(session=session, hexa=hexa)
    return session


async def new_pane(
    *,
    session,
    cmd: str = "",
    vertical: bool = False,
):
    new_session = await session.async_split_pane(vertical=vertical)
    if cmd:
        await new_session.async_send_text(cmd)
    return new_session


async def set_color(
    *,
    session,
    hexa: str,
):
    change = iterm2.LocalWriteOnlyProfile()
    r, g, b = hex_to_rgb(hexa=hexa)
    color = iterm2.Color(r, g, b)
    change.set_tab_color(color)
    change.set_use_tab_color(True)
    await session.async_set_profile_properties(change)
