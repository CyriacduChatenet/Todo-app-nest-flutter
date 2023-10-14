import { Injectable } from '@nestjs/common';
import { InjectDataSource } from '@nestjs/typeorm';
import { DataSource, Repository } from 'typeorm';

import { CreateTodoDto } from './dto/create-todo.dto';
import { UpdateTodoDto } from './dto/update-todo.dto';
import { Todo } from './entities/todo.entity';

@Injectable()
export class TodoRepository extends Repository<Todo> {
  constructor(@InjectDataSource() datasource: DataSource) {
    super(Todo, datasource.createEntityManager());
  }

  createTodo(createTodoDto: CreateTodoDto) {
    const todo = this.create(createTodoDto);
    return this.save(todo);
  }

  findAllTodos() {
    return this.createQueryBuilder('todo').getMany();
  }

  findOneTodoById(id: string) {
    return this.createQueryBuilder('todo')
      .where('todo.id = :id', { id })
      .getOne();
  }

  updateTodoById(id: string, updateTodoDto: UpdateTodoDto) {
    this.update(id, updateTodoDto);
    return this.findOneTodoById(id);
  }

  removeTodoById(id: string) {
    return this.softDelete(id);
  }
}
