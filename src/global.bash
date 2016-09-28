project_root=$(git rev-parse --show-toplevel)
recipients_path=$project_root/secrets/recipients
recipients=$(ls $recipients_path/*.public 2> /dev/null)
