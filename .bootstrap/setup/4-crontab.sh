if [ -z "$(crontab -l | grep '3-configs.sh')" ]; then
  echo "    [Setup/Crontab] Setting up cron job for configuration sync"
  (crontab -l ; echo "0 */6 * * * DOT_CRON=true bash $DOTFILES_DIR/.bootstrap/3-configs.sh") | crontab -
else 
  echo "    [Setup/Crontab] Cron job already exists for configuration sync"
fi