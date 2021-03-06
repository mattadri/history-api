"""empty message

Revision ID: 169ecf0532c9
Revises: df2ace9bdfb5
Create Date: 2020-06-23 09:59:46.159257

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '169ecf0532c9'
down_revision = 'df2ace9bdfb5'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('chart_title_options',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('created', sa.DateTime(), nullable=True),
    sa.Column('modified', sa.DateTime(), nullable=True),
    sa.Column('display', sa.Boolean(), nullable=True),
    sa.Column('text', sa.String(), nullable=True),
    sa.Column('position', sa.String(), nullable=True),
    sa.Column('font_size', sa.Integer(), nullable=True),
    sa.Column('font_family', sa.String(), nullable=True),
    sa.Column('font_color', sa.String(), nullable=True),
    sa.Column('font_style', sa.String(), nullable=True),
    sa.Column('padding', sa.Integer(), nullable=True),
    sa.Column('line_height', sa.String(), nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_table('chart_options',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('created', sa.DateTime(), nullable=True),
    sa.Column('modified', sa.DateTime(), nullable=True),
    sa.Column('chart_fk', sa.Integer(), nullable=True),
    sa.Column('chart_title_options_fk', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['chart_fk'], ['chart.id'], ),
    sa.ForeignKeyConstraint(['chart_title_options_fk'], ['chart_title_options.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('chart_options')
    op.drop_table('chart_title_options')
    # ### end Alembic commands ###
