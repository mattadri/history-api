"""empty message

Revision ID: f6664b39e735
Revises: aebca35c48ef
Create Date: 2019-12-28 16:43:07.294391

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'f6664b39e735'
down_revision = 'aebca35c48ef'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('person',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('created', sa.DateTime(), nullable=True),
    sa.Column('modified', sa.DateTime(), nullable=True),
    sa.Column('first_name', sa.String(), nullable=True),
    sa.Column('middle_name', sa.String(), nullable=True),
    sa.Column('last_name', sa.String(), nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('person_life_span',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('created', sa.DateTime(), nullable=True),
    sa.Column('modified', sa.DateTime(), nullable=True),
    sa.Column('birth_day', sa.Integer(), nullable=True),
    sa.Column('birth_month_fk', sa.Integer(), nullable=True),
    sa.Column('birth_year', sa.Integer(), nullable=True),
    sa.Column('birth_era_fk', sa.Integer(), nullable=True),
    sa.Column('death_day', sa.Integer(), nullable=True),
    sa.Column('death_month_fk', sa.Integer(), nullable=True),
    sa.Column('death_year', sa.Integer(), nullable=True),
    sa.Column('death_era_fk', sa.Integer(), nullable=True),
    sa.Column('person_fk', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['birth_era_fk'], ['era.id'], ),
    sa.ForeignKeyConstraint(['birth_month_fk'], ['month.id'], ),
    sa.ForeignKeyConstraint(['death_era_fk'], ['era.id'], ),
    sa.ForeignKeyConstraint(['death_month_fk'], ['month.id'], ),
    sa.ForeignKeyConstraint(['person_fk'], ['person.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('person_reference',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('created', sa.DateTime(), nullable=True),
    sa.Column('modified', sa.DateTime(), nullable=True),
    sa.Column('reference_fk', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['reference_fk'], ['reference.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('person_reference')
    op.drop_table('person_life_span')
    op.drop_table('person')
    # ### end Alembic commands ###
