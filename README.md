# PrismaBug18240

Minimal example to show [bug with Prisma](https://github.com/prisma/prisma/issues/18240)

## Repro...
In order to repo the issue... just add `userAccess      ApiKeyReadWrite @default(NONE)` to the `ApiKey` model and 
attempt to generate a new migration.