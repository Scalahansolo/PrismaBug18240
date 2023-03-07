-- CreateEnum
CREATE TYPE "UserType" AS ENUM ('NORMAL', 'PENDING_INVITED');

-- CreateEnum
CREATE TYPE "ApiKeyReadWrite" AS ENUM ('NONE', 'READ', 'WRITE');

-- CreateTable
CREATE TABLE "User" (
    "id" STRING NOT NULL,
    "type" "UserType" NOT NULL DEFAULT 'NORMAL',

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ApiKey" (
    "id" STRING NOT NULL,
    "createdTime" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedTime" TIMESTAMP(3) NOT NULL,
    "clientId" STRING NOT NULL,
    "hashedKey" STRING NOT NULL,
    "userId" STRING NOT NULL,
    "taskAccess" "ApiKeyReadWrite" NOT NULL DEFAULT 'NONE',
    "commentAccess" "ApiKeyReadWrite" NOT NULL DEFAULT 'NONE',
    "projectAccess" "ApiKeyReadWrite" NOT NULL DEFAULT 'NONE',
    "workspaceAccess" "ApiKeyReadWrite" NOT NULL DEFAULT 'NONE',

    CONSTRAINT "ApiKey_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "ApiKey_hashedKey_key" ON "ApiKey"("hashedKey");

-- CreateIndex
CREATE UNIQUE INDEX "ApiKey_userId_clientId_key" ON "ApiKey"("userId", "clientId");

-- AddForeignKey
ALTER TABLE "ApiKey" ADD CONSTRAINT "ApiKey_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
