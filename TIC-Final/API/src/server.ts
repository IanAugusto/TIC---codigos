import Fastify from "fastify";
import cors from '@fastify/cors';
import { AppRoutes } from "./routes";

const app = Fastify();
app.register(cors); app.register(AppRoutes);
app.listen({port: 3333}).then(() => {console.log('HTTP Server Running and Listening')})

