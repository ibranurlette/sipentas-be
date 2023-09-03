-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('M', 'F');

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "categorie_ppks" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "categorie_ppks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ragam_ppks" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "categorie" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ragam_ppks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pm" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "nik" TEXT NOT NULL,
    "province_id" TEXT NOT NULL,
    "city_od" TEXT NOT NULL,
    "district_id" TEXT NOT NULL,
    "village_id" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "gender" "Gender" NOT NULL DEFAULT 'M',
    "date_birth" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "place_date_Of_birth" TEXT NOT NULL,
    "kode_pos" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "directorat_id" TEXT NOT NULL,
    "sentra_id" TEXT NOT NULL,
    "flag" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "pm_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "provinces" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "provinces_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cities" (
    "id" TEXT NOT NULL,
    "province_id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "cities_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "districts" (
    "id" TEXT NOT NULL,
    "city_id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "districts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "villages" (
    "id" TEXT NOT NULL,
    "district_id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "villages_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "directorats" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "directorats_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sentras" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "province_id" TEXT NOT NULL,
    "city_od" TEXT NOT NULL,
    "district_id" TEXT NOT NULL,
    "village_id" TEXT NOT NULL,

    CONSTRAINT "sentras_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "users_username_key" ON "users"("username");

-- CreateIndex
CREATE UNIQUE INDEX "pm_phone_key" ON "pm"("phone");

-- AddForeignKey
ALTER TABLE "ragam_ppks" ADD CONSTRAINT "ragam_ppks_categorie_fkey" FOREIGN KEY ("categorie") REFERENCES "categorie_ppks"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pm" ADD CONSTRAINT "pm_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pm" ADD CONSTRAINT "pm_province_id_fkey" FOREIGN KEY ("province_id") REFERENCES "provinces"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pm" ADD CONSTRAINT "pm_city_od_fkey" FOREIGN KEY ("city_od") REFERENCES "cities"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pm" ADD CONSTRAINT "pm_district_id_fkey" FOREIGN KEY ("district_id") REFERENCES "districts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pm" ADD CONSTRAINT "pm_village_id_fkey" FOREIGN KEY ("village_id") REFERENCES "villages"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pm" ADD CONSTRAINT "pm_directorat_id_fkey" FOREIGN KEY ("directorat_id") REFERENCES "directorats"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pm" ADD CONSTRAINT "pm_sentra_id_fkey" FOREIGN KEY ("sentra_id") REFERENCES "sentras"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cities" ADD CONSTRAINT "cities_province_id_fkey" FOREIGN KEY ("province_id") REFERENCES "provinces"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "districts" ADD CONSTRAINT "districts_city_id_fkey" FOREIGN KEY ("city_id") REFERENCES "cities"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "villages" ADD CONSTRAINT "villages_district_id_fkey" FOREIGN KEY ("district_id") REFERENCES "districts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sentras" ADD CONSTRAINT "sentras_province_id_fkey" FOREIGN KEY ("province_id") REFERENCES "provinces"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sentras" ADD CONSTRAINT "sentras_city_od_fkey" FOREIGN KEY ("city_od") REFERENCES "cities"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sentras" ADD CONSTRAINT "sentras_district_id_fkey" FOREIGN KEY ("district_id") REFERENCES "districts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sentras" ADD CONSTRAINT "sentras_village_id_fkey" FOREIGN KEY ("village_id") REFERENCES "villages"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
