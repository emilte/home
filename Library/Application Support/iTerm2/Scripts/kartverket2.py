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

    ################
    #   Frontend   #
    ################

    # Left
    left_pane = await new_tab(
        window=window,
        cmd="\n cd $REPOS/kartverket/backstage-plugin-risk-scorecard-frontend && yarn install \n yarn dev \n",
        hexa=header_color,
        title="Frontend",
    )

    # Right
    _right_pane = await new_pane(
        session=left_pane,
        vertical=True,
        cmd="\n cd $REPOS/kartverket/backstage-plugin-risk-scorecard-frontend \n",
    )

    ################
    #    Crypto    #
    ################

    # Left
    left_pane = await new_tab(
        window=window,
        cmd="\n cd $REPOS/kartverket/backstage-plugin-risk-crypto-service && colima start \n dcu \n",
        hexa=header_color,
        title="Crypto",
    )

    # Right
    _right_pane = await new_pane(
        session=left_pane,
        vertical=True,
        cmd="\n cd $REPOS/kartverket/backstage-plugin-risk-crypto-service \n",
    )

    ###############
    #   Backend   #
    ###############

    # Left
    left_pane = await new_tab(
        window=window,
        cmd="\n sleep 4 && cd $REPOS/kartverket/backstage-plugin-risk-scorecard-backend && colima start \n dcu appm4 \n",
        hexa=header_color,
        title="Backend",
    )

    # Right
    _right_pane = await new_pane(
        session=left_pane,
        vertical=True,
        cmd="\n cd $REPOS/kartverket/backstage-plugin-risk-scorecard-backend \n",
    )


iterm2.run_until_complete(main)
