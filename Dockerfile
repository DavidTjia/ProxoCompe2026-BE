FROM directus/directus:11.17.0

# Copy extensions
COPY ./extensions /directus/extensions

COPY ./uploads /directus/uploads

EXPOSE 8055
