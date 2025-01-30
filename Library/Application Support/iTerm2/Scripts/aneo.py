#!/usr/bin/env python3.7

import iterm2
from utils import new_pane, new_tab

header_color = "#ffc328"


# This script was created with the "basic" environment
# which does not support adding dependencies with pip.
async def main(connection):
    # Here's a bit of example code that adds a tab to the current window:
    app = await iterm2.async_get_app(connection)
    window = app.current_terminal_window
    if window is None:
        return

    ###############
    # Aneo design #
    ###############

    # Top Left
    top_left_pane = await new_tab(
        window=window,
        cmd="\n aneo-design-start \n",
        hexa=header_color,
    )

    # Top Right
    top_right_pane = await new_pane(
        session=top_left_pane,
        vertical=True,
        cmd="\n aneo-design; code . \n",
    )

    # Bottom Right
    await new_pane(
        session=top_right_pane,
        cmd="\n aneo && cd apps/docs \n",
    )

    ###############
    #   Aneo web  #
    ###############

    # Top Left
    top_left_pane = await new_tab(
        window=window,
        cmd="\n aneo-start \n",
        hexa=header_color,
    )

    # Top Right
    top_right_pane = await new_pane(
        session=top_left_pane,
        vertical=True,
        cmd="\n aneo; code . \n",
    )

    # # Bottom Left
    # bottom_left_pane = await new_pane(
    #     session=top_left_pane,
    #     cmd='\n aneo \n',
    # )

    # Bottom Right
    await new_pane(
        session=top_right_pane,
        cmd="\n aneo && cd apps/web \n",
    )


iterm2.run_until_complete(main)
