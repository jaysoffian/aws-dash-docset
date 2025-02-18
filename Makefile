build:
	curl -o amazon-web-services.docset/icon@2x.png https://responsiveimages.io/v1/images/https%3A%2F%2Fa0.awsstatic.com%2Fmain%2Fimages%2Fsite%2Ftouch-icon-ipad-144-smile.png?width=32&height=32
	curl -o amazon-web-services.docset/icon.png https://responsiveimages.io/v1/images/https%3A%2F%2Fa0.awsstatic.com%2Fmain%2Fimages%2Fsite%2Ftouch-icon-ipad-144-smile.png?width=16&height=16
	node ./gen/generator.js
	make fixcss


# disable the @media min-width 1025px rules which cause the main column to move over
# to make room for the left-column, since the left-column has been removed.
fixcss: amazon-web-services.docset/Contents/Resources/Documents/css/awsdocs.css
	perl -pi -e 's|min-width: 1025px|min-width: 999999px|' $?
