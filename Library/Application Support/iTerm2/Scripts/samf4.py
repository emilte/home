#!/usr/bin/env python3.7

import iterm2
from utils import new_pane, new_tab

samf_red = "#a03033"

pre = "\n samf4 && source backend/aliases.sh \n"


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
        cmd=f"{pre} cd frontend \n yarn ci && yarn start \n",
        hexa=samf_red,
    )

    # Top Right
    top_right_pane = await new_pane(
        session=top_left_pane,
        vertical=True,
        cmd=f"{pre} colima start; cd backend && source aliases.sh \n dcbub \n",
    )

    # Bottom Left
    await new_pane(
        session=top_left_pane,
        cmd=f"{pre} cd frontend \n",
    )

    # Bottom Right
    await new_pane(
        session=top_right_pane,
        cmd=f"{pre} code . ; cd backend && source aliases.sh && poetry-sync \n",
    )


iterm2.run_until_complete(main)
