"""empty message

Revision ID: be664441bce4
Revises: f0fb6061be42
Create Date: 2020-06-24 12:43:35.272565

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'be664441bce4'
down_revision = 'f0fb6061be42'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('chart_tooltip_options',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('created', sa.DateTime(), nullable=True),
    sa.Column('modified', sa.DateTime(), nullable=True),
    sa.Column('enabled', sa.Boolean(), nullable=True),
    sa.Column('background_color', sa.String(), nullable=True),
    sa.Column('title_font_family', sa.String(), nullable=True),
    sa.Column('title_font_size', sa.Integer(), nullable=True),
    sa.Column('title_font_style', sa.String(), nullable=True),
    sa.Column('title_font_color', sa.String(), nullable=True),
    sa.Column('title_align', sa.String(), nullable=True),
    sa.Column('title_spacing', sa.Integer(), nullable=True),
    sa.Column('title_margin_bottom', sa.Integer(), nullable=True),
    sa.Column('body_font_family', sa.String(), nullable=True),
    sa.Column('body_font_size', sa.Integer(), nullable=True),
    sa.Column('body_font_style', sa.String(), nullable=True),
    sa.Column('body_font_color', sa.String(), nullable=True),
    sa.Column('body_align', sa.String(), nullable=True),
    sa.Column('body_spacing', sa.Integer(), nullable=True),
    sa.Column('footer_font_family', sa.String(), nullable=True),
    sa.Column('footer_font_size', sa.Integer(), nullable=True),
    sa.Column('footer_font_style', sa.String(), nullable=True),
    sa.Column('footer_font_color', sa.String(), nullable=True),
    sa.Column('footer_align', sa.String(), nullable=True),
    sa.Column('footer_spacing', sa.Integer(), nullable=True),
    sa.Column('footer_margin_top', sa.Integer(), nullable=True),
    sa.Column('x_padding', sa.Integer(), nullable=True),
    sa.Column('y_padding', sa.Integer(), nullable=True),
    sa.Column('caret_padding', sa.Integer(), nullable=True),
    sa.Column('caret_size', sa.Integer(), nullable=True),
    sa.Column('corner_radius', sa.Integer(), nullable=True),
    sa.Column('display_colors', sa.Boolean(), nullable=True),
    sa.Column('border_color', sa.String(), nullable=True),
    sa.Column('border_width', sa.Integer(), nullable=True),
    sa.Column('chart_options_fk', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['chart_options_fk'], ['chart_options.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('chart_tooltip_options')
    # ### end Alembic commands ###
