1. Numerical Music:
- stereo_to_mono:
    verific daca stereo este vector si in acest caz, egalez mono cu acesta
    altfel calculez media matricei transpuse (mean face media pe coloane, iar mie imi trebuie pe linii) si transpun vectorul rezultat (este linie si am nevoie de coloana)
    in final normalizez vectorul
- spectrogram:
    calculez numarul de ferestre necesare si initializez matricea S cu zero
    calculez frecventele (cu una in plus deoarece trebuie eliminata ultima valoare dar numarul de frecvente sa fie acelasi)
    calculez vectorul de timp (de la 0 la finalul duratei semnalului, impartit egal la cate ferestre am)
    calculez pentru fiecare fereastra indexul de inceput si cel de sfarsit si selectez in intreg semnalul datele intre cei doi indecsi
    aplic functia Hann si transformata Fourier si apoi elimin partea conjugata (selectez doar prima jumatate)
- oscillator:
    calculez lungimea vectorului rezultat (folosesc round pt ca rez nu sunt mereu intregi)
    calculez vectorul de timp cu +1 elemente (din acelasi motiv ca mai sus) si dupa folosesc formula data pentru a face din_wave
    calculez numarul de attack, decay, sustain si release samples
    apoi calculez attack, decay, sustain si release envelop conform cerintei
    concatenez cele 4 calculate mai sus si a final adaug si vectorul e (plin de 0) pentru a fi siguri ca sunt minim n elemente in envelope
    in final inmultesc sin_wave si envelope termen cu termen si returnez rezultatul
- low_pass:
    calculez transformata Fourier pe semnalul rpimit
    calculez vectorul de frecvente similar cu sprectrogram
    calculez masca in functie de cutoff_freq si inmultesc cu semnalul transformat
    aplic transformata inversa pe semnalul nou obtinut si in final, normalizez
- apply_reverb:
    am calculat semnalul mono al impulse response cu functia implementata anterior
    am calculat produsul de convolutie intre semnalul dat si cel mono
    in final, normalizez semnalul obtinut

2. Robotzii
- parse_data:
    am deschis fisierul din care citesc datele si am verificat daca operatia s-a facut cu succes
    am citit n, pe care l-am incremenat (indicii incep de la 0 pana la n in setul de date)
    am citit cele n elem pt x si apoi pentru y
    in final am inchis fisierul
- spline_c2:
    calculez cate spline-uri sunt (n) si initializez matricea ecuatiilor(A) si vectorul termenilor liberi (b)
    pentru primele n spline-uri coef sunt coresp lui a, iar in b se pun valorile din y
    se face si echivalarea ultimului termen din x cu corespndentul sau din y prin egalarea cu ultimul spline calculat in x
    pentru urmatoarele linii se iau in calupuri de cate 3 unde pe prima linie e echivalenta spline-ului i, a doua linie a derivatei, iar pe a 3-a a derivatei de ordin 2 in punctul x
    se pun si ultimele 2 conditii in matricea coeficientilor si se calculeaza rezolvarea sistemului de ecuatii, care este raspunsul returnat
- P_spline:
    pentru fiecare element al x_interp caut indicele ultimului element <= din x, pentru a putea identifica spline-ul asociat
    daca indicele duce spre ulrimul punct din x, scad, pentru a putea folosi ultimul spline calculat
    salvez intr-o variabila "baza polinomului" spline-ului si calculez y_interp in punctul x_interp pe baza coeficientilor splineului curent
- vandermode:
    calculez numarul de spline-uri necesare si initializez matricea ecuatiilor
    calculez matricea, folosind puterile lui x si rezolv sistemul de ecuatii
- P_vandermode:
    calculez lungimile lui x_interp si coef, apoi initializez y_interp cu 0
    calculez y_interp(i) ca suma intre coeficienti si puterile lui x_interp(i)

3. Recommendations
- read_mat:
    am folosit functia cvsread pentru a citi datele de la adresa data si am eliminat prima line si prima coloana din acea matrice
- preprocess:
    n2 reprezinta numarul de linii al matricei reduse, initial 1
    numar elementele diferite de 0 de pe fiecare linie, iar daca numarul este mai mare ca min_reviews adaug linia la finalul matricei reduse si incrementez marimea acesteia
- cosine_similarity:
    am normalizat cei doi vectori si apoi am returnat rezultatul calculat conform formulei date
- recommendations:
    am citit datele matricei si am aplicat preprocess pentru a retine numai liniile relevante
    am folosit svds si am salvat in U, V, S matricele rezultate in urma factorizarii
    am salvat in vectorul liked elementul din cadrul matricei V care i-a placut cel mai mult clientului
    am parcurs matricea V pe linii si am calculat pentru fiecare din acestea similaritatea cu liked, iar pentru cazul in care linia coincide cu liked am egalat similitudinea cu -inf
    am sortat similaritatile obtinute si am retinut in recoms ordinea indicilor initiali dupa sortare
    din acestia, in final, am luat primii num_recoms cei mai relevanti