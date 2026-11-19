Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D88606A333
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 03:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JtDwmkI7;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=scpwGLIa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GItsSVGA+hmlSb3pkjtiaee8VXcySXBDfV85yqW7yYo=; b=JtDwmkI7NlBgiH
	Tk+FHKK4ytTx27uCsW6Ksv1iDCRhtdjeLshNlTwGS3ZZ3oPrGD8gMJ6yoClyW6JFoX8cmsDpF0Nc3
	5cVfWzYfIDjKZNfWiuw9f6+Y9kU771KzjyMyl79pKn8ibsLMraIj/AEdzxKG5i+Trh8r7i3HWtck1
	TwiLLBGl0WqF5OuTm5D02SBwev369+J/czUc/8uC4mb6f9FsXG2vcYlACy/Z01y3QiCUlKaPrYJtj
	4FMAOwPsgFzQhGCKdbyDPecyWjFz8lUiXz680QxeL6asMt5uGsWVMDmU6ZGPVSz5r8RcxpvpCE+4A
	U9Hauqs4KRUY9Z9Cmt6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTtCh-0000000AnPa-43Zo;
	Thu, 19 Nov 2026 03:52:56 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTtCc-0000000AnP9-3uUL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 03:52:53 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20261119035244epoutp0438007dd9d5b7fded89f3cd687ed3a64c~pVeQpBpeC1853218532epoutp04e
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 03:52:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20261119035244epoutp0438007dd9d5b7fded89f3cd687ed3a64c~pVeQpBpeC1853218532epoutp04e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795060364;
	bh=GItsSVGA+hmlSb3pkjtiaee8VXcySXBDfV85yqW7yYo=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=scpwGLIakHKeKIKPnnInJj9UZ5fFCTxB7xV3S4LDd+iGvU5eeir3qtAmIA3KOQ26P
	 Nnp3qaWtLV8V/eREk/tjeQ2SaDxdF+Soyy96FXSL0BxKTTeBVHXnmz2/y7Yy0Vq+UR
	 6Y4urXxRRxILNrdIb4nPXenq5jJvAjAqxU6K3PFg=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20261119035243epcas5p454481e6b84a96f7d913461c10bffc693~pVePvEJsS1381613816epcas5p43;
	Thu, 19 Nov 2026 03:52:43 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.94]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4jVPgb1Y6Xz6B9m5; Thu, 19 Nov
	2026 03:52:43 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20261119035242epcas5p24269dbcd55378604ded876d89bc24ace~pVeOoguQe1332113321epcas5p2V;
	Thu, 19 Nov 2026 03:52:42 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20261119035240epsmtip23b287ee79b550d5d99b705423479e030~pVeMci5IC1577115771epsmtip2A;
	Thu, 19 Nov 2026 03:52:40 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Peter Griffin'" <peter.griffin@linaro.org>, "'Raghav Sharma'"
	<raghav.s@samsung.com>
Cc: <krzk@kernel.org>, <s.nawrocki@samsung.com>, <cw00.choi@samsung.com>,
	<sboyd@kernel.org>, <bmasney+clk@redhat.com>, <jbrunet+clk@baylibre.com>,
	<robh@kernel.org>, <conor+dt@kernel.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <is.gandhi@samsung.com>,
	<ts.amit@samsung.com>, <pokala.reddy@samsung.com>
In-Reply-To: <CADrjBPoR7_LDZmxC_bOFigvqDaagVihmybfX5AdvSPr9-FVb8w@mail.gmail.com>
Subject: RE: [PATCH v3 06/14 RESEND] clk: samsung: clk-pll: Add support for
 pll_4313
Date: Thu, 19 Nov 2026 09:22:38 +0530
Message-ID: <002901dd77d9$6ddef600$499ce200$@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJMpPSZ0SyccmPoxB6lh4WTmmzUIwGxlKqAAl95c38DMT8uKrYcTHkw
Content-Language: en-us
X-CMS-MailID: 20261119035242epcas5p24269dbcd55378604ded876d89bc24ace
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261113104847epcas5p1d970255218f1ca78b19690bfd097f303
References: <CGME20261113104847epcas5p1d970255218f1ca78b19690bfd097f303@epcas5p1.samsung.com>
	<20261113110612.3265841-1-raghav.s@samsung.com>
	<20261113110612.3265841-7-raghav.s@samsung.com>
	<CADrjBPoR7_LDZmxC_bOFigvqDaagVihmybfX5AdvSPr9-FVb8w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_195251_600173_2C7F2011 
