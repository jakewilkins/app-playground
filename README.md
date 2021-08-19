# app-playground
This is a Codespaces enabled place to play with and debug GitHub Apps.

The [apptokit](https://github.com/jakewilkins/apptokit) CLI utility comes installed and there is a `.apptokit.yml` provided which is setup to work with Codespaces created from this repository.

If you're familiar with the [Manifest Creation flow](https://docs.github.com/en/developers/apps/building-github-apps/creating-a-github-app-from-a-manifest) you can use this
by updating the settings in `.apptokit.yml` and the `apptokit manifest setup` command.

Additionally there is a webhook receiver started inside your codespaces and configured to be used by Apps created by the provided `.apptokit.yml`.

Hooks received are logged to `logs/hooks.log`.

To execute a command when a hook is received, create a script in the `hook_processors` directory with the event name and action as the file name. The hook receiver will call this command passing the hook
payload to STDIN of your command. Output of these commands is logged to `logs/<command_name>.log`

You can follow all these logs by running `tail -f log/*.log` in another terminal to follow along with your processes.
