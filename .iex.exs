colors = fn -> 
  for i <- 0..255 do
    IO.ANSI.color(i) <> " #{i} " <> IO.ANSI.reset()
  end
  |> Enum.join()
end

white = fn(txt) ->
  IO.ANSI.color(231) <> txt <> IO.ANSI.reset()
end

gray = fn(txt) ->
  IO.ANSI.color(241) <> txt <> IO.ANSI.reset()
end

yellow = fn(txt) ->
  IO.ANSI.color(222) <> txt <> IO.ANSI.reset()
end

sky = fn(txt) ->
  IO.ANSI.color(120) <> txt <> IO.ANSI.reset()
end

lavender = fn(txt) ->
  IO.ANSI.color(98) <> txt <> IO.ANSI.reset()
end

clear = fn -> 
  #IO.ANSI.clear()
  "" 
end
   
# #{colors.()}

IO.puts ~s"""
  #{clear.()}
  #{yellow.("Welcome to e-Matrix's Elixir Docker Developer")}
  ---------------------------------------------------------------------------------------

  Version 0.0.0, 2022-07-29
  #{gray.("Author Andreas Altendorfer, <andreas.altendorfer@e-matrix.at>, <andi@iboard.cc>")}
  #{gray.("Co-author Jonas Grünberger, <jonas@iboard.cc>")}

  #{white.("Usage:")}

  #{sky.("YOUR_DEV_PATH")} start anywhere on your system, 
      in a fresh and empty directory.
      Example: #{lavender.("/home/frank/elixir-projects")}

  0.) cd #{sky.("YOUR_DEV_PATH")} 
  1.) git clone git@github.com:e-matrix/elixir_docker_dev #{lavender.("elixir_developer")}
  2.) cd YOUR_DEV_PATH/#{lavender.("elixir_developer")}
  3.) docker-compose build
  4.) docker-compose up -d postgres          (optional if postgres is needed)
  5.) docker-compose run --rm elixir-dev
       runs an IEX shell in an empty, not yet created, project

  You should now see this introduction in an #{white.("iex-shell")}. The first prompt you
  see here shall be #{white.("iex(1)>")}.

  You're placed in an empty environment with no elixir-code being installed yet.

  Exit the container by pressing #{white.("Ctrl-C")} twice.

  6.) create a directory 'src' #{yellow.("mkdir src")} This is what the container works on

  If you haven't any source yet (an Elixir/Phoenix project) you may create a new Phoenix-
  project with  ...

  7.) #{yellow.("docker-compose run --rm elixir-dev \"mix phx.new --live phoenix_example_app\"")}
    

  #{sky.("START DEVELOPPING FOR PROJECT " <> (System.get_env("PROJECT") || "n/a"))}
  #{sky.("CURRENT DIRECTORY " <> File.cwd! )}
  """
