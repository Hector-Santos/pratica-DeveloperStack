/*
  Warnings:

  - You are about to drop the column `answeredById` on the `Answers` table. All the data in the column will be lost.
  - You are about to drop the column `questionIdId` on the `Answers` table. All the data in the column will be lost.
  - You are about to drop the column `askedById` on the `Questions` table. All the data in the column will be lost.
  - You are about to drop the `Users` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `answeredBy` to the `Answers` table without a default value. This is not possible if the table is not empty.
  - Added the required column `questionId` to the `Answers` table without a default value. This is not possible if the table is not empty.
  - Added the required column `askedBy` to the `Questions` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Answers" DROP CONSTRAINT "Answers_answeredById_fkey";

-- DropForeignKey
ALTER TABLE "Answers" DROP CONSTRAINT "Answers_questionIdId_fkey";

-- DropForeignKey
ALTER TABLE "Questions" DROP CONSTRAINT "Questions_askedById_fkey";

-- AlterTable
ALTER TABLE "Answers" DROP COLUMN "answeredById",
DROP COLUMN "questionIdId",
ADD COLUMN     "answeredBy" TEXT NOT NULL,
ADD COLUMN     "questionId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Questions" DROP COLUMN "askedById",
ADD COLUMN     "askedBy" TEXT NOT NULL;

-- DropTable
DROP TABLE "Users";

-- AddForeignKey
ALTER TABLE "Answers" ADD CONSTRAINT "Answers_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES "Questions"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
