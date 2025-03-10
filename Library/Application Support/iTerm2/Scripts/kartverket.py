#!/usr/bin/env python3.7

import iterm2
from utils import new_pane, new_tab

header_color = "#045c4c"


# This script was created with the "basic" environment
# which does not support adding dependencies with pip.
async def main(connection):
    # Here's a bit of example code that adds a tab to the current window:
    app = await iterm2.async_get_app(connection)
    window = app.current_window
    if window is None:
        return

    ###############
    # Aneo design #
    ###############

    # Top Left
    top_left_pane = await new_tab(
        window=window,
        cmd="\n cd $REPOS/kartverket && code kartverket.code-workspace && cd backstage-plugin-risk-scorecard-frontend && yarn \n yarn run dev \n",
        hexa=header_color,
        title="Kartverket",
    )

    # Top Right
    top_right_pane = await new_pane(
        session=top_left_pane,
        vertical=True,
        cmd="\n cd $REPOS/kartverket/backstage-plugin-risk-scorecard-backend \n",
    )

    # Bottom Left
    await new_pane(
        session=top_left_pane,
        cmd="\n cd $REPOS/kartverket/backstage-plugin-risk-crypto-service \n",
    )

    # Bottom Right
    await new_pane(
        session=top_right_pane,
        cmd="\n cd $REPOS/kartverket/ \n",
    )


iterm2.run_until_complete(main)
