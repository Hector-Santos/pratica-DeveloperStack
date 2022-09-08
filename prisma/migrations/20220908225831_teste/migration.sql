/*
  Warnings:

  - You are about to drop the column `questionId` on the `Answers` table. All the data in the column will be lost.
  - Added the required column `questionIdId` to the `Answers` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Answers" DROP CONSTRAINT "Answers_questionId_fkey";

-- AlterTable
ALTER TABLE "Answers" DROP COLUMN "questionId",
ADD COLUMN     "questionIdId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "Answers" ADD CONSTRAINT "Answers_questionIdId_fkey" FOREIGN KEY ("questionIdId") REFERENCES "Questions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
