# 4. Storage in Pouta

There  is at  least one  type of  storage available  on every  virtual
machine: the file system defined by the virtual machine image. This is
the primary  disk of the virtual  machine. In addition, it  may have a
certain  amount  of additional  local  disk  space called  **ephemeral
storage** in OpenStack terminology defined by the flavor. This storage
is visible on the machine as a second hard disk.

This  storage  is   only  available  for  as  long  as   you  run  the
machine. When you terminate the  machine, the data is lost. You should
not store  any persistent  data here,  and the  storage should  not be
considered reliable.  For  persistent storage you can  use volumes and
Object storage which are introduced in Chapters 4.2 and 4.3.

## [4.1 Ephemeral storage]

## [4.2 Persistent volumes]

## [4.3 Snapshots]

## [4.4 Object Storage]

|                    | | | | |
|--------------------|-----|----------------|-----|---------------------------------------|
| [Previous chapter] |     | [One level up] |     | [Next chapter][4.1 Ephemeral storage] |

  [4.1 Ephemeral storage]: https://research.csc.fi/pouta-ephemeral-storage
  [4.2 Persistent volumes]: https://research.csc.fi/pouta-persistent-volumes
  [4.3 Snapshots]: https://research.csc.fi/pouta-snapshots
  [4.4 Object Storage]: https://research.csc.fi/pouta-object-storage
  [Previous chapter]: https://research.csc.fi/application-development-in-pouta
  [One level up]: https://research.csc.fi/pouta-user-guide
