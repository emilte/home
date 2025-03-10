#!/usr/bin/env python3.7

import iterm2
from utils import new_pane, new_tab

header_color = "#cd0041"


# This script was created with the "basic" environment
# which does not support adding dependencies with pip.
async def main(connection):
    # Here's a bit of example code that adds a tab to the current window:
    app = await iterm2.async_get_app(connection)
    window = app.current_window
    if window is None:
        return

    # Top Left
    top_left_pane = await new_tab(
        window=window,
        cmd="\n repos && cd potteplante && pnpm install && cd studio-potteplante \n pnpm run dev \n",
        hexa=header_color,
    )

    # Top Right
    top_right_pane = await new_pane(
        session=top_left_pane,
        vertical=True,
        cmd="\n repos && cd potteplante/remix-potteplante \n pnpm run dev \n",
    )

    # Bottom Left
    bottom_left_pane = await new_pane(
        session=top_left_pane,
        cmd="\n repos && cd potteplante/studio-potteplante \n",
    )

    # Bottom Right
    await new_pane(
        session=top_right_pane,
        cmd="\n repos && cd potteplante && code . \n",
    )


iterm2.run_until_complete(main)
