import { Controller, Get, Post } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }

  @Get()
  health() {
    return { status: 'ok', uptime: process.uptime(), env: process.env.NODE_ENV || 'dev' };
  }
}
