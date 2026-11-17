Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41110606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 17:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e9xC9aL3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KWYKJv3M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gpbTjTJOw7ujZ3rRhUXfRGBVxlexIhsMVokvC2lfJKg=; b=e9xC9aL32cq0mg+Dld2VtcS1Bj
	MUejFqvyxCd6Ladkk1behfjVf81kBq/KRvZojbZGJwg0/egLn2BAt76SXfiLyS6bprsIMjmvT/2+l
	e9xS8V8iZ/ltgXhkpzltncX1vAs+D01WIrE9CG5QL6ebbgCkYlDOmuQEQkzCFDbDcUrCd9quJnpZE
	wPymnPAsVSyZC0TcKT2vC6Pb7ey3mDqAom2HHRbt4la5mdFpM0kEOR3TgEQocZYsJATqXWuqUqp4T
	WzkHGX0eHWDdvb7+vilKdz5DKsEz6geL20zJKjV57yXAsp1vyp7g3lNLHnJaiiFBn59F8alGcESqK
	mE2YTuUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMue-00000006XVj-4BK8;
	Tue, 17 Nov 2026 17:24:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMuY-00000006XTp-1kCt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 17:24:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7CAB761922;
	Tue, 17 Nov 2026 17:24:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFF851F000C5;
	Tue, 17 Nov 2026 17:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794936241;
	bh=gpbTjTJOw7ujZ3rRhUXfRGBVxlexIhsMVokvC2lfJKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KWYKJv3MANrtT/7P6e2gCVNbNEBoBXQUtlZh8Mf56ybtul7cxMz8VaDdEbm9pi5Nc
	 BfHrYzv2HEsWoBITaTkD1dwNc0IZP5t+AHr9r5/pBJgvAMxy/5TEQFqF6ZHsPHxNVG
	 op9u27T4ICZalOyLu9Upd4tTFtitwI9B5xybTTBPKgeb74//jEypg5eyVy2IUWUzxl
	 s229NTvD3oSDsgBOL25txWM/8lNYPn1n+FsYdI1WRVctaUXJvaHOOoTs1qIZvUTpJO
	 PpN5jioXs+0HCutxntAveukt2INCYHu0rhNmEEJXl9l4H7rBz8E1vGRdNfnwx2Jetg
	 t/uiur4VkyuEQ==
Date: Tue, 17 Nov 2026 17:23:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: yogo.0917.sabu@gmail.com, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Ulf Hansson <ulfh@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	"linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
	linux-doc@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH RFC 6/6] ARM: add the SiRF AT550 platform and YPL514si
 board
Message-ID: <20261117-umpire-agency-f82c1415c09c@spud>
References: <20261117-at550-rfc-v1-v1-0-5879573cb825@gmail.com>
 <20261117-at550-rfc-v1-v1-6-5879573cb825@gmail.com>
 <c3832ce3-4605-4810-9348-c6fee394fe04@app.fastmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V8Ki5c7P5QvUwrPE"
Content-Disposition: inline
In-Reply-To: <c3832ce3-4605-4810-9348-c6fee394fe04@app.fastmail.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--V8Ki5c7P5QvUwrPE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 02:17:58PM +0100, Arnd Bergmann wrote:
> On Tue, Nov 17, 2026, at 14:06, yy-Local-LLM via B4 Relay wrote:
> > From: yy-Local-LLM <yogo.0917.sabu@gmail.com>
> >
> > Add a minimal DT machine using standard IRQ, timer and simplefb paths.
> > Describe the SoC and the firmware-configured YPL514si display. Leave
> > usable memory and the divided counter rate for the bootloader to
> > populate. Keep optional peripheral nodes disabled until firmware hands
> > them over. Disable unvalidated board suspend; limit this board to SD PIO
> > at 25 MHz. Document the RAM-boot contract and the missing
> > cold-boot/clock-tree support.
> >
> > Signed-off-by: yy-Local-LLM <yogo.0917.sabu@gmail.com>
>=20
> Please use a real name for signoff and make sure you understand
> the legal meaning of this.

Given the wording in the cover letter, I have my suspicions the person
behind this has had no interaction with the code at all.

>=20
> > +config ARCH_AT550
> > +	bool "SiRF AT550 platforms"
> > +	depends on ARCH_MULTI_V6
> > +	select ARM_ERRATA_411920
> > +	select AT550_IRQ
> > +	select CLKSRC_AT550
> > +	select CPU_V6
>=20
> Which CPU is this specifically? You need to select CPU_ARM1136R0,
> CPU_ARM1136R1 or CPU_ARM1176 instead CPU_V6 since b5fdfa208175
> ("ARM: deprecate support for ARM1136r0").
>=20
>      Arnd

--V8Ki5c7P5QvUwrPE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavyNpwAKCRB4tDGHoIJi
0tg7AQDFyQE1l10KohugmjgKBSh/b/m8rMXAhDjSMG83Tw2ulgEAjZiuwL+/+iBt
58axZW3SM/hB34QmaPbBaBb9n1xGzQE=
=msXp
-----END PGP SIGNATURE-----

--V8Ki5c7P5QvUwrPE--

