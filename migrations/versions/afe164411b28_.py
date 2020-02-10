"""empty message

Revision ID: afe164411b28
Revises: 8cf10c9efd0e
Create Date: 2020-01-29 18:13:08.647607

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import postgresql

# revision identifiers, used by Alembic.
revision = 'afe164411b28'
down_revision = '8cf10c9efd0e'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('person_life_span')
    op.add_column('person', sa.Column('birth_day', sa.Integer(), nullable=True))
    op.add_column('person', sa.Column('birth_era_fk', sa.Integer(), nullable=True))
    op.add_column('person', sa.Column('birth_month_fk', sa.Integer(), nullable=True))
    op.add_column('person', sa.Column('birth_year', sa.Integer(), nullable=True))
    op.add_column('person', sa.Column('death_day', sa.Integer(), nullable=True))
    op.add_column('person', sa.Column('death_era_fk', sa.Integer(), nullable=True))
    op.add_column('person', sa.Column('death_month_fk', sa.Integer(), nullable=True))
    op.add_column('person', sa.Column('death_year', sa.Integer(), nullable=True))
    op.create_foreign_key(None, 'person', 'era', ['death_era_fk'], ['id'])
    op.create_foreign_key(None, 'person', 'era', ['birth_era_fk'], ['id'])
    op.create_foreign_key(None, 'person', 'month', ['death_month_fk'], ['id'])
    op.create_foreign_key(None, 'person', 'month', ['birth_month_fk'], ['id'])
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint(None, 'person', type_='foreignkey')
    op.drop_constraint(None, 'person', type_='foreignkey')
    op.drop_constraint(None, 'person', type_='foreignkey')
    op.drop_constraint(None, 'person', type_='foreignkey')
    op.drop_column('person', 'death_year')
    op.drop_column('person', 'death_month_fk')
    op.drop_column('person', 'death_era_fk')
    op.drop_column('person', 'death_day')
    op.drop_column('person', 'birth_year')
    op.drop_column('person', 'birth_month_fk')
    op.drop_column('person', 'birth_era_fk')
    op.drop_column('person', 'birth_day')
    op.create_table('person_life_span',
    sa.Column('id', sa.INTEGER(), nullable=False),
    sa.Column('created', postgresql.TIMESTAMP(), autoincrement=False, nullable=True),
    sa.Column('modified', postgresql.TIMESTAMP(), autoincrement=False, nullable=True),
    sa.Column('birth_day', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('birth_month_fk', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('birth_year', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('birth_era_fk', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('death_day', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('death_month_fk', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('death_year', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('death_era_fk', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('person_fk', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.ForeignKeyConstraint(['birth_era_fk'], ['era.id'], name='person_life_span_birth_era_fk_fkey'),
    sa.ForeignKeyConstraint(['birth_month_fk'], ['month.id'], name='person_life_span_birth_month_fk_fkey'),
    sa.ForeignKeyConstraint(['death_era_fk'], ['era.id'], name='person_life_span_death_era_fk_fkey'),
    sa.ForeignKeyConstraint(['death_month_fk'], ['month.id'], name='person_life_span_death_month_fk_fkey'),
    sa.ForeignKeyConstraint(['person_fk'], ['person.id'], name='person_life_span_person_fk_fkey'),
    sa.PrimaryKeyConstraint('id', name='person_life_span_pkey')
    )
    # ### end Alembic commands ###
