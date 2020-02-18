from app import db


class Reference(db.Model):
    __tablename__ = 'reference'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())
    title = db.Column(db.String)
    sub_title = db.Column(db.String, nullable=True)
    published_day = db.Column(db.Integer, nullable=True)
    published_month_fk = db.Column(db.Integer, db.ForeignKey('month.id'))
    published_month = db.relationship('Month', foreign_keys=[published_month_fk])
    published_month_rel = db.relationship('Month', foreign_keys=[published_month_fk])
    published_year = db.Column(db.Integer)
    published_era_fk = db.Column(db.Integer, db.ForeignKey('era.id'))
    published_era = db.relationship('Era', foreign_keys=[published_era_fk])
    published_era_rel = db.relationship('Era', foreign_keys=[published_era_fk])


class Author(db.Model):
    __tablename__ = 'author'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())
    first_name = db.Column(db.String)
    middle_name = db.Column(db.String)
    last_name = db.Column(db.String)


class ReferenceAuthor(db.Model):
    __tablename__ = 'reference_author'

    id = db.Column(db.Integer, primary_key=True)
    created = db.Column(db.DateTime, default=db.func.current_timestamp())
    modified = db.Column(db.DateTime, default=db.func.current_timestamp(), onupdate=db.func.current_timestamp())
    reference_fk = db.Column(db.Integer, db.ForeignKey('reference.id'))
    reference = db.relationship('Reference', foreign_keys=[reference_fk], backref=db.backref('reference_author'))
    reference_rel = db.relationship('Reference', foreign_keys=[reference_fk])
    author_fk = db.Column(db.Integer, db.ForeignKey('author.id'))
    author = db.relationship('Author', foreign_keys=[author_fk], backref=db.backref('reference_author'))
    author_rel = db.relationship('Author', foreign_keys=[author_fk])
