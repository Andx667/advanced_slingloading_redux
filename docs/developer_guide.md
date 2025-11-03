# Developer Guide

This page describes how to develop for Advanced Slingloading Redux.

## Listenable Events

| Eventname                             | Arguments                                  | Global? |
| ------------------------------------- | ------------------------------------------ | ------- |
| `aslr_core_API_cargoReleasedEvent`    | `_vehicle, _player, _ropeIndex, _allCargo` | no      |
| `aslr_core_API_ropeShortenedEvent`    | `_vehicle, _player, _ropeIndex`            | no      |
| `aslr_core_API_ropeRetractedEvent`    | `_vehicle, _player, _ropeIndex`            | no      |
| `aslr_core_API_ropePickedupEvent`     | `_vehicle, _player, _ropeIndex`            | no      |
| `aslr_core_API_ropeExtendedEvent`     | `_vehicle, _player, _ropeIndex`            | no      |
| `aslr_core_API_ropeDroppedEvent`      | `_vehicle, _player, _ropeIndex`            | no      |
| `aslr_core_API_ropeDeployedEvent`     | `_vehicle, _player, _cargoCount`           | no      |
| `aslr_core_API_ropeAttachedEvent`     | `_vehicle, _player, _cargo`                | no      |
| `aslr_core_API_emergencyCargoRelease` | `_vehicle, _player, _oldCargo`             | no      |
