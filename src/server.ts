import { App } from '@/app';
import { AuthRoute } from '@routes/mobile';
import { UserRoute } from '@routes/mobile';
import { SeedersRoute } from './routes/seeders';
import { ValidateEnv } from '@utils/validateEnv';

ValidateEnv();
const seedersRoutes = [new SeedersRoute()];
const userRoutes = [new UserRoute()]
const authRoutes = [new AuthRoute()]

const app = new App([...userRoutes, ...authRoutes, ...seedersRoutes]);

app.listen();
