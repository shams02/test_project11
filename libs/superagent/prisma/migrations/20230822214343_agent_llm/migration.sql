-- CreateEnum
CREATE TYPE "DocumentType" AS ENUM ('TXT', 'PDF', 'CSV', 'YOUTUBE', 'OPENAPI', 'URL', 'MARKDOWN', 'FIRESTORE', 'PSYCHIC', 'GITHUB_REPOSITORY', 'WEBPAGE', 'STRIPE', 'AIRTABLE', 'SITEMAP', 'NOTION');

-- CreateEnum
CREATE TYPE "ToolType" AS ENUM ('BROWSER', 'SEARCH', 'WOLFRAM_ALPHA', 'REPLICATE', 'ZAPIER_NLA', 'AGENT', 'OPENAPI', 'CHATGPT_PLUGIN', 'METAPHOR');

-- CreateTable
CREATE TABLE "Agent" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "llmId" INTEGER NOT NULL,

    CONSTRAINT "Agent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LLM" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LLM_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Agent_llmId_key" ON "Agent"("llmId");

-- AddForeignKey
ALTER TABLE "Agent" ADD CONSTRAINT "Agent_llmId_fkey" FOREIGN KEY ("llmId") REFERENCES "LLM"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
