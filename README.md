# app-playground
This is a Codespaces enabled place to play with and debug GitHub Apps.

The [apptokit](https://github.com/jakewilkins/apptokit) CLI utility comes installed and there is a `.apptokit.yml` provided which is setup to work with Codespaces.

## First steps

- Create a repo using this template
- Launch into a codespace
- Make the /hooks port public (8077)
- Sometimes the hook receiver doesn't start automatically, so run `script/hook-receiver` and ignore it if it complains about a PID file existing.
- Configure the permissions your App needs in the `.apptokit.yml` file.
- run `apptokit manifest setup`
- ????

If you're familiar with the [Manifest Creation flow](https://docs.github.com/en/developers/apps/building-github-apps/creating-a-github-app-from-a-manifest) you can use this
by updating the settings in `.apptokit.yml` and the `apptokit manifest setup` command.

Hooks received are logged to `logs/hooks.log`.

To execute a command when a hook is received, create a script in the `hook_processors` directory with the event name and action as the file name. The hook receiver will call this command passing the hook
payload to STDIN of your command. Output of these commands is logged to `logs/<command_name>.log`

There is an example processor provided which receives `installation-created` events.

You can follow all these logs by running `tail -f log/*.log` in another terminal to follow along with your processes.
