Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6371F606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 23:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M4EUshcM;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=DRTkaIZa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+msR+L8hupIZu3L7AvrprWnt14EoIGonWEztPzERWDk=; b=M4EUshcMon7pEagiOoswdTQS8l
	L+86/UCRn7+xkhpIIXdtPprhEAnZSvFYsV/vMzdBJK4dfO5sVH66RJ7PFc+xIkamjTXSK20YCIA4b
	GXsZEB9sPZHZCh0/UI3eWKxtFh1/AN+B6faLHntAqlgFuJKxnK1jSLQbB6ckIHVkZzhmrydP770+5
	4PdjL8FL1+mmp7oGv7EeB/CGf5XRceW/ka/TW7+/f62NauDEz+jRbYsEkJFE1y690Kk4NpMWvtGLj
	aST5EPu6A4MGIZC/5pwjqW7UonwvItAFFL2pU3tQMnWbKriYZ9zJ2p5WrCXGQAVjF7CbkkwIGpfL/
	bd8Na8Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSNTA-0000000Gtam-1pRq;
	Sat, 14 Nov 2026 23:47:40 +0000
Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSNT7-0000000GtaE-2Y4E
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 23:47:39 +0000
Received: from L30177.local (unknown [82.65.104.223])
	(Authenticated sender: vjardin@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id CE22313F880;
	Sun, 15 Nov 2026 00:47:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794700050;
	bh=3DuhsD14Zo+NE2HJ5h/Fip7dpWi29Qk67BwYWlaEb8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DRTkaIZaYSzmqkoLQbhO9xlX4cTzmOA5DYPOCj96tq1OnyApDP1+kVRiRn+70PlFS
	 qPeIxbFJcwi4DDTbEXyVTBvyTdu2k4FJIFH4bZP1fpta8kqGcB0JzORI4dSFxiGcOV
	 uABtjcmX33/nN78SOb6wasOQcfzoVwBA5N01QCLOOqChMfBiDzGQHh1vtYbhkIgrk/
	 dhC1DmBpCenH82iUoBWmtDFmYoXRDRD3RSGpRhPyr7pRd3X08yAQQoZXCZeVvI76BW
	 gPESwU1Cs/6ksgLAgZ9AEsHDdSnkUArgMn7MxrmEENwElzAtUfBr7gcOf9F0eTwOC8
	 6QVVl55AxHdwg==
Date: Sun, 15 Nov 2026 00:47:06 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
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
	imx@lists.linux.dev, Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: Re: [PATCH v4 3/5] soc: fsl: guts: add the RCW override of any RCWSR
Message-ID: <avjy-lCL2A9gEhcL@L30177.local>
References: <20261114-for-upstream-lx2160a-rcw-pinmux-v1-v4-0-eefcea066a55@free.fr>
 <20261114-for-upstream-lx2160a-rcw-pinmux-v1-v4-3-eefcea066a55@free.fr>
 <avi9N8P34X5uel7a@skbuf>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <avi9N8P34X5uel7a@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_154737_808076_E2B16DE6 
X-CRM114-Status: GOOD (  12.54  )
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

Hi Vladimir,

> I cannot agree with your API proposal. It exports to the rest of the
> kernel a blanket API for RCW override of any RCWSR1-RCWSR31 register,
> *including* the SerDes fields for which the fsl_guts module already
> exposes an API. So with your proposal, what can be done with
> fsl_guts_lane_set_mode() can also be (un)done with fsl_guts_rcw_override().
> The possibilities of abusing this API design are endless, and I don't
> want to have to deal with them when I can avoid them.
> 
> At a minimum, I would recommend renaming the API as fsl_guts_pmux_override(),
> and make guts enforce which register fields it permits overriding via
> this API. Example:
> 
> static const struct fsl_soc_pmux_mask lx2160a_pmux[] = {
> 	{ 12, GENMASK(29, 0) }, /* IIC2..SDHC1_DIR */
> 	{ 13, GENMASK(29, 0) }, /* SDHC2_DAT74..EVT43 */
> 	{ 14, GENMASK(10, 0) }, /* EVT20..IIC1 */
> 	{ 27, GENMASK(7, 0) },  /* EC1, EC2, USB_EXT, GTX_CLK, SDHC1_DS <- your series is missing these */
> 	{}
> };

good idea, I'll apply it.

Thanks,
  Vincent

