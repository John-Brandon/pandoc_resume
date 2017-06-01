all: html pdf docx rtf cv index


# Added style_chmduquesne.tex to list of dependencies,
# because the author may be editing this file and want to re-make target.
# JRB
pdf: resume.pdf
resume.pdf: resume.md style_chmduquesne.tex
	pandoc --standalone --template style_chmduquesne.tex \
	--from markdown --to context \
	-V papersize=A4 \
	-o resume.tex resume.md; \
	context resume.tex

# In case someone wants to compile a Curriculum Vitae 
# JRB
cv: cv.pdf
cv.pdf: cv.md
	pandoc --standalone --template style_chmduquesne.tex \
	--from markdown --to context \
	-V papersize=A4 \
	-o cv.tex cv.md; \
	context cv.tex

html: resume.html
resume.html: style_chmduquesne.css resume.md
	pandoc --standalone -H style_chmduquesne.css \
        --from markdown --to html \
        -o resume.html resume.md

# Added file 'index.html' which can be pushed to GitHub,
# and used as webpage by setting up GitHub Pages for repository.
# see for example: https://john-brandon.github.io/pandoc_resume/
index: index.html
index.html: style_chmduquesne.css resume.md
	pandoc --standalone -H style_chmduquesne.css \
        --from markdown --to html \
        -o index.html resume.md

docx: resume.docx
resume.docx: resume.md
	pandoc -s -S resume.md -o resume.docx

rtf: resume.rtf
resume.rtf: resume.md
	pandoc -s -S resume.md -o resume.rtf

clean:
	rm resume.html
	rm resume.tex
	rm resume.tuc
	rm resume.log
	rm resume.pdf
	rm resume.docx
	rm resume.rtf
	rm cv.html
	rm cv.tex
	rm cv.tuc
	rm cv.log
	rm cv.pdf
	rm cv.docx
	rm cv.rtf
	
	
