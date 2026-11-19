Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15271606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 00:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LlUZgRSt;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a0wMFWWx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rSVsA9fNi7kC5K1IDfWWLOQdUEB3auXl+KZsJESSywY=; b=LlUZgRStengI5/EzSQ4No9EcRR
	19k9OG0oTEKG6pVBrMX+uAn1xPjIZFXloLFUSGOHVMLwEYD113NaslLzqo0cjlJpdEynvfUyAgU52
	ZbkGZjfOMyTVyufmeU5cN1+moP4HkF6PLADIiJyuNOj/TmG+qBTCGva3uzl4T4l9P3YoBxcU7QiW0
	lea49g14BzZKbk5fL8zLSwSZhr+/eK9ug82UsCkT0ChokbvVU3v/caMPxzfKfIZPWO1opfZzNCzGx
	x+bSQo1+NUhrHlcgY1cIZ0a16yj/I6r9XPYc/39pdZBmpCvfgi9f4h2Z7z2GaoPw6moMCEunK8KQO
	J3Z/rZ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpxq-0000000AZLv-0gje;
	Thu, 19 Nov 2026 00:25:22 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTpxn-0000000AZLL-3f6b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 00:25:21 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-8b4cc793704so13665067b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 16:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795047918; x=1795652718; darn=lists.infradead.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rSVsA9fNi7kC5K1IDfWWLOQdUEB3auXl+KZsJESSywY=;
        b=a0wMFWWxKOPGUV3RDep+qylvTVFlKVRdfZgQ3XzUO0YzL4+8Dq7l0pDVJKUGk6hTXG
         7cIHO+4D9/oFsTMTIbBvwI1q6ZzTrlTvtP+Lqh1P2IlIXKK5o8MNhABayzG/Zx9JINuQ
         g56leVVfvkSKcqPHoPSigMYVRt1OvOUaK2e85XCPE5pWk7hO/nJ1H83vOV/PwvHNKurY
         u1dV5OAIoe5QaqRbS56PXhglmcmahzwAriompkuf6cnpz+S3tRAjn9SZPeJe5F2DACJg
         RrHpq9ed/jRQfK7BPIfQEUkPiCimXN9PdXo3lSBj435vyeT30cxxcEVg75OJ7VZBra++
         h71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795047918; x=1795652718;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rSVsA9fNi7kC5K1IDfWWLOQdUEB3auXl+KZsJESSywY=;
        b=IuoZ1D1eZUqf+YeB30hThHzLX5aWtBbZ7LyXWkeCqHc4cSxwsf88r5SYRZ0H8vm/6n
         /ODyz0NHPksOmMwVdRgO7Rg7P21c8g0XjBcVxul2hJS10LzQWv+6M4hMAZ3NzVSwyn0q
         jhu1pWCDl6JNX1Kb0nmf1Y9Wr00/H9XvxEKYt7Rm6FZXOnllPlD6U+ONRK8ku6ZDZKRS
         z6F5cl+azdnEWyVKnoHg7wQdQVJn382ReLTbWak0oQuEYXIf1Nk8LllXCdYRxnuEvlTf
         1PtDMRhH4lkWOLaIpOd25Ii4L6m/rrVOEJE2q+Z63oDYyWP669/YzK6sK2OcSJK+r3Ol
         HSTg==
X-Forwarded-Encrypted: i=1; AL+hErHdJmNSU17pwCO5PiqrwAU/Besg78G8xAV3PAtPLzTHUvvVPL6sfJzBBvV+6oxVxfTGybcB85rd6WWaTpbCw5AX@lists.infradead.org
X-Gm-Message-State: APuU4Z9wcTOqkP07mpKnN35PqQAfJwg817HAAS4MK0xVJ2gK9sIkr6Ca
	zCyaglKhoWAmZCTej4a9xhLohcPoy2330urEYR3Au5YF0C2AqLv47XSn
