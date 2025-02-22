# CS2 PUGs Bot

A Discord bot to manage CS2 PUGs. Connects to [DatHost API](https://dathost.net/reference/post_api-0-1-cs2-matches).

## Test
If you wish to test the bot without any setup, feel free to [invite it](https://discord.com/oauth2/authorize?client_id=820447661932019734&permissions=2433788944&scope=applications.commands+bot) to your Discord server.

## Setup

1. Install PostgreSQL 9.5 or higher.

   ```
   sudo apt-get install postgresql
   ```

2. Clone the project to your server
   ```
   git clone https://github.com/thboss/g5-discord-bot
   ```

3. Create and activate the virtual environment for Python
   ```
   python3 -m venv .venv
   source .venv/bin/activate
   ```

4. Install the necessary libraries while the virtual environment is active.
   ```
   pip install -r requirements.txt
   ```

5. Run the psql tool with `sudo -u postgres psql` and create a database by running the following commands:

   ```sql
   CREATE ROLE "g5" WITH LOGIN PASSWORD 'yourpassword';
   CREATE DATABASE "g5" OWNER g5;
   ```

   - Be sure to replace `yourpassword` with your own password.

   - Quit psql with `\q`

6. Edit the configuration file
   ```
   cp config.json.template config.json && nano config.json
   ```

7. Apply the database migrations
   ```
   python3 migrate.py up
   ```

8. Finally, start the bot
   ```
   python3 run.py
   ```

9. After closing the bot, exit the virtual environment
   ```
   deactivate
   ```

If you run the bot, don't forget to enter the virtual environment first using `source .venv/bin/activate` and exiting it after the bot is closed using `deactivate`.


## Requirements
- Python 3.8+
- DatHost account.
- You must enable **server members intent** and **server message intent** on your bot developers portal.
- Required Permissions:
  - Manage Roles
  - Manage Channels
  - Manage Messages
  - Send Messages
  - Read Message/View Channels
  - Attach Files
  - Use Slash Commands
  - Connect
  - Move Members

## How to play
- **Create lobby:** Create a lobby using command `/create-lobby` (You can create unlimited number of lobbies as you need)
   - Note: This command requires Administrator permissions.
- **Link Steam:** To participate in lobbies, link your Steam account with the command `/link-steam`. This will grant you the Linked role, indicating you’re ready to join lobbies.
   - You need to link your account only once, but you can reuse this command to change you linked steam.
- **Join Lobby:** Simply, join the lobby voice channel, and bot will automatically add you to the queue.
   - Leave the lobby channel to remove from the queue.
- **Match Setup:** Once the lobby is full, the bot will automatically handle the game setup and notify all players as well as create teams channels, ensuring each player is moved to their respective channel.


## Thanks To

1. [Cameron Shinn](https://github.com/cameronshinn) for his initial implementation of [csgo-league-bot](https://github.com/csgo-league/csgo-league-bot).

