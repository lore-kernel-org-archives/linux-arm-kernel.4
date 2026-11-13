Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF672606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 07:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RZMpipWy;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=DY9VXQ9g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=a8dwXPHMPfCbtdhYZUDcAPyhoTp0Li9Sm++J9+wQ2hg=; b=RZMpipWyXakE6CysvZOA6dWmBA
	kugJgMHt7t0KIptJUeO6ijOWJ9BNrCcVkJI5lzlkPD5kCi5UH5rmzoo5pc2GEnX14TjMpejbEwl+8
	e+7qflnD6XTMi/9r8rw4CDZzwhuphEuecGO9LyobEWefca7XMuxQlN0q40U+pI7lgi7pv1IA/Tg5/
	z5NFH6P8OWTFsHOvKD9ehO4AJkhBG6vxPaDk695SXaAz7GthR2shKzhZ+vTlzZxZjCwYaRN6BINLx
	/wsz07muB9EKH6VkHC0e1NhYAVwTUYruDzrkN5Dlj2e+YuNRw8aGmAfd4ZU57blsRSHYWB693Q6OK
	3i9PJSAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRllD-0000000Bv0x-1YZk;
	Fri, 13 Nov 2026 07:31:47 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRll9-0000000Bv06-0qY5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 07:31:46 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 26417227AD;
	Fri, 13 Nov 2026 08:31:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794555099;
	bh=a8dwXPHMPfCbtdhYZUDcAPyhoTp0Li9Sm++J9+wQ2hg=; h=From:To:Subject;
	b=DY9VXQ9goHKAVqWr8PfX1MtVIeeN2mOlbRRYpfI3rFmaWdvnuPGoEQb0j71qf65fQ
	 SipdsSUlhQjaWUUYT8TVtx7rWSK6EMCaZYOjR2ELbcueb/lhIcNfrwTpyJnHnizRnn
	 2HA+cxrkSuX9qVZkiVuq8MKRfAFY60DEvE9XIQJn5LFtd1/eniXZ3xQTmda6u1t/yg
	 Aai5Cl8uCZ+qrWufRJY6pQV0vDtETVgQHTTgwX8C/0NirWv8Gadb7khoXz9kEw1gJP
	 tvVb3QZK5Em9ZSCkXcd0mHQAhD6WSuEEtSef+BEZme2DxxX8T9h6mDDk6556WOgz1R
	 QWBPZJehhQRlw==
Date: Fri, 13 Nov 2026 08:31:35 +0100
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
Message-ID: <20261113073135.GA8515@francesco-nb>
References: <20261112150236.164850-1-francesco@dolcini.it>
 <20261112150236.164850-2-francesco@dolcini.it>
 <avXeK-IRXbKqI-pc@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avXeK-IRXbKqI-pc@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_233144_215988_1C79CC0E 
X-CRM114-Status: GOOD (  22.08  )
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

On Thu, Nov 12, 2026 at 09:41:31AM -0600, Frank Li wrote:
> On Thu, Nov 12, 2026 at 04:02:23PM +0100, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> >
> > The Verdin family pinout defines the SoM interfaces and their
> > numbering, SPI_1 being the SPI bus available to the carrier board,
> > implemented by ecspi2 on Verdin iMX8MM.
> >
> > imx8mm.dtsi numbers ecspi2 as spi1, so the Linux bus number in sysfs
> > and the spidev name do not match the Verdin interface. Add a spi0
> > alias in the SoM dtsi and delete the inherited spi1, so ecspi2 is
> > bus 0, zero-based with SPI_1 being spi0, and carries a single alias.
> > ecspi3, internal to the SoM with the CAN controller and the TPM, keeps
> > the spi2 alias inherited from the SoC.
> >
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > index 1ac9d000d415..0369803a4d46 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > @@ -16,6 +16,8 @@ chosen {
> >  	aliases {
> >  		rtc0 = &rtc_i2c;
> >  		rtc1 = &snvs_rtc;
> > +		spi0 = &ecspi2;
> > +		/delete-property/ spi1;
> 
> Can you avoid delete property for new platform?

Unfortunately this is needed. 

The included imx8mm.dtsi has

  spi1 = &ecspi2;

so, without the /delete-property/ we will have both

  spi0 = &ecspi2;
  spi1 = &ecspi2;

and what is happening with that is implementation dependent, and this
would not be ok.

The original issue is that imx8mm.dtsi should not define the aliases in
the first place, unfortunately removing it now is no longer possible,
it will introduce regressions everywhere [0][1].

This issue, and the reason I have the delete-property, is already
explained in the commit message.

Francesco

[0] https://lore.kernel.org/all/20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org/
[1] https://lore.kernel.org/all/aca3addbe510c58524af8d3fd069fe2ae4b1cd24.camel@pengutronix.de/

