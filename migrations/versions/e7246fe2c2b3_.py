"""empty message

Revision ID: e7246fe2c2b3
Revises: ba007c1742fc
Create Date: 2020-04-17 19:43:37.812880

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'e7246fe2c2b3'
down_revision = 'ba007c1742fc'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('essay_timeline',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('created', sa.DateTime(), nullable=True),
    sa.Column('modified', sa.DateTime(), nullable=True),
    sa.Column('essay_fk', sa.Integer(), nullable=True),
    sa.Column('timeline_fk', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['essay_fk'], ['essay.id'], ),
    sa.ForeignKeyConstraint(['timeline_fk'], ['timeline.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('essay_event',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('created', sa.DateTime(), nullable=True),
    sa.Column('modified', sa.DateTime(), nullable=True),
    sa.Column('essay_fk', sa.Integer(), nullable=True),
    sa.Column('event_fk', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['essay_fk'], ['essay.id'], ),
    sa.ForeignKeyConstraint(['event_fk'], ['event.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('essay_person',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('created', sa.DateTime(), nullable=True),
    sa.Column('modified', sa.DateTime(), nullable=True),
    sa.Column('essay_fk', sa.Integer(), nullable=True),
    sa.Column('person_fk', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['essay_fk'], ['essay.id'], ),
    sa.ForeignKeyConstraint(['person_fk'], ['event.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('essay_person')
    op.drop_table('essay_event')
    op.drop_table('essay_timeline')
    # ### end Alembic commands ###
