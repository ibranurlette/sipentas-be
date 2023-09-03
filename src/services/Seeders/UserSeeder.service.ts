import { prisma } from '@/libs';
import { MyBcrypt } from '@/utils/my-bcrypt';
import {  PrismaClient } from '@prisma/client';
import { usersData } from './data/users.data';

export class  UserSeederService {
  public users = new PrismaClient().user;

  public async seedUsers() {
    for (const item of usersData) {
      const { ...restArgs } = item;
      const hashedPassword = await MyBcrypt.encrypt(item.password);
      await prisma.user.upsert({
        where: { username: item.username },
        update: { ...restArgs, password: hashedPassword },
        create: { ...restArgs, password: hashedPassword },
        select: { id: true },
      });
    }

    return { success: true };
  }
}
