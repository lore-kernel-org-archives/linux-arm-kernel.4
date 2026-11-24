Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5998D606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 10:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YK7h5Mpq;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=e5DycNuL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=imyZFS08/kI8TMFYUNmHJ21/sEomX2lbtjI8H1u7w74=; b=YK7h5MpqEwcH0r
	2MN45fcl0I+Zo5Nof2hdjXpDbaCJoMUvvu7/JaaY9CFDchGqin9Vx0DGSnLPZaBSkECmfMwkLh2DK
	V4L8kPLhnATH4B02zY30QN1r8dT0JowzP0iNy7vqqQX7dIC9yWcZhIxdwA77eOYfuwuLqpU0Ql3G/
	j5ldfALCJNtz6dg3tXDuVqq8t8LWlLhF8OqOUyGJ5yIskKIJcPUFujvHe3YSnGYx4iAZVybs/Zb/M
	DEm5HqznHr2P5Jc4OwGe+ZP3aBZHAoGhebZ5R6O82HTu4zkjgeKssKndfR8YsNE5fsgNXcjveWA4g
	w5lc60SKX6D0eGboyMlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmrg-000000063up-0pyw;
	Tue, 24 Nov 2026 09:31:04 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVmrd-000000063uO-1r9P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 09:31:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D01B10D89A;
	Tue, 24 Nov 2026 10:30:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1795512652;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=imyZFS08/kI8TMFYUNmHJ21/sEomX2lbtjI8H1u7w74=;
	b=e5DycNuLi9zgkTT8fyyvQKpKBxIJ7O6F9LCKyKKF+K5pL1AeJH6S4Uvl6VWKi/Rf2TN9J3
	RfNo3q0PfD6biAHbrXIVXAB01hFUjQ1P5AOedFxNB8clAIzuRYl9H4pNoVTVy9gq2+Spjn
	rwgRJNTabNzLX+xx/V6YefwQq1fxAGqcAceY/HRb2K5o2BIox7hRUccM0385M7CN2Yogfv
	R/ztALu/KSsGevhng+Gp3iHQvyCMpMTzB5M52gjzHTU/UukFv0bVH8zsO0E9MSDNLsqjJK
	KLjHJ7qhLsIDtyEzc2cu0zLGKLsowBP5KGzN4K94FzXKIt7ls8092u5CyOhvBA==
Date: Tue, 24 Nov 2026 10:30:47 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Shawn Guo
 <shawnguo@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Daniel Baluta
 <daniel.baluta@nxp.com>, Jonathan Cameron
 <jonathan.cameron@oss.qualcomm.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: imx8mm: Add Cloos CBASE support
Message-ID: <20261124103047.5dc56f82@wsk>
In-Reply-To: <awR-Al7YQMSSqt5J@SMW015318>
References: <20261120094211.1742416-1-lukma@nabladev.com>
	<20261120094211.1742416-3-lukma@nabladev.com>
	<awR-Al7YQMSSqt5J@SMW015318>
Organization: Nabla
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_013101_706221_44022C4E 
X-CRM114-Status: GOOD (  25.21  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Frank,

> On Fri, Nov 20, 2026 at 10:42:11AM +0100, Lukasz Majewski wrote:
> > Add support for CBASE board, which incorporates the TQMa8MQML
> > module.
> >
> > Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> > ---
> > Changes for v2:
> > - Fix the DTS according to the sashiko bot review
> > (gemini/gemini-4-argon) Changes for v3:
> > - None
> > Changes for v4:
> > - Use hex values for switch reg property
> > - Change subject and commit message according to community feedback
> > ---
> >  arch/arm64/boot/dts/freescale/Makefile        |   1 +
> >  .../arm64/boot/dts/freescale/imx8mm-cbase.dts | 581
> > ++++++++++++++++++ 2 files changed, 582 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-cbase.dts
> >
> > diff --git a/arch/arm64/boot/dts/freescale/Makefile
> > b/arch/arm64/boot/dts/freescale/Makefile index
> > a80cccf34eb5..c14e5ae2e4a0 100644 ---
> > a/arch/arm64/boot/dts/freescale/Makefile +++
> > b/arch/arm64/boot/dts/freescale/Makefile @@ -121,6 +121,7 @@
> > dtb-$(CONFIG_ARCH_MXC) += imx8dxl-hummingboard-telematics.dtb
> > dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdp-mba8xx.dtb
> > dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdps-mb-smarc-2.dtb
> > dtb-$(CONFIG_ARCH_MXC) += imx8mm-beacon-kit.dtb
> > +dtb-$(CONFIG_ARCH_MXC) += imx8mm-cbase.dtb
> >
> >  imx8mm-data-modul-edm-sbc-overlay-cm4-dtbs := \
> >  	imx8mm-data-modul-edm-sbc.dtb \
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm-cbase.dts
> > b/arch/arm64/boot/dts/freescale/imx8mm-cbase.dts new file mode
> > 100644 index 000000000000..fdfa2ef9a065
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm-cbase.dts
> > @@ -0,0 +1,581 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Copyright 2022 Fabio Estevam <festevam@denx.de>
> > + * Copyright 2026 Lukasz Majewski <lukma@nabladev.com>
> > + */
> > +
> > +/dts-v1/;
> > +  
> ...
> > +
> > +/* SPI-NOR memory is not mounted on the used SoM */
> > +/delete-node/ &flash0;  
> 
> Use status = disabled.

As pointed out earlier - the 

+&flexspi {
+	status = "disabled";
+};

is disabled.

So we do not enable the FLEXSPI subsystem and also clearly indicate
that the flash0 is NOT mounted (and will not be as we don't use it at
this project).

Is this OK? Or shall I do something more?

> 
> Frank
> 
> > --
> > 2.39.5
> >
> >  



-- 
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic

