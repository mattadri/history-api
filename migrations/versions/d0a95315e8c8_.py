"""empty message

Revision ID: d0a95315e8c8
Revises: 1c756d0ea25c
Create Date: 2020-04-12 15:25:57.688426

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'd0a95315e8c8'
down_revision = '1c756d0ea25c'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('reference_note',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('created', sa.DateTime(), nullable=True),
    sa.Column('modified', sa.DateTime(), nullable=True),
    sa.Column('note', sa.String(), nullable=False),
    sa.Column('chapter', sa.String(), nullable=True),
    sa.Column('page', sa.Integer(), nullable=True),
    sa.Column('reference_fk', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['reference_fk'], ['reference.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('reference_note')
    # ### end Alembic commands ###
