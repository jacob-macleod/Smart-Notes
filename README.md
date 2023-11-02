# smart_notes

This is a notes app made in flutter

## Branches
* `main` is used for full releases
* `development` is used for active development
  * Features in development are pushed to feature branches. Once features are developed they are pushed to development

## Github Actions
A `dart.yml` file is used to provide most of the CI support avaliable. When a change is made to any branch, the code is tested.


On `development` and `main` branches, the code is build and a release is added on Github if the  `tag_name` in `dart.yml` is different to that of the previous release. So everytime a release is created, the `tag_name`, representing the version of the program, should be incremented.


The `tag_name` is in the format `vx.x.x`. If a small patch has been added, the rightmost x should be incremented. If a small feature has been added, the middle x should be incremented and the rightmost x zeroed. If a big feature has been added and the program is significantly different to the previous version, the leftmost x should be incremented and all other xs shoudl be zeroed.


In the `main` branch, the code is anaylsed to confirm it contains no inefficiencies.

## Storage
Notes are stored with Hive
