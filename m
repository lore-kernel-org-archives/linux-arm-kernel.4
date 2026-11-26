Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33212606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 17:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aLLAVZj3;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=aLJJauJS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=14yM+1Yamm5IaEsMmCuWFx4OfLA0U2vaBLRIMDPYO1U=; b=aLLAVZj3uQOLa2
	jLj0FcOFyR/UeSbhAQZvIWSbF94mNJzbk+J3bnz3wMR2yOV5x64pNFwOcE694yZvwLdHeyuTeY8u7
	OoAE5sDl1UPZpDj/06tts8/iVlKrkCSvD+GL9L6UOyWAIDb1mtUoaTQAZBADeei7wz4/FIRB3eOKL
	FHIP5U0lHSruDAWCl56jQgDqphUU4wTnY7tRg5R2HlJu70aqFGEIFjKwonYFOBNXYl8+oRKtueVuC
	dneUSJ6/Y4G8O7qPIxLPtNGdy3TpOjntO5fQZ1Y7iS8TaAR4T4kgPceNUcecF4eB0G1UqS0HrxFYu
	hgtsHs4uH3OlNiJ4i73A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdNg-0000000E4st-1HtE;
	Thu, 26 Nov 2026 17:35:36 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdNZ-0000000E4qU-3vAF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 17:35:35 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261126173524epoutp0287eafe1082b8b9e59b71f9e34e756fc0~rqNiq8-Y82440524405epoutp020
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 17:35:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261126173524epoutp0287eafe1082b8b9e59b71f9e34e756fc0~rqNiq8-Y82440524405epoutp020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795714525;
	bh=14yM+1Yamm5IaEsMmCuWFx4OfLA0U2vaBLRIMDPYO1U=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=aLJJauJSeqNDvNfBVu7tJRuYcVRWtjCl9qTUTv6yaZlIeTnaQsGAH0h9SweogNWFD
	 iQVNy0fibJLCWMMlj1c7UXw5VIOHG/QSIEUdAVy8pV4ZNv353EKf2btaNIN/8q2DQB
	 FjPuc/68bCae5mGTjeGQVQKP9DRKv0/KJxBKoX70=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20261126173524epcas5p46903feb70672bfbdf94648993741fb9a~rqNh0hkSC2895928959epcas5p44;
	Thu, 26 Nov 2026 17:35:24 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.89]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4jb3bb175gz2SSKX; Thu, 26 Nov
	2026 17:35:23 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20261126173522epcas5p2518c8da061331e3cc701a8049530da95~rqNgRjAAK2027520275epcas5p2q;
	Thu, 26 Nov 2026 17:35:22 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20261126173520epsmtip11149f069be0767a3d84426c2390cf8eb~rqNeGBwwj2823428234epsmtip1g;
	Thu, 26 Nov 2026 17:35:19 +0000 (GMT)
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
In-Reply-To: <CADrjBPrzHP_97OgAYacJKKqeCcp9FURoi6=Dmopk6nisTdEbdA@mail.gmail.com>
Subject: RE: [PATCH v3 08/14 RESEND] clk: samsung: exynos8855: add block
 peris clock support
Date: Thu, 26 Nov 2026 23:05:18 +0530
Message-ID: <000101dd7dcc$835c0830$8a141890$@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHlWUtnqVICpCIeTIEFEh+EoBRnawGxlKqAArMGWkMCaFOU4Lb6fmOA
Content-Language: en-us
X-CMS-MailID: 20261126173522epcas5p2518c8da061331e3cc701a8049530da95
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261113104853epcas5p175c566a1ced2547e533c21b21e60e993
References: <CGME20261113104853epcas5p175c566a1ced2547e533c21b21e60e993@epcas5p1.samsung.com>
	<20261113110612.3265841-1-raghav.s@samsung.com>
	<20261113110612.3265841-9-raghav.s@samsung.com>
	<CADrjBPrzHP_97OgAYacJKKqeCcp9FURoi6=Dmopk6nisTdEbdA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_093531_440211_EEE67EA9 
