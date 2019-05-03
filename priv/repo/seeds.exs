"./priv/repo/data.json"
|> File.read!()
|> Objective.Data.create_from_json()
