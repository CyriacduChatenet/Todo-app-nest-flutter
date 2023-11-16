import {
  Column,
  CreateDateColumn,
  DeleteDateColumn,
  Entity,
  OneToMany,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';

import { Role } from '../../auth/enum/role.enum';
import { Todo } from '../../todo/entities/todo.entity';

@Entity()
export class User {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column({ unique: true, nullable: false })
  email: string;

  @Column({ nullable: false })
  username: string;

  @Column({ nullable: false })
  password: string;

  @Column({
    type: 'enum',
    enum: Role,
    default: Role.User,
    nullable: false,
  })
  roles: Role;

  @OneToMany(() => Todo, (todo) => todo.user, { cascade: true })
  todos: Todo[];

  @CreateDateColumn()
  created_at: Date;

  @UpdateDateColumn()
  updated_at: Date;

  @DeleteDateColumn()
  deleted_at: Date;
}
