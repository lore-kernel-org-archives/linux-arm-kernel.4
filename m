Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29160606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 11:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m99i1jjj;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=VYNVj83v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FGTx4VY/SL5BPbWdA4BlE3iQgAacAgZlBWd1emO5adI=; b=m99i1jjjmq1MkzYkdYU1bE314K
	elMpj4cHpTTAJI/jQ82weqwP7+N4CB3/mz0gWXot6ZNqDZBQoTHD/RCAvnjXeFqlBT8a19qcBdSNM
	bunfAljN7fqoSGM1owY2JOsOoPCuNokE7bIJgoTA8nuY1ksjhsItDlplNtAd5EZvg3m1fJSoieZYv
	zsqI36COlSOMgPaLB/zEzffk6xMHkGsFFGfdq45AV5gBVWM9mt6LwaqyqU47l3SrYD5XNTc5qqR/d
	upQKGvQNkKGowQci9By3ZrZk+94bTDmAkyk2x1KSjAeGupPNECADodXqhQyTsKr7OUleqW7Xp9ftg
	Cl4cBS+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSv9D-00000002E5B-0tXb;
	Mon, 16 Nov 2026 11:45:19 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSv9A-00000002E4F-1N42
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 11:45:18 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 2B59B1F901;
	Mon, 16 Nov 2026 12:45:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794829513;
	bh=FGTx4VY/SL5BPbWdA4BlE3iQgAacAgZlBWd1emO5adI=; h=From:To:Subject;
	b=VYNVj83v4dL2FQUMVnOsJ1z1WEOIiBqsywF1kNt2PnHYe+TDOVilBKC+fiVqTEiBA
	 y8Nbx007C/J6aR5klH7FPYMfU7paIcSsBuOgvw0+UEKOuapQhGpE3TTDElFm+amFD1
	 DLKTKlOJT4Hsg0D3J34XILqb+NzxPpQIR2tUmQT+POfeOORyN366S2qbuBirDVUcna
	 92ewQk+iE8xkMiJ6QEc9yor/K5PWT6EpTWErRV7DlcBeR1pgFLa3Z1gI+mbmGtKfeV
	 2K05aBx12VhhrUB+yN4P3P+8bovpQKXPmJTxaAuFrYjcHyhP39xJIoKFVy0gDkPlA+
	 RB+zYX8iC2yiw==
Date: Mon, 16 Nov 2026 12:45:09 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-bsp@toradex.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 01/11] arm64: dts: freescale: imx8mm-verdin: Add SPI
 alias
Message-ID: <20261116114509.GA101185@francesco-nb>
References: <20261112150236.164850-1-francesco@dolcini.it>
 <20261112150236.164850-2-francesco@dolcini.it>
 <avXeK-IRXbKqI-pc@SMW015318>
 <20261113073135.GA8515@francesco-nb>
 <avc2nzql-JV7a-JH@SMW015318>
 <20261113171927.GA762258@francesco-nb>
 <aveChu8WqYM2JZcN@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aveChu8WqYM2JZcN@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_034516_972022_2FE2E16C 
X-CRM114-Status: GOOD (  35.05  )
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

Hello Frank,


On Fri, Nov 13, 2026 at 03:35:02PM -0600, Frank Li wrote:
> On Fri, Nov 13, 2026 at 06:19:27PM +0100, Francesco Dolcini wrote:
> > On Fri, Nov 13, 2026 at 10:11:11AM -0600, Frank Li wrote:
> > > On Fri, Nov 13, 2026 at 08:31:35AM +0100, Francesco Dolcini wrote:
> > > > Hello Frank,
> > > >
> > > > On Thu, Nov 12, 2026 at 09:41:31AM -0600, Frank Li wrote:
> > > > > On Thu, Nov 12, 2026 at 04:02:23PM +0100, Francesco Dolcini wrote:
> > > > > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > > > >
> > > > > > The Verdin family pinout defines the SoM interfaces and their
> > > > > > numbering, SPI_1 being the SPI bus available to the carrier board,
> > > > > > implemented by ecspi2 on Verdin iMX8MM.
> > > > > >
> > > > > > imx8mm.dtsi numbers ecspi2 as spi1, so the Linux bus number in sysfs
> > > > > > and the spidev name do not match the Verdin interface. Add a spi0
> > > > > > alias in the SoM dtsi and delete the inherited spi1, so ecspi2 is
> > > > > > bus 0, zero-based with SPI_1 being spi0, and carries a single alias.
> > > > > > ecspi3, internal to the SoM with the CAN controller and the TPM, keeps
> > > > > > the spi2 alias inherited from the SoC.
> > > > > >
> > > > > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > > > > ---
> > > > > >  arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 2 ++
> > > > > >  1 file changed, 2 insertions(+)
> > > > > >
> > > > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > > > > > index 1ac9d000d415..0369803a4d46 100644
> > > > > > --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > > > > > +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > > > > > @@ -16,6 +16,8 @@ chosen {
> > > > > >  	aliases {
> > > > > >  		rtc0 = &rtc_i2c;
> > > > > >  		rtc1 = &snvs_rtc;
> > > > > > +		spi0 = &ecspi2;
> > > > > > +		/delete-property/ spi1;
> > > > >
> > > > > Can you avoid delete property for new platform?
> > > >
> > > > Unfortunately this is needed.
> > > >
> > > > The included imx8mm.dtsi has
> > > >
> > > >   spi1 = &ecspi2;
> > >
> > > Create patch move aliase to each boards' dts from imx8mm.dtsi, which is
> > > board feature, not soc features.
> >
> > Please see the linked thread [0][1]. It's not a viable option.
> 
> where [0] and [1]

Please see my previous email, 

https://lore.kernel.org/all/20261113073135.GA8515@francesco-nb/

in which I tried to explain the issue.


> > In addition, I can do this for my boards (Toradex), how do I know what I
> > have to move for boards I do not know? I can't do that. The only way
> > would be to duplicate the whole aliases on *every* board.
> 
> at imx9, already move aliase to each boards, dupicate it and just make
> sure build finial results the same.
> 
> i.mx8 is still not too old yet.

Do you want me to duplicate the whole aliases block on every board? I
cannot do anything better then just duplicating everything, given I do
not know what aliases make sense for each board. I can do better for my
boards (Toradex), but for the others I can't.

And this will likely break out-of-tree users (and to be clear, I think
that out-of-tree users of Linux DT files is a fact, see U-Boot, barebox,
... and more), as I discussed in the previously linked discussion.

To me this is not the correct thing to do, it will work for my boards,
but I do not think this is the right decision for the whole i.MX
ecosystem.

And it's not about being old or not, it's about not introducing
regressions and caring about the users.

Francesco


