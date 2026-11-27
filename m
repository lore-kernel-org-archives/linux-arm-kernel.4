Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6A0606A327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 09:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qHpgR4pq;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bC+k17hM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UZ8b6FSjjztFRZRInOS21srAOCub1vYlaQEc7H442+0=; b=qHpgR4pqPMl0F2D6BDlfiLqg/H
	NI0SjKPWR3yZi7hAoG6PCF0tfkEHI0yXaeAlyhWZOjV5l8xrA2mFl64MyKt8yKppzfvbyHNpHd6Yu
	3L+WOjybihLo8JctKzJDTEit+WS9Q7B6mqF13rsWiI88uDNn3pTFEAc5X4yi2CFYPzj7NatAv75+i
	bijKjQfJgqZ529exswU+KEtET51SiO0ti4riq+Y4v1t+xMu6w2lNZvMhWfvnd2GbSKVwCf6gKWh0q
	OleQmGjyxYi/TtSMFojS2/Ky5qabxXcqUKCoy2aC/Ij8xfJy7R/Q7nETbz8CLboYTdA9KM0yw+qEC
	YhcPV6ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsE8-0000000FQy2-2IM8;
	Fri, 27 Nov 2026 09:26:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsE7-0000000FQxv-03iV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 09:26:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 776FD624F7;
	Fri, 27 Nov 2026 09:26:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DD311F0089B;
	Fri, 27 Nov 2026 09:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795771602;
	bh=UZ8b6FSjjztFRZRInOS21srAOCub1vYlaQEc7H442+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bC+k17hMNjb1w1yolYbFgLSObI4G3G8VzkJiFWCKUKHDd6vAK/ElmmbDSU00uKI3i
	 ETMnHH3o1JOr3W+PUMHeS/SX0iruS9euKG0+FjkSCnkh4d2sHThvCM/3JQGBMviXfx
	 H5E+ImunTnB3ra+u1Ovjc4ramAYUUYxJ8Xf4mP4U6Y/ccpNELf77y28/SYo43gz6qM
	 EeNl0BePh/cL18Du2oX0g9Zt8G0o5kSdgiP6LRiaPcazNpLRwGFDFpH2MHnhF9/XpG
	 3+TAqP3Z0FR0u7unSCR4gXmtQ38uQciY6Z0H1hDEIbzfFd4PSgYZix/wHGpqVRMOa1
	 37n9mz3eTI8fQ==
Date: Fri, 27 Nov 2026 09:26:34 +0000
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?iso-8859-1?Q?J=E9r=E9mie?= Dautheribes <jeremie.dautheribes@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Frank Li <Frank.Li@nxp.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>, mfd@lists.linux.dev,
	linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v10 0/5] Add support for AAEON SRG-IMX8P MCU
Message-ID: <20261127092634.GO38590@joneslee-macbookpro.roam.internal>
References: <20261120-dev-b4-aaeon-mcu-driver-v10-0-a756687e7997@bootlin.com>
 <179577149953.44397.11685484329530619531.b4-ty@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179577149953.44397.11685484329530619531.b4-ty@b4>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 27 Nov 2026, Lee Jones wrote:

> On Fri, 20 Nov 2026 08:23:52 +0100, Thomas Perrot (Schneider Electric) wrote:
> > This patch series introduces support for the AAEON SRG-IMX8P embedded
> > controller (MCU). The MCU is connected via I2C and provides GPIO and
> > watchdog functionality for the SRG-IMX8P board.
> > 
> > The series includes:
> > - Device tree binding for the MFD driver
> > - MFD driver that serves as the core driver for the MCU
> > - GPIO driver implementing the GPIO functionality
> > - Watchdog driver for system monitoring
> > - MAINTAINERS entry for the new drivers
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/5] dt-bindings: vendor-prefixes: Add AAEON vendor prefix
>       commit: 8754d4912daa776faa2525f5e6277a18d40fd939
> [2/5] dt-bindings: mfd: Add AAEON embedded controller
>       commit: 62eb7223813ba41684a22494de046e240f20240a
> [3/5] mfd: aaeon: Add SRG-IMX8P MCU driver
>       commit: 001731afc45c1d8b2724346cd806c02064032ed5
> [4/5] gpio: aaeon: Add GPIO driver for SRG-IMX8P MCU
>       commit: 10237675f88d8b90eb958ab123f2cdd2c61705d4
> [5/5] watchdog: aaeon: Add watchdog driver for SRG-IMX8P MCU
>       commit: 7f99cacfe2793d19acdea392b46592b0c605845c

Pull-request to follow after build testing.

Note to self: ib-mfd-gpio-watchdog-7.5

-- 
Lee Jones

