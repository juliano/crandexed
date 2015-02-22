#!/bin/bash
echo '0 12 * * * rake crandexed:update' | crontab -
