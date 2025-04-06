{ pkgs, ... }:

{
  languages.python = {
    enable = true;
    venv.enable = true;
    venv.requirements = ''
      numpy
      pandas
      scipy

      scikit-learn
      tensorflow[and-cuda]
      ngboost

      crps
      shap

      optuna

      xarray
      pyarrow
      xskillscore

      matplotlib
      plotly
      seaborn

      jupyter
      ipykernel
      jupyterlab
      jupyterlab-vim

      jupytext
    '';
  };

  languages.r.enable = true;

  packages = [
    pkgs.libgcc
    pkgs.rPackages.tidyverse
    pkgs.rPackages.countrycode
    pkgs.rPackages.peacesciencer
    pkgs.rPackages.tictoc
    pkgs.rPackages.fastDummies
  ];
}
