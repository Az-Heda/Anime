-- CreateTable
CREATE TABLE "Statuses" (
    "Id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "Name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Types" (
    "Id" TEXT NOT NULL PRIMARY KEY,
    "Name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Studios" (
    "Id" TEXT NOT NULL PRIMARY KEY,
    "Name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Seasons" (
    "Id" TEXT NOT NULL PRIMARY KEY,
    "Season" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Images" (
    "Id" TEXT NOT NULL PRIMARY KEY,
    "Url" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Genres" (
    "Id" TEXT NOT NULL PRIMARY KEY,
    "Name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Themes" (
    "Id" TEXT NOT NULL PRIMARY KEY,
    "Name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Anime" (
    "Id" TEXT NOT NULL PRIMARY KEY,
    "Title" TEXT NOT NULL,
    "AlternativeTitle" TEXT,
    "Aired" BIGINT,
    "Duration" BIGINT,
    "Broadcast" INTEGER,
    "Url" TEXT NOT NULL,
    "Season_ID" TEXT NOT NULL,
    "Type_ID" TEXT NOT NULL,
    "CurrentStatus" INTEGER NOT NULL,
    CONSTRAINT "Anime_Season_ID_fkey" FOREIGN KEY ("Season_ID") REFERENCES "Seasons" ("Id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Anime_Type_ID_fkey" FOREIGN KEY ("Type_ID") REFERENCES "Types" ("Id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Anime_CurrentStatus_fkey" FOREIGN KEY ("CurrentStatus") REFERENCES "Statuses" ("Id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Episode" (
    "Id" TEXT NOT NULL PRIMARY KEY,
    "Number" REAL NOT NULL,
    "Title" TEXT,
    "Aired" BIGINT,
    "Duration" BIGINT,
    "Anime_ID" TEXT NOT NULL,
    CONSTRAINT "Episode_Anime_ID_fkey" FOREIGN KEY ("Anime_ID") REFERENCES "Anime" ("Id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Character" (
    "Id" TEXT NOT NULL PRIMARY KEY,
    "Name" TEXT NOT NULL,
    "Url" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Description" (
    "Id" TEXT NOT NULL PRIMARY KEY,
    "Description" TEXT NOT NULL,
    "Anime_ID" TEXT,
    "Episode_ID" TEXT,
    "Character_ID" TEXT,
    CONSTRAINT "Description_Anime_ID_fkey" FOREIGN KEY ("Anime_ID") REFERENCES "Anime" ("Id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Description_Episode_ID_fkey" FOREIGN KEY ("Episode_ID") REFERENCES "Episode" ("Id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Description_Character_ID_fkey" FOREIGN KEY ("Character_ID") REFERENCES "Character" ("Id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Anime_Studio" (
    "Anime_ID" TEXT NOT NULL,
    "Studio_ID" TEXT NOT NULL,

    PRIMARY KEY ("Anime_ID", "Studio_ID"),
    CONSTRAINT "Anime_Studio_Anime_ID_fkey" FOREIGN KEY ("Anime_ID") REFERENCES "Anime" ("Id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Anime_Studio_Studio_ID_fkey" FOREIGN KEY ("Studio_ID") REFERENCES "Studios" ("Id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Anime_Character" (
    "Anime_ID" TEXT NOT NULL,
    "Character_ID" TEXT NOT NULL,

    PRIMARY KEY ("Anime_ID", "Character_ID"),
    CONSTRAINT "Anime_Character_Anime_ID_fkey" FOREIGN KEY ("Anime_ID") REFERENCES "Anime" ("Id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Anime_Character_Character_ID_fkey" FOREIGN KEY ("Character_ID") REFERENCES "Character" ("Id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Anime_Genres" (
    "Anime_ID" TEXT NOT NULL,
    "Genre_ID" TEXT NOT NULL,

    PRIMARY KEY ("Anime_ID", "Genre_ID"),
    CONSTRAINT "Anime_Genres_Anime_ID_fkey" FOREIGN KEY ("Anime_ID") REFERENCES "Anime" ("Id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Anime_Genres_Genre_ID_fkey" FOREIGN KEY ("Genre_ID") REFERENCES "Genres" ("Id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Anime_Theme" (
    "Anime_ID" TEXT NOT NULL,
    "Theme_ID" TEXT NOT NULL,

    PRIMARY KEY ("Anime_ID", "Theme_ID"),
    CONSTRAINT "Anime_Theme_Anime_ID_fkey" FOREIGN KEY ("Anime_ID") REFERENCES "Anime" ("Id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Anime_Theme_Theme_ID_fkey" FOREIGN KEY ("Theme_ID") REFERENCES "Themes" ("Id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Anime_Image" (
    "Anime_ID" TEXT NOT NULL,
    "Image_ID" TEXT NOT NULL,

    PRIMARY KEY ("Anime_ID", "Image_ID"),
    CONSTRAINT "Anime_Image_Anime_ID_fkey" FOREIGN KEY ("Anime_ID") REFERENCES "Anime" ("Id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Anime_Image_Image_ID_fkey" FOREIGN KEY ("Image_ID") REFERENCES "Images" ("Id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Character_Image" (
    "Character_ID" TEXT NOT NULL,
    "Image_ID" TEXT NOT NULL,

    PRIMARY KEY ("Character_ID", "Image_ID"),
    CONSTRAINT "Character_Image_Character_ID_fkey" FOREIGN KEY ("Character_ID") REFERENCES "Character" ("Id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Character_Image_Image_ID_fkey" FOREIGN KEY ("Image_ID") REFERENCES "Images" ("Id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Statuses_Name_key" ON "Statuses"("Name");

-- CreateIndex
CREATE UNIQUE INDEX "Types_Id_key" ON "Types"("Id");

-- CreateIndex
CREATE UNIQUE INDEX "Types_Name_key" ON "Types"("Name");

-- CreateIndex
CREATE UNIQUE INDEX "Studios_Id_key" ON "Studios"("Id");

-- CreateIndex
CREATE UNIQUE INDEX "Studios_Name_key" ON "Studios"("Name");

-- CreateIndex
CREATE UNIQUE INDEX "Seasons_Id_key" ON "Seasons"("Id");

-- CreateIndex
CREATE UNIQUE INDEX "Seasons_Season_key" ON "Seasons"("Season");

-- CreateIndex
CREATE UNIQUE INDEX "Images_Id_key" ON "Images"("Id");

-- CreateIndex
CREATE UNIQUE INDEX "Images_Url_key" ON "Images"("Url");

-- CreateIndex
CREATE UNIQUE INDEX "Genres_Id_key" ON "Genres"("Id");

-- CreateIndex
CREATE UNIQUE INDEX "Genres_Name_key" ON "Genres"("Name");

-- CreateIndex
CREATE UNIQUE INDEX "Themes_Id_key" ON "Themes"("Id");

-- CreateIndex
CREATE UNIQUE INDEX "Themes_Name_key" ON "Themes"("Name");

-- CreateIndex
CREATE UNIQUE INDEX "Anime_Id_key" ON "Anime"("Id");

-- CreateIndex
CREATE UNIQUE INDEX "Episode_Id_key" ON "Episode"("Id");

-- CreateIndex
CREATE UNIQUE INDEX "Character_Id_key" ON "Character"("Id");

-- CreateIndex
CREATE UNIQUE INDEX "Description_Id_key" ON "Description"("Id");
