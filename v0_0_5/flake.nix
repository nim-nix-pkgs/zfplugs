{
  description = ''This is the plugins for the zfcore framework https://github.com/zendbit/nim.zfcore'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-zfplugs-v0_0_5.flake = false;
  inputs.src-zfplugs-v0_0_5.ref   = "refs/tags/v0.0.5";
  inputs.src-zfplugs-v0_0_5.owner = "zendbit";
  inputs.src-zfplugs-v0_0_5.repo  = "nim.zfplugs";
  inputs.src-zfplugs-v0_0_5.type  = "github";
  
  inputs."zfcore".owner = "nim-nix-pkgs";
  inputs."zfcore".ref   = "master";
  inputs."zfcore".repo  = "zfcore";
  inputs."zfcore".dir   = "v1_1_7";
  inputs."zfcore".type  = "github";
  inputs."zfcore".inputs.nixpkgs.follows = "nixpkgs";
  inputs."zfcore".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-zfplugs-v0_0_5"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-zfplugs-v0_0_5";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}