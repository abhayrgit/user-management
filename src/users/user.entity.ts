import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity({ name: 'USERS' })
export class User {
  @PrimaryGeneratedColumn('increment', {name: 'ID'})
  id: number;

  @Column({ length: 100, name: 'FIRST_NAME' })
  firstName: string;

  @Column({ length: 100, name: 'LAST_NAME' })
  lastName: string;

  @Column({ unique: true, length: 150, name: 'EMAIL' })
  email: string;

  @Column({ default: true, name: 'IS_ACTIVE' })
  isActive: boolean;
}
