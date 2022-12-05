defmodule BitcoinCommandline.CLI do
  def main(args) do
    options = [switches: [currency: :string], aliases: [f: :currency]]
    {opts,_,_} = OptionParser.parse(args, options)
    IO.inspect opts, label: "Command Line Arguments"
  end
end