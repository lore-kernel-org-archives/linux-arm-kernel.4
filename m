Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9AB606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L+I24Hca;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=W5OzgRlU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pLbSnLN6/1576pxJwaqXyR5opWYY3qz9oGloy9SS1q0=; b=L+I24HcaUZPW2Ki2XnX+oAnHVY
	KDKjDLsfIqVLcPApUM/Ad4/OGjZMO7v8TLINmEncam3tuv1KmmFaGdJGp+JRSUpqG9fwsf5U6uJFi
	wf3oZCOKd+XYtxcqSfNyrl8M0vrFbeUxdaCfcQmo9E9aKQgUc3fHdBaX66lmuGkrUegMv9bN0PjHa
	GcCbS5I/2jicQSV2sa6c1vFZa7+/pqbfl+NcO91sR2n/KMrlw5k8eR4yt6HWTuHcrA9GscWLokgDW
	ZHglV3OeOEh34m5hLcZ5cnKJWbeKB4vXEz9noV/7q1HvDy0Vye0Ub6BBse3B47PAp2/jIYu69f366
	nzPtrD4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1Vj-00000003aLN-06mJ;
	Mon, 16 Nov 2026 18:32:59 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1Vf-00000003aHI-1q0F;
	Mon, 16 Nov 2026 18:32:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=pLbSnLN6/1576pxJwaqXyR5opWYY3qz9oGloy9SS1q0=; b=W5OzgRlUb1W/Hy9/J3QxAUN0Ix
	FTvWd6w8rA4xJKPDV7q7tiHeFGhHmexLSo+OyjFj+fh7gaCCXiuokLsz2R9isWIjyZZ4y67Pr04Og
	6B9jZi5gQ2KtsPdY9Vs4WFs1bKrkf7/kASFGwwxDSYlmewoFW3DE+IqoHoPRvee6SZtpfIlgwuo2B
	Ie39YEw5gIBSjAvy7MJChKRJGId29KvnUavjpV3rl+rjHB6J8rSjb7SuZfj6FywiUYPzGHDIiucyI
	ixzkPp1rhsFMu1IVDCUxpW1fxBcZPe1X4u172PyuYoc5CqoOguLD9naFLThZ3cBaW+vA9IzgqlLvU
	+mYDz+Jg==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Arun Iyengar <aiyengar1990@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Alex Bee <knaerzche@gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: Add IEP2 deinterlacer to RK3588
Date: Mon, 16 Nov 2026 19:32:49 +0100
Message-ID: <yRxnTArhQFiS4u_tncJj-g@sntech.de>
In-Reply-To: <20261116-luminous-heavenly-guan-b20f2e@quoll>
References: <20261115-iep2-v2-0-3d8798cd9a55@gmail.com>
 <20261115-iep2-v2-3-3d8798cd9a55@gmail.com>
 <20261116-luminous-heavenly-guan-b20f2e@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_103255_502985_FFE03049 
X-CRM114-Status: GOOD (  18.79  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Montag, 16. November 2026, 13:35:28 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Krzysztof Kozlowski:
> On Sun, Nov 15, 2026 at 08:47:44AM +0000, Arun Iyengar wrote:
> > Add the IEP2 deinterlacer and its IOMMU to the RK3588 base dtsi. Both
> > share GIC SPI 117 and sit in the VDPU power domain.
> >=20
> > Addresses, clocks, resets and the interrupt are taken from the Rockchip
> > BSP rk3588s.dtsi (develop-6.1).
> >=20
> > Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 22 +++++++++++++++++++=
+++
> >  1 file changed, 22 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64=
/boot/dts/rockchip/rk3588-base.dtsi
> > index aa69fd3793fd..5297519bd251 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> > @@ -1397,6 +1397,28 @@ vepu121_3_mmu: iommu@fdbac800 {
> >  		#iommu-cells =3D <0>;
> >  	};
> > =20
> > +	iep: deinterlace@fdbb0000 {
>=20
> Why all these are outside soc node? That's more of a question to
> existing code...

Many years back, during the RK3288 addition I got the comment from the
arm-soc maintainer to drop the soc node [0]:

"[...] this isn't how we tend to do it any more (unless all devices
are physically on a bus, but then it should probably be named something else
than 'soc')."

So since then we didn't have soc nodes. Except in time for the RK3576, the
tune has changed, so socs from then on have a soc node again ;-) .


Heiko


[0] https://lists.infradead.org/pipermail/linux-arm-kernel/2014-July/272779=
=2Ehtml



