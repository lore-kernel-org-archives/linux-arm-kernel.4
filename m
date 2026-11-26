Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E20606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 07:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MzPUeS42;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=R1wUduC9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bUb4hYTBPcgn4fPSOAlue7i31G1iMQmFecbSBRUfqRM=; b=MzPUeS42w+UXJrmmZ+vrWiUak+
	CT+azIjVtCxoUoV+wC4e4jny9Eh1p13SDNCyKUBQPxMa6ya/KW+rQ6pmQosT7Q6UQosFb9ELCQA6n
	EjOv7IV9OWeyyG08/MTzMbMyhL5awQlnpOYRXLNm4txyGYEIv3sZEk9bg0x195Lqf4X/fiK/krOBl
	uRDfiVXbGGeya+ZUq7aZY2EblBClwLduMjwoHENqZBcxkEXqyRjUPHgIRamOmnDGaweKI1fATp5/9
	YMZP8KbgQVpTSWxT4EQQLVu2OfN4X0YAPHjJfPtmY9Wsoak/0YzFxc1IlhQt5O2fKJSH11LAetsO2
	Toia5CEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUJL-0000000CKYn-2Irp;
	Thu, 26 Nov 2026 07:54:31 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUJI-0000000CKYL-0lcb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 07:54:30 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 9C2631F953;
	Thu, 26 Nov 2026 08:54:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1795679662;
	bh=bUb4hYTBPcgn4fPSOAlue7i31G1iMQmFecbSBRUfqRM=; h=From:To:Subject;
	b=R1wUduC9jw5X/rsJjGoL7cVRJLM2iRqNJIwvkvI0Ds6VCr7ZLJ3c/CCbg1mWc1+iM
	 Gv323BquroyQdG2kncCJd4DISfwyMHFGs+0/gxwDkw/jnr0+GItx7Wof5VNsfELzhx
	 B0zwbA1eNYI/9mf/W9X6zIODhxL4DYnlSWleByrL+Mip85hlmHb4tqzSVOZFtGCNnb
	 8pygiKYUARwgN4Y0lYkKa672YyRB6QbsooDaNHNk+9JP+3xBcrnK46da59VAL/JDGr
	 KAzBnpwaevPTC64kV6PwRH4LNBbQ57t+9hTDJlLpoY4ETtq3CuHvhTza5rYIqohRIp
	 3+1jxc9mkhX+g==
Date: Thu, 26 Nov 2026 08:54:17 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank.Li@oss.nxp.com, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Frank Li <Frank.Li@nxp.com>, linux-bsp@toradex.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] arm64: dts: freescale: imx9[135]-toradex-osm-dev:
 Fix SDIO_B interface
Message-ID: <20261126075417.GA12954@francesco-nb>
References: <20261122171931.295307-1-francesco@dolcini.it>
 <179562955482.3138640.15368712550107593780.b4-ty@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179562955482.3138640.15368712550107593780.b4-ty@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_235429_123226_7CF62CBB 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello Frank,

On Wed, Nov 25, 2026 at 01:00:29PM -0500, Frank.Li@oss.nxp.com wrote:
> Applied, thanks!
> 
> [1/2] arm64: dts: freescale: imx93-imx91-toradex-osm-dev: Fix SDIO_B definition
>       commit: a9f5577f21dbdd097f8bd0bade4777cbc2c5b804
> [2/2] arm64: dts: freescale: imx95-toradex-osm-dev: Fix SDIO_B definition
>       commit: 25e472ca356c0395d7af26cb325b80bb09b2a183
> 
> drop tag "freescale", every one know imx is chip of nxp.

Do you want us to drop the `freescale:` prefix from now on (it's there
because the prefix is the directory path, not for other reasons)?

So just "arm64: dts: imx9[135]-toradex-osm-dev: ...". Are the DT/SoC
maintainer fine with that?

To be explicit, I do not mind, I just need to know so that we send
patches with the commit message title you expect.

BTW, please check https://lore.kernel.org/all/awbs94RtiqAOqhEx@sirena.org.uk/,
it's related to this "freescale" removal.

Francesco

