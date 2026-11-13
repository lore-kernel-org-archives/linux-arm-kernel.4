Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42237606E65D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 17:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zA9g4vgy;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=gQDmr+DC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lLRe7OQ+TSz40sIuSGn/k/GXxs4txoePPfp4Cfqlpuo=; b=zA9g4vgySzvYMdz4J57tdlpBgv
	/sQRGgcrEivrohZwtP5TtUtAN+HaplqAJXT4OAQLNWtLTKVEvF4BkksRjXOyJ2JmApMrtjQn9qAkL
	8KJvA8K5Ch54TDV2gfXR38TpqI/XIv4Cz8lIT4E51j7ApB8CxCLhHYicO8fdFX9f3mDvHbixtqsk0
	8qgAUQV0M7zi2Hg9AjQSvU/UIRYcxwDNHgzlRsIxE4JXax579IAECg0OJhGfFWtSxhmjjAXuBtutn
	qziz1aJCKNZ2bX/Gr4r58G2Ow0nYQ1xiW65rEqP0+vKQv3RsaFH+3/dZaHvqydguU4quWT9Ml1RD/
	t3ZaTBTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuw8-0000000Dj0q-1kmN;
	Fri, 13 Nov 2026 17:19:40 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuw5-0000000Dizs-0Pkf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 17:19:39 +0000
Received: from francesco-nb (xcpe-178-82-167-143.dyn.res.sunrise.net [178.82.167.143])
	by mail11.truemail.it (Postfix) with ESMTPA id 65197227A9;
	Fri, 13 Nov 2026 18:19:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794590371;
	bh=lLRe7OQ+TSz40sIuSGn/k/GXxs4txoePPfp4Cfqlpuo=; h=From:To:Subject;
	b=gQDmr+DC0PzJkqKQHMverOutbN4CiJgTneAPacT/pLTZHq5gsyc/bXjMWCh0cuOdS
	 +97MfdA+S4dGKJsNtaQ2OaGv/vPHQY8/M95adOp6rSVVnV7u0V2ew+v7uEatUltIQi
	 C7CfUEHS/Kfe3kOYY7OJRmSDLxWONNCg2QBXRgXLPmqxBhlLNzC9xyMf6l8eLNfzKe
	 1EFOzKOsQJkAOkqN/y3BGWSButhtaATx2KY0SqTsA6pcmNHvq0ib97TEpRqRs72KiQ
	 EjRoqRINtyScFSLfgHyWYAnNNXZKM7CYnsyBJnvNzcFqAtXj0gGy5i0K1tpO7B8d+9
	 LGLlF3PkarAng==
Date: Fri, 13 Nov 2026 18:19:27 +0100
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
Message-ID: <20261113171927.GA762258@francesco-nb>
References: <20261112150236.164850-1-francesco@dolcini.it>
 <20261112150236.164850-2-francesco@dolcini.it>
 <avXeK-IRXbKqI-pc@SMW015318>
 <20261113073135.GA8515@francesco-nb>
 <avc2nzql-JV7a-JH@SMW015318>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avc2nzql-JV7a-JH@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_091938_053954_85BE76E6 
X-CRM114-Status: GOOD (  25.38  )
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

On Fri, Nov 13, 2026 at 10:11:11AM -0600, Frank Li wrote:
> On Fri, Nov 13, 2026 at 08:31:35AM +0100, Francesco Dolcini wrote:
> > Hello Frank,
> >
> > On Thu, Nov 12, 2026 at 09:41:31AM -0600, Frank Li wrote:
> > > On Thu, Nov 12, 2026 at 04:02:23PM +0100, Francesco Dolcini wrote:
> > > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > >
> > > > The Verdin family pinout defines the SoM interfaces and their
> > > > numbering, SPI_1 being the SPI bus available to the carrier board,
> > > > implemented by ecspi2 on Verdin iMX8MM.
> > > >
> > > > imx8mm.dtsi numbers ecspi2 as spi1, so the Linux bus number in sysfs
> > > > and the spidev name do not match the Verdin interface. Add a spi0
> > > > alias in the SoM dtsi and delete the inherited spi1, so ecspi2 is
> > > > bus 0, zero-based with SPI_1 being spi0, and carries a single alias.
> > > > ecspi3, internal to the SoM with the CAN controller and the TPM, keeps
> > > > the spi2 alias inherited from the SoC.
> > > >
> > > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > > > index 1ac9d000d415..0369803a4d46 100644
> > > > --- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
> > > > @@ -16,6 +16,8 @@ chosen {
> > > >  	aliases {
> > > >  		rtc0 = &rtc_i2c;
> > > >  		rtc1 = &snvs_rtc;
> > > > +		spi0 = &ecspi2;
> > > > +		/delete-property/ spi1;
> > >
> > > Can you avoid delete property for new platform?
> >
> > Unfortunately this is needed.
> >
> > The included imx8mm.dtsi has
> >
> >   spi1 = &ecspi2;
> 
> Create patch move aliase to each boards' dts from imx8mm.dtsi, which is
> board feature, not soc features.

Please see the linked thread [0][1]. It's not a viable option.

In addition, I can do this for my boards (Toradex), how do I know what I
have to move for boards I do not know? I can't do that. The only way
would be to duplicate the whole aliases on *every* board.

Unfortunately your proposal does not work.

Francesco