X-CRM114-Status: GOOD (  27.44  )
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



> -----Original Message-----
> From: Peter Griffin <peter.griffin=40linaro.org>
> Sent: Friday, November 13, 2026 6:24 PM
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
> Subject: Re: =5BPATCH v3 08/14 RESEND=5D clk: samsung: exynos8855: add bl=
ock
> peris clock support
>=20
> Hi Raghav,
>=20
> On Fri, 13 Nov 2026 at 10:54, Raghav Sharma <raghav.s=40samsung.com>
> wrote:
> >
> > Register compatible and cmu_info data to support clocks.
> > CMU_PERIS, this provides clocks for PERIS
> >
> > Co-developed-by: Alim Akhtar <alim.akhtar=40samsung.com>
> > Signed-off-by: Alim Akhtar <alim.akhtar=40samsung.com>
> > Signed-off-by: Raghav Sharma <raghav.s=40samsung.com>
> > ---
> >  drivers/clk/samsung/clk-exynos8855.c =7C 97
> > ++++++++++++++++++++++++++++
> >  1 file changed, 97 insertions(+)
> >
> > diff --git a/drivers/clk/samsung/clk-exynos8855.c
> > b/drivers/clk/samsung/clk-exynos8855.c
> > index dcf58f2459b0..12b5ae54b560 100644
> > --- a/drivers/clk/samsung/clk-exynos8855.c
> > +++ b/drivers/clk/samsung/clk-exynos8855.c
> > =40=40 -18,7 +18,9 =40=40
> >  /* NOTE: Must be equal to the last clock ID increased by one */
> >  =23define CLKS_NR_TOP                     (CLKCMU_DOUT_G3D_HTU + 1)
> >  =23define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC + 1)
> > +=23define CLKS_NR_PERIS                   (CLK_GOUT_WDT1_PERIS + 1)
> >
> > +=23define EXYNOS8855_PERIS_GATE_DBG_OFFSET      0x2004
> >  =23define EXYNOS8855_PERIC_GATE_DBG_OFFSET      0x2024
> >  =23define EXYNOS8855_TOP_GATE_DBG_OFFSET      0x20A0
> >
> > =40=40 -1092,6 +1094,98 =40=40 static const struct samsung_cmu_info
> peric_cmu_info __initconst =3D =7B
> >         .memclk_offset          =3D EXYNOS8855_MEMCLK_OFFSET,
> >  =7D;
> >
> > +/* ---- CMU_PERIS
> > +--------------------------------------------------------- */
> > +
> > +/* Register Offset definitions for CMU_PERIS (0x10030000) */
> > +=23define CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER
> 0x600
> > +=23define CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC                    0x100=
0
> > +=23define CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER
> 0x610
> > +=23define CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP                   0x180=
0
> > +=23define CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP                    0x180=
4
> > +=23define
> CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK
> 0x201c
> > +=23define
> CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_P
> CLK  0x2040
> > +=23define
> CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK
> 0x2048
> > +=23define
> CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK
> 0x204c
> > +=23define CMU_PERIS_CONTROLLER_OPTION0_CMU_CTRL                  0x800
> > +
> > +static const unsigned long peris_clk_regs=5B=5D __initconst =3D =7B
> > +       CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER,
> > +       CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC,
> > +       CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER,
> > +       CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP,
> > +       CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP,
> > +
> CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK,
> > +
> CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_P
> CLK,
> > +
> CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK,
> > +
> CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK,
> > +       CMU_PERIS_CONTROLLER_OPTION0_CMU_CTRL,
> > +=7D;
>=20
> Same comment about preserving register state from the bootloader when
> powering off/on PERIS block.
>=20
> > +
> > +/* List of parent clocks for Muxes in CMU_PERIS */
> > +PNAME(mout_clkcmu_peris_noc_user_p) =3D =7B =22oscclk=22,
> > +=22dout_clkcmu_peris_noc=22 =7D;
> > +PNAME(mout_clk_peris_gic_p) =3D =7B =22oscclk=22,
> > +=22mout_clkcmu_peris_gic_user=22 =7D;
> > +PNAME(mout_clkcmu_peris_gic_user_p) =3D =7B =22oscclk=22,
> > +=22dout_clkcmu_peris_gic=22 =7D;
> > +
> > +static const struct samsung_mux_clock peris_mux_clks=5B=5D __initconst=
 =3D =7B
