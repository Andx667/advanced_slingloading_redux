# Developer Guide

This page describes how to develop for Advanced Slingloading Redux.

## Listenable Events

| Eventname                      | Arguments                                  |
| ------------------------------ | ------------------------------------------ |
| `aslr_core_cargoReleasedEvent` | `_vehicle, _player, _ropeIndex, _allCargo` |
| `aslr_core_ropeShortenedEvent`  | `_vehicle, _player, _ropeIndex`            |
| `aslr_core_ropeRetractedEvent` | `_vehicle, _player, _ropeIndex`            |
| `aslr_core_ropePickedupEvent`  | `_vehicle, _player, _ropeIndex`            |
| `aslr_core_ropeExtendedEvent`  | `_vehicle, _player, _ropeIndex`            |
| `aslr_core_ropeDroppedEvent`   | `_vehicle, _player, _ropeIndex`            |
| `aslr_core_ropeDeployedEvent`  | `_vehicle, _player, _cargoCount`           |
| `aslr_core_ropeAttachedEvent`  | `_cargo, _player`                          |
