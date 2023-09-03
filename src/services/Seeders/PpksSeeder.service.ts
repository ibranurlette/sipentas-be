import { PrismaClient } from '@prisma/client';
import csvtojson from 'csvtojson/v2';

export class PpksSeederService {
  cleanup = async () => {
    const prisma = new PrismaClient();

    await prisma.categoriePpks.deleteMany();
    await prisma.ragamPpks.deleteMany();
  };

  public categoriePpks = async () => {
    let data = [];
    await csvtojson({
      noheader: true,
      output: 'csv',
      delimiter: ',',
    })
      .fromFile('src/services/seeders/data/categoriePpks.csv')
      .then(csvRow => {
        data = csvRow;
      });

    const formattedData = [];
    for (let i = 1; i < data.length; i++) {
      const row = data[i];
      formattedData.push({ id: row[0], name: row[1] });
    }

    const prisma = new PrismaClient();
    await prisma.categoriePpks.createMany({
      skipDuplicates: true,
      data: formattedData,
    });
  };

  public ragamPpks = async () => {
    let data = [];
    await csvtojson({
      noheader: true,
      output: 'csv',
      delimiter: ',',
    })
      .fromFile('src/services/seeders/data/ragamPpks.csv')
      .then(csvRow => {
        data = csvRow;
      });

    const formattedData = [];
    for (let i = 1; i < data.length; i++) {
      const row = data[i];
      formattedData.push({ id: row[0], name: row[1], categorie: row[2] });
    }

    const prisma = new PrismaClient();
    await prisma.ragamPpks.createMany({
      skipDuplicates: true,
      data: formattedData,
    });
  };
}