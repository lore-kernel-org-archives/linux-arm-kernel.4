Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3412A606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=15VHfJG5;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gKJ0tJQZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EPargW/ndTMk8W5T5ryrw8EEtwPYjCnMb9VWPm+Ydmo=; b=15VHfJG5xyYOr/xNdmPZii/ynf
	Y0d283VeATqY667TsOUnnleBaTKLC/tETUA/jB8rgiD/ms2l4cCxsigf2HKdj9i/ctZ7D4hc0rW07
	LU25sGZmgxuLH+A9hQB3VoeV8RM0K14icKplLVgo49i9RNTniVV2fSeByh5z7vToAIs5oTmjyQrVO
	SSv2BUJpvFLvTpMTN9XwsRVsahQzVAJ50VTW2tisWgxlmbb2yCxCOc2irnYco831ntNXz0+kG2HN4
	DkIbMEJYAvCRkcFaojvDQKm+khFMofa0PlspY6c6ZDvjgfrXaKVUHsfkYjScJJvQ5RJuFGJ5PvNB3
	KQPwH4Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1YN-00000003bZv-1K5i;
	Mon, 16 Nov 2026 18:35:43 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1YJ-00000003bYR-3LdA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:35:41 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48dee593f18so4035799f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 10:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794854138; x=1795458938; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EPargW/ndTMk8W5T5ryrw8EEtwPYjCnMb9VWPm+Ydmo=;
        b=gKJ0tJQZH9JsGMp+CQDRuJB03/fARJoPB/HuRP9GIlg7gHrU65s7nPI7JM5MqPKvAy
         10E7Bd9kkM0cPi3Xltwt8gJln1HPR0z3Gt3M60rNcI66yzME/VAJhoUjtaaqRARAzX0z
         /xYQUTKB7YWRF4DRIT0bv4iD4pXVM5etDG+5PLSIrgd8zUiOVhELQlbj2RytpXiScXeE
         pglX8CiYL98uwJAajDIYrCC8hxNTpykrSrh0WWf8jSzgFOnSOYu1GqTDU4iy0TuOBL1X
         LOVqe/X/TK3chx7ByLKOMlNpGu2I50TFOWpP0HGEiDQgBkZ2IFXMzbGgVqK57E+BF/T3
         h4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854138; x=1795458938;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EPargW/ndTMk8W5T5ryrw8EEtwPYjCnMb9VWPm+Ydmo=;
        b=LSZJlOJvXh+dNRhOdBN0KWod1q/M4kpMImxE5z7jdovkRzM71IXjSC8bRsarh6jS14
         VD4i6rkFAR86O7riKEnmFlp5H9hYWOYJZhwoScFnM3PFzPlmVLd7vwyJeHodsMGXVowz
         WOXAh49SwCTvQgZtCN3mx84n4OEbqpD2+VZWbJ8GDpaWIKvV+W1oTVGBeKnpw6hotZnU
         KpJsey5iZ2zcqT6LVepoBERpWthymp5195PoxP5ra4aVetOEKj2Qg0HQAfar2N2dTsWi
         ZAl7CUPaKfBAC91hq+kKjlh+TCZ3VBjt+DUXLK249Pi5JpM9PnQRVZya63Xmzd4UR+dO
         egSA==
X-Forwarded-Encrypted: i=1; AL+hErG4iAShYPzjDBSuyz6vwnARJNU8HhQIWuNi0L+iV7rd+Rbi8i99K440DFWRJ2cZ1uSfxoirYWnr/CbfFNLdUUp6@lists.infradead.org
X-Gm-Message-State: APuU4Z/qPL4ekIAogGU+/MPw7SCzXVqHEbkWk4W2sDMAwpqQ5jOARkg+
	Gn0UitCLxy9EMO7cSj+CeGYld8yzIKtkY9fxda6IKBiaCMaZDBjvLYltXVW9z4DiWgQ=
X-Gm-Gg: AZFdTZd6nvZ6Ls+EZQSv13WL7NhZGnLBUxrY/YVRLSA68tEaBOjHMMw+OiWp2CByvKH
	qy2XqLqC0VDKiGQJIZSw465oj/FuEihnA8AviWlD9PSVlybBxkfu7b1vQ803xtPHnp4+9EKmk1/
	RdhE20GS8k9RT6mTPYOKC3t/YPlwJDzXD50gt1JxxPkeZ9vZe0Ek/t2SAJmMqkfJ7WLsn9m3DsO
	0SWu1xp23pv5gZcKks7wgeU4b3PTzeWhQQ4hgxF+XGDFUmsRt4lZtcNIZSE4M8bNXWxFdJTsf8N
	daLVozkVFq2qs0E0uAqLImfesYRBm3isnetNU9OU77J5G+l0+YbjW63R+OF8J6AoWLiaRU/FMcZ
	pqi3RNT6GWcisisxYBLpm6vC962jVYNBKrpoOCsl/8dBvXTMotPVXql2OepDbrRFp5WmQFQeJBt
	0hxp9fcDI4KQJCU9Osvq8tdAgfuFDaLehG3TNjSqkRkhxiZAfooaol2Ffgvp5T2hhDGynux/D1y
	RfH9ZcAu8hVC85/NKyGQkc8ZhwnGp4OIzqmgIXblIUwY5tesdrITIDzcsk/F+GkuKlp4t4ajFvN
	4vM0BYwIlokLZGj8JrQJSE/m6tLwdF16LPnmrSdw343hHhuyz3gleNMapXl2QXcgTaPLAtW6R17
	nBtBo7PErpe6Bkf4pspujrc3mxo8mkmsqaopzWQ==