X-Gm-Gg: AZFdTZfDStllTG1ohpXf6D0/fzeg4llunJDMNwRosszSCCWwzGOjxt/4h27kvD6p31h
	oWQogHc6hQnmCnrdVSJp5borpZTeAOX58X+bL40aSwQL0jWMVYXCsPve4tnHKcjHc/YBtyfjirb
	MVz5dzv0rPHe4vjrF6WCvOcUruco/ECJpkzzd6nQsy5lRh3YcAfZC8+p40MJTYrU4QX33AeDQ1p
	rQWAOXD2K+Ha/uKMyrPWx8DR5QItB+P0LzwHhH8+nSwxvmvGgVx8OF1M5RmyiaTHiUhRA/Ha105
	bP9add9j+YGHlUS0n8gs12RPrQ6PkpaQ3kS1XckWJYBtsdBXpTUapkT/CVYGoxu2Rb84+HET6vr
	UaDS5mKVVevNakoj9cHMl11+iSlu1U/WrFeETvVdfIcnnyviSpaAcz/qi/gJW/d4Y7NZzFiMEu2
	XkGPnOkmtHgYlFTm5dBebCEaz5JR5nxNbouKk0sVxNbH7hJ00vzKWsglPcoJIMEQEom6qAIOAmF
	fYTuCQeCef3UGJWofXanGXkJwHIilEcC3UZXBvT5gmT9FIOSeE4uUQz31T7oHee2fase1YKfGOf
	X9ZxlZB15+pUUlCbJk4pD9d+EdRokcmbCuE=
X-Received: by 2002:a05:690c:79a:b0:8b4:f2bc:7c39 with SMTP id 00721157ae682-8b4fecfc697mr13290147b3.15.1795047918306;
        Wed, 18 Nov 2026 16:25:18 -0800 (PST)
Received: from [10.138.10.6] ([149.102.242.31])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4fdf1d0desm25414957b3.1.2026.11.18.16.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 16:25:17 -0800 (PST)
Message-ID: <75946579-8335-4491-86da-fcda25ae9fd8@gmail.com>
Date: Wed, 18 Nov 2026 19:25:09 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 9/9] KEYS: keycrypt: Add the aes256-gcm-stream
 algorithm
To: Rodolfo Giometti <giometti@enneenne.com>,
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 keyrings@vger.kernel.org
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Jens Wiklander <jenswi@kernel.org>,
 Sumit Garg <sumit.garg@kernel.org>, op-tee@lists.trustedfirmware.org,
 =?UTF-8?Q?Horia_Geant=C4=83?= <horia.geanta@nxp.com>,
 Pankaj Gupta <pankaj.gupta@nxp.com>, Sahil Malhotra
 <sahil.malhotra@nxp.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Richard Weinberger <richard@nod.at>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Eric Biggers <ebiggers@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-crypto@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-api@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20261118140421.584086-1-giometti@enneenne.com>
 <20261118141257.627441-1-giometti@enneenne.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20261118141257.627441-1-giometti@enneenne.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FHGxV8cRNdUiD6U0H5BD0N5M"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_162519_976881_9D764732 
X-CRM114-Status: GOOD (  19.10  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FHGxV8cRNdUiD6U0H5BD0N5M
Content-Type: multipart/mixed; boundary="------------5YUoLTrRSVm1eElT0Sq1GVMR";
 protected-headers="v1"; hp="clear"
Message-ID: <75946579-8335-4491-86da-fcda25ae9fd8@gmail.com>
Date: Wed, 18 Nov 2026 19:25:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 9/9] KEYS: keycrypt: Add the aes256-gcm-stream
 algorithm
To: Rodolfo Giometti <giometti@enneenne.com>,
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 keyrings@vger.kernel.org
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Jens Wiklander <jenswi@kernel.org>,
 Sumit Garg <sumit.garg@kernel.org>, op-tee@lists.trustedfirmware.org,
 =?UTF-8?Q?Horia_Geant=C4=83?= <horia.geanta@nxp.com>,
 Pankaj Gupta <pankaj.gupta@nxp.com>, Sahil Malhotra
 <sahil.malhotra@nxp.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Richard Weinberger <richard@nod.at>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Eric Biggers <ebiggers@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-crypto@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-api@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20261118140421.584086-1-giometti@enneenne.com>
 <20261118141257.627441-1-giometti@enneenne.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <20261118141257.627441-1-giometti@enneenne.com>

