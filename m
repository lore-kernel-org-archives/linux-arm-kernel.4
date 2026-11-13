Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B14606A336
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 16:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OFT0j0MH;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=HM6inVUr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Von8RsBp854kjbWitsXhRdJUlu1QgEP7MszYVID9w9o=; b=OFT0j0MH3dUWz/a+3hl++6+XDJ
	cep/SJ0/bxTqd19ZOTCcWur07xUe3iDZDjc/ZBUV0k7VKkFJJYdiTGMYXW8QKiubGZdK7nyhXOdEe
	DKfxrZDLhEU681yl3q08rm/vudNKdH2B2WyRmtdRZ/DUQ8KNqccmCdKmw6sLhiE9/+2nn0afwWXYB
	SnvdL3VkvtP756qrtk2Zi6qroXKSWdD90fPZ0FsEkzdpAoHFzesdMfhQh0ax9pgPZF144yBmplQUZ
	JSz3FNhPF+5BKvH6Ptub6lTWtfrA+vjPE29DdXrdaA9EitjAOzoAJDZdcp3nbDlTiNlsFo2USdDo1
	yEdeKekw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuNJ-0000000DdWX-0Hjb;
	Fri, 13 Nov 2026 16:43:41 +0000
Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRuNC-0000000DdS9-3AOr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 16:43:38 +0000
Received: from L30177.local (unknown [158.255.110.170])
	(Authenticated sender: vjardin@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id AD61613F92C;
	Fri, 13 Nov 2026 17:43:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794588213;
	bh=5xzBNkaSBIwsby4+iTJvSunuWxT8nAvHfJoI83KVZUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HM6inVUr3h+5hT4j2wq5zg5TH/nz4NrbKLsWvdW8BDitD52J8P8MDhFA0EiO8bDmV
	 mCuBvX4M8HGeSD4Hn2JFl/MlJ+y962RUhxuAubENIx5f1Cu6ZNckGAqfu601STKc3J
	 dsH6aqzOPE5d5WQwxhWCT0OMZJQVVuV4hZWJ1Db0o9cr7q5Zqq2WbrX84oBMkMDoBh
	 mM96MfXiI5GqohedOQdIRui1XYqXe6A8ypHHL5WJdWUht1PxLFs1okuf0eFd3tO3H0
	 zgw38AiCs4gbZp9Gc4sU6SmJ9WA/IcEkgbTkax1N+eMdNlmu+UPQcitr/rU1VnMsNb
	 Uof0sAubw5Tww==
Date: Fri, 13 Nov 2026 17:43:09 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH v3 4/5] pinctrl: freescale: add the LX2160A RCW pad-mux
 driver
Message-ID: <avc-HWnGVhhR3m8J@L30177.local>
References: <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-0-5a0063f1da9e@free.fr>
 <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-4-5a0063f1da9e@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-4-5a0063f1da9e@free.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_084334_950931_9EF0C6E1 
X-CRM114-Status: GOOD (  13.42  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Frank,

Le 08/11/26 11:06, Vincent Jardin via B4 Relay a écrit :
> From: Vincent Jardin <vjardin@free.fr>
> 
> The LX2160A muxes its IIC, XSPI, SDHC, UART, IRQ and EVT pads from
> fields of the RCW, read-only in RCWSR12..14 of DCFG and changed at
> runtime through the same fields of the override registers in its DCSR
> view, which read 0 until written.
> 
> Since commit 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c
> gpio to support bus recovery") Linux drives them with pinctrl-single on
> the override registers, so its first pin state clears every other field
> of the word: a board whose RCW programs a non-zero pad mux loses those
> pads at the first I2C probe.
> 
> Add a driver for the pad mux as a child of the DCFG node: the fields
> of RCWSR12..14 and their encoding.
> Then pin states select them with the generic function and groups
> properties, and every change goes through the RCW override
> of fsl-guts, which reads the status register, writes the override and
> waits for the status register to follow.

Following the review on the patch 1 and 2, then can I have your advise
on this topic ?

I am looking for the review of this serie, then I'll adapt it
for u-boot along with the integration of Linux.

best regards,
  Vincent

