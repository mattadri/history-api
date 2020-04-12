"""empty message

Revision ID: 96c9642e901d
Revises: 1444bf909ab0
Create Date: 2020-03-16 20:38:50.358768

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '96c9642e901d'
down_revision = '1444bf909ab0'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('timeline_category', sa.Column('label', sa.String(), nullable=True))
    op.drop_column('timeline_category', 'category_label')
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('timeline_category', sa.Column('category_label', sa.VARCHAR(), autoincrement=False, nullable=True))
    op.drop_column('timeline_category', 'label')
    # ### end Alembic commands ###
