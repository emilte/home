#!/usr/bin/env python3.7

import iterm2
from utils import new_pane, new_tab

feide_blue = '#1f4698'


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
        cmd='\n feide && cd frontend && pnpm install && pnpm start \n',
        hexa=feide_blue,
    )

    # Top Right
    top_right_pane = await new_pane(
        session=top_left_pane,
        vertical=True,
        cmd='\n colima start; feide && dc up app \n',
    )

    # Bottom Left
    await new_pane(
        session=top_left_pane,
        cmd='y \n feide && cd frontend \n',
    )

    # Bottom Right
    await new_pane(
        session=top_right_pane,
        cmd='\n feide && code . && pipenv run pipenv:sync \n',
    )


iterm2.run_until_complete(main)
