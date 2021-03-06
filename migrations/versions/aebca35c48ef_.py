"""empty message

Revision ID: aebca35c48ef
Revises: 76359437b051
Create Date: 2019-12-28 16:41:57.942334

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'aebca35c48ef'
down_revision = '76359437b051'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('culture_reference',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('created', sa.DateTime(), nullable=True),
    sa.Column('modified', sa.DateTime(), nullable=True),
    sa.Column('reference_fk', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['reference_fk'], ['reference.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('event_reference',
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
    op.drop_table('event_reference')
    op.drop_table('culture_reference')
    # ### end Alembic commands ###