> > +       MUX(CLK_MOUT_PERIS_NOC_USER, =22mout_clkcmu_peris_noc_user=22,
> > +           mout_clkcmu_peris_noc_user_p,
> CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER, 4, 1),
> > +       MUX(CLK_MOUT_PERIS_GIC, =22mout_clk_peris_gic=22,
> > +           mout_clk_peris_gic_p,
> CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC, 0, 1),
> > +       MUX(CLK_MOUT_PERIS_GIC_USER, =22mout_clkcmu_peris_gic_user=22,
> > +           mout_clkcmu_peris_gic_user_p,
> > +CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER, 4, 1), =7D;
> > +
> > +static const struct samsung_div_clock peris_div_clks=5B=5D __initconst=
 =3D =7B
> > +       DIV(CLK_DOUT_PERIS_NOCP, =22dout_clkcmu_peris_nocp=22,
> > +           =22mout_clkcmu_peris_noc_user=22,
> CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP,
> > +           0, 4),
> > +       DIV(CLK_DOUT_PERIS_OTP, =22dout_clkcmu_peris_otp=22,
> > +           =22oscclk=22, CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP,
> > +           0, 4),
> > +=7D;
> > +
> > +static const struct samsung_gate_clock peris_gate_clks=5B=5D __initcon=
st =3D =7B
> > +       GATE(CLK_GOUT_CMU_PERIS, =22gout_cmu_peris=22,
> > +            =22dout_clkcmu_peris_nocp=22,
> > +
> CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK,
> > +            21, 0, 0),
> > +       GATE(CLK_GOUT_SYSREG_PERIS, =22gout_sysreg_peris=22,
> > +            =22dout_clkcmu_peris_nocp=22,
> > +
> CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_P
> CLK,
> > +            21, 0, 0),
> > +       GATE(CLK_GOUT_WDT0_PERIS, =22gout_wdt0_peris=22,
> > +            =22dout_clkcmu_peris_nocp=22,
> > +
> CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK,
> > +            21, 0, 0),
> > +       GATE(CLK_GOUT_WDT1_PERIS, =22gout_wdt1_peris=22,
> > +            =22dout_clkcmu_peris_nocp=22,
> > +
> CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK,
> > +            21, 0, 0),
>=20
> The Linux clock name strings look wrong here. It looks like you've genera=
lly
> followed the clk-gs101 clock name mangling in this series so it should be
> =22gout_<block-name>_<IP-clock-name>, but you have =22gout_IP-
> clock_name>-<block-name>=22. I know there is some =22name diversity=22 in=
-tree
> for various SoCs, but with new SoCs using auto clocks I would like to kee=
p the
> naming scheme following a similar style to clk-gs101.
>=20
> Also I guess with auto clocks now enabled from the start you may never
> need to expose all the CMU bus clocks, but I worry a bit you may have
> mangled the names here a bit too much. If you do need to expose extra
> gates you might get name collisions. For example in clk-gs101 we have bot=
h
>=20
> gout_apm_apm_usi0_uart_ipclk
> gout_apm_apm_usi0_uart_pclk
>=20
> So we kept the _pclk suffix in the Linux name to avoid a name collision.
>=20
Thanks for review, will change to gout_<block-name>_<IP-clock-name> convent=
ion=20
> Thanks,
>=20
> Peter