--------------5YUoLTrRSVm1eElT0Sq1GVMR
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/18/26 9:12 AM, Rodolfo Giometti wrote:
> This patch is a proposal on its own: nothing before it needs it, so it
> can be discussed, or left out, apart from the rest.
>=20
> aes256-cbc does not authenticate what it decrypts, and a file or a
> transfer longer than one call cannot be sealed with a single AES-GCM
> invocation without buffering all of it, nor decrypted without
> releasing plaintext before its tag is checked.
>=20
> Add aes256-gcm-stream: the STREAM construction (Hoang, Reyhanitabar,
> Rogaway, Vizar) over AES-256-GCM. A message is split into segments
> of up to 64 KiB, each sealed with its own tag under a subkey derived
> with HKDF-SHA256 from the key and a 16-byte salt drawn at
> KEYCTL_CRYPT_OPEN; the nonce carries the segment's position and a
> last-segment flag, and the counter lives in the kernel, so segments
> can be neither reordered nor dropped from the end unnoticed. The
> segments go through a new ioctl, KEYCRYPT_IOC_SEGMENT, and
> KEYCRYPT_IOC_FINAL reports a stream whose last segment never came.
> A tee or hsm backend draws the salt and keeps the counter in its
> secure side; the sw and optee backends implement it.

Please use Cobblestone-128 or Cobblestone-256 instead.
https://c2sp.org/chunked-encryption has the spec, and you can check
against the implementation in pyca/cryptography or (for Cobblestone-128)
the Go package filippo.io/cobblestone.  This assumes your CPU has AES
and GCM instructions; if not, you should see about using one that does
or work with a cryptographer to standardize an alternative that doesn't
need them.

Nonstandard constructions like this one are to be avoided.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)

--------------5YUoLTrRSVm1eElT0Sq1GVMR--

--------------FHGxV8cRNdUiD6U0H5BD0N5M
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmr+QeYACgkQszaHOrMp
8lMKphAApmT7NKojxfNUv+4YED5wbkVa7lnarDk0nyp9M3Bt5hNIRlezPRWwnuNQ
c3Fse2TSfDpwTAaL/pZ9bVoUW3FkLcIwnAAIe35/78qpOemxEF5XRd4CQ9OGoQkm
MW429KUVHFxKjlSPCVrMIzW5PwLLvQVO/84lxA3BYJ503yK13kkEC2ja/5bOr2pq
cNzlB0rvirBXLKv2LH9gyIWC3rvLI29QGgGdFocZwnV/EbsWXC+1cNqLGePQ4JW/
X2W4CMomO+RvLWY+tfh/W+5hnUzxfaxn1oyCQbdEa+5KzWc+6oaPK9MU6x94SEhC
qkvoS60vMTP46Q4AQT+zB918F09KoN5Gwb6kWkjYVdfoJhsq1JIToOMT4uWhxwJa
zK5vgEPBWgvLDy5nRHf3l36sS0D8KibzPXtsQfxLrmH88Q8i8VHbMbHeuqQ3hfmi
/7v8eSCrt2NDafwt1mKKM1s3ZhegKN+R8bDXcK9Ys9fQnVMptIcR/tlkBBf6NWes
mdSBLNJSBR6q4Hm+kSz3+j8ah7qhuPVI9FIyKt9Lb60hrI8sHdotye0p5+Ne0iH6
rUKkFHWYEv10C/ku2PdPBgLIc5qfhf/MPSbqH5vAcyc19JIg9xneQVTxoaFK8QD8
aN6GKY3u02GADQHUdEuu26cEaKIBdN1yhWrjlPTIclUizw7Wppg=
=ionq
-----END PGP SIGNATURE-----

--------------FHGxV8cRNdUiD6U0H5BD0N5M--

