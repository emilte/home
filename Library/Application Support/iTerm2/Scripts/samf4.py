#!/usr/bin/env python3.7

import iterm2
from utils import new_pane, new_tab

samf_red = '#a03033'


# This script was created with the "basic" environment
# which does not support adding dependencies with pip.
async def main(connection):
    # Here's a bit of example code that adds a tab to the current window:
    app = await iterm2.async_get_app(connection)
    window = app.current_terminal_window
    if window is None:
        return

    # Top Left
    top_left_pane = await new_tab(
        window=window,
        cmd='\n samf4 && cd frontend && yarn start \n',
        hexa=samf_red,
    )

    # Top Right
    top_right_pane = await new_pane(
        session=top_left_pane,
        vertical=True,
        cmd='\n colima start; samf4 && cd backend && dc up backend \n',
    )

    # Bottom Left
    await new_pane(
        session=top_left_pane,
        cmd='y \n samf4 && cd frontend \n',
    )

    # Bottom Right
    await new_pane(
        session=top_right_pane,
        cmd='\n samf4 && code . && cd backend \n',
    )


iterm2.run_until_complete(main)
