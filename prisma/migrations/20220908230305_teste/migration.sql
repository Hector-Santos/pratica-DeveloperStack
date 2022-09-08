/*
  Warnings:

  - You are about to drop the column `questionIdId` on the `Answers` table. All the data in the column will be lost.
  - Added the required column `questionId` to the `Answers` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Answers" DROP CONSTRAINT "Answers_questionIdId_fkey";

-- AlterTable
ALTER TABLE "Answers" DROP COLUMN "questionIdId",
ADD COLUMN     "questionId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "Answers" ADD CONSTRAINT "Answers_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES "Questions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