X-CRM114-Status: GOOD (  25.00  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thanks Peter for review

> -----Original Message-----
> From: Peter Griffin <peter.griffin=40linaro.org>
> Sent: Friday, November 13, 2026 5:58 PM
> To: Raghav Sharma <raghav.s=40samsung.com>
> Cc: krzk=40kernel.org; s.nawrocki=40samsung.com; cw00.choi=40samsung.com;
> alim.akhtar=40samsung.com; sboyd=40kernel.org; bmasney+clk=40redhat.com;
> jbrunet+clk=40baylibre.com; robh=40kernel.org; conor+dt=40kernel.org; lin=
ux-
> samsung-soc=40vger.kernel.org; linux-clk=40vger.kernel.org;
> devicetree=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; lin=
ux-
> kernel=40vger.kernel.org; is.gandhi=40samsung.com; ts.amit=40samsung.com;
> pokala.reddy=40samsung.com
> Subject: Re: =5BPATCH v3 06/14 RESEND=5D clk: samsung: clk-pll: Add suppo=
rt for
> pll_4313
>=20
> Hi Raghav,
>=20
> On Fri, 13 Nov 2026 at 10:53, Raghav Sharma <raghav.s=40samsung.com>
> wrote:
> >
> > From: Alim Akhtar <alim.akhtar=40samsung.com>
> >
> > PLLs 4313 are found in the Exynos8855 SoC and it is similar to
> > pll_531x except for CON8 offset, so re-using code for
> > pll_4313
> >
> > Signed-off-by: Alim Akhtar <alim.akhtar=40samsung.com>
> > Signed-off-by: Raghav Sharma <raghav.s=40samsung.com>
> > ---
> >  drivers/clk/samsung/clk-pll.c =7C 11 ++++++++++-
> > drivers/clk/samsung/clk-pll.h =7C  1 +
> >  2 files changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/samsung/clk-pll.c
> > b/drivers/clk/samsung/clk-pll.c index 3d837bd74355..7b0756127306
> > 100644
> > --- a/drivers/clk/samsung/clk-pll.c
> > +++ b/drivers/clk/samsung/clk-pll.c
> > =40=40 -1306,7 +1306,15 =40=40 static unsigned long
> samsung_pll531x_recalc_rate(struct clk_hw *hw,
> >         u64 mdiv, fout =3D parent_rate;
> >
> >         pll_con0 =3D readl_relaxed(pll->con_reg);
> > -       pll_con8 =3D readl_relaxed(pll->con_reg + 20);
> > +       if (pll->type =3D=3D pll_4313) =7B
> > +               /* Offset for PLL_CON8 which hold FDIV different for PL=
L_4313
> > +                * which is PLL_LOCKTIME_OFFSET - 0x4
> > +                */
> > +               pll_con8 =3D readl_relaxed(pll->lock_reg - 4);
> > +       =7D else =7B
> > +               pll_con8 =3D readl_relaxed(pll->con_reg + 20);
> > +       =7D
> > +
>=20
> This starts to feel a bit hacky (pll_con8 register being referenced as an=
 offset
> from lock_reg). Is the register really called pll_con8 on 8855? Or is it =
called
> something else, but happens to contain fdiv?
>=20
Yes, it is named as PLL_CON8_* on 8855, and contain fdiv bit.

> I think something like this would look cleaner:
>=20
> u32 fdiv_reg;
Historically SFR name was used to match with databook naming convention.=20
Few lines below it does indicate indeed pll_con8 contains fdiv.=20
 fdiv =3D (pll_con8 & PLL531X_FDIV_MASK);

I am ok with taking this suggestion.
Only thing is should we change pll_con0 as well together, or in a separate =
top-up patch?

>=20
>        if (pll->type =3D=3D pll_4313) =7B
>                /* fdiv in <insert name> register
>                fdiv_reg =3D readl_relaxed(pll->lock_reg - 4);
>        =7D else =7B
>                /* fdiv in pll_con8 register */
>                fdiv_reg =3D readl_relaxed(pll->con_reg + 20);
>        =7D
>=20
> regards,
>=20
> Peter