X-Received: by 2002:a05:6000:491c:b0:48b:118e:7454 with SMTP id ffacd0b85a97d-49c70a0f0cbmr22973182f8f.31.1794854137742;
        Mon, 16 Nov 2026 10:35:37 -0800 (PST)
Received: from localhost (p200300f65f19a90439293c698a65b414.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3929:3c69:8a65:b414])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49c5fe373casm23015553f8f.30.2026.11.16.10.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:35:37 -0800 (PST)
Date: Mon, 16 Nov 2026 19:35:35 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Dan Williams <djbw@kernel.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, Ira Weiny <iweiny@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Zhang Rui <rui.zhang@intel.com>, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>, Saranya Gopal <saranya.gopal@intel.com>, 
	Gergo Koteles <soyer@irl.hu>, Jakob Riemenschneider <riemenschneiderjakob@gmail.com>, 
	Yauhen Kharuzhy <jekhor@gmail.com>, Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, nvdimm@lists.linux.dev, linux-pci@vger.kernel.org, 
	Kai-Heng Feng <kaihengf@nvidia.com>, Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shuai Xue <xueshuai@linux.alibaba.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Chu Guangqing <chuguangqing@inspur.com>, Andy Shevchenko <andy@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>
Subject: Re: [PATCH v1 0/4] ACPI: Use named initializers for acpi_device_id
 arrays
Message-ID: <avtL3i7n9cUARCd1@monoceros>
References: <cover.1794567577.git.ukleinek@kernel.org>
 <CAJZ5v0jC5YXsLgB6Qd55KNCU0oCsN86X5WpRfL+Ycz0MJ8vGqA@mail.gmail.com>
 <avs5thXfoZA4TBnE@monoceros>
 <CAJZ5v0iSJVszOCLCuK+ifCzTgx1RgDAExaYUbij=jaWmaTsb8Q@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nqnngouwa55krefe"
Content-Disposition: inline
In-Reply-To: <CAJZ5v0iSJVszOCLCuK+ifCzTgx1RgDAExaYUbij=jaWmaTsb8Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_103539_862936_B278A053 
X-CRM114-Status: GOOD (  17.16  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--nqnngouwa55krefe
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/4] ACPI: Use named initializers for acpi_device_id
 arrays
MIME-Version: 1.0

Hello Rafael,

On Mon, Nov 16, 2026 at 07:15:48PM +0100, Rafael J. Wysocki (Intel) wrote:
> On Mon, Nov 16, 2026 at 6:16=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capabl=
e Hub)
> <u.kleine-koenig@baylibre.com> wrote:
> >
> > Hey Rafael,
> >
> > On Fri, Nov 13, 2026 at 05:17:30PM +0100, Rafael J. Wysocki (Intel) wro=
te:
> > > > Uwe Kleine-K=C3=B6nig (The Capable Hub) (4):
> > > >   ACPI: Unify acpi_device_id list terminators
> > > >   ACPI: Drop unused .driver_data initializers in acpi_device_id arr=
ays
> > > >   ACPI: Use named initializers for acpi_device_id arrays
> > > >   ACPI: Unify *_device_id list terminators
> > >
> > > All patches applied as 7.5 material, thanks!
> >
> > While rebasing these patches (as part of my wip tree that contains a lot
> > more similar patches) to next-20261113 I hit some merge conflicts. If
> > you tell me where you applied it, I can take a look and provide my merge
> > conflict resolution to allow double checking.
>=20
> I've rebased a couple of patches on some material merged previously.
>=20
> Please see
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commi=
t/?h=3Dlinux-next&id=3D58d4ba8979133c41cd491dff1dab40626daa924a

OK, it seems you already rebased on top of the commits that made my
rebase a bit bumpy and you did the same resolutions as me. :thumbsup:

Best regards
Uwe

--nqnngouwa55krefe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr7TPUACgkQj4D7WH0S
/k6vZQgAjLzcTYkt9CbkThW0RlljMQXJxP5fmZNoFevLodwamfhpt+348ZmhBkWR
pva0yzF64v2uFwtmOgge+e1azRuruDvxfilctoJgbCV+g8N8GlaVkT6OU7mHXpNB
C/esmpj/xKsGPaZnrbRAXqxJ+/KWjGuW2Tc4/CLmjidnaqdHoi6we+/W/YDZe/zD
hK5ahEuQfANr2sXtQMET7/79wAiZ0mquQalFQaDDF2whSgyu7dWdt3+ahdFOS9u3
DTc/gz1Yiu4f/sTzP8Hh7Gr6y/CnHyaILNhtxA3YnnMqLmQnPEONbSnbua34q36a
S4dDn9kuuyzsCa5pFr4vhDplKXzROA==
=5qsj
-----END PGP SIGNATURE-----

--nqnngouwa55krefe--

