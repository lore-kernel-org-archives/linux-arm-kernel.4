Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C79D606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 11:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gtuzOB30;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=ik6dsrXJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=I6M9drfNN7zCNsaSrSObIiphbvQS2j9fYF//SvIIVu0=; b=gtuzOB30rDfL/Cc9WyG4z804sl
	NGtRDENcMNFhEWw9D+5BlRZ6t4Rd7Mr0QJGJjwqF2jp3V4t+dPWDtofd4/o39D5g1/wkWpSgQ4Tw0
	f3yMTK8Qq1+eGNzn1iW5yYcWs3GNBg+w7ktIuUIOmf349/1NoIF7hRXSe/2s3zuPWHSK6EWP6nEF4
	G1c0/pFOB9PgyiSVo9j7xzbQvWt98NaHgeEDPpEX630yCt5ALIjMcX/M93BaNwSiUnD4WpuwHqdBL
	y9hPmTdEIdfajU5ACMVcux8K+n74doIYQ7+TJ7FB+pSp8zWTCGE+5Q3VierTY4XsFYGhqYkxpD9xQ
	2XjV3GYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSYGq-0000000HRB1-26aj;
	Sun, 15 Nov 2026 11:19:41 +0000
Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSYGk-0000000HRAf-3PLq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 11:19:39 +0000
Received: from L30177.local (unknown [78.242.88.98])
	(Authenticated sender: vjardin@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id D792CB0051B;
	Sun, 15 Nov 2026 12:18:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794741571;
	bh=JQD3/EFXCa4lxF1FzAPYk7PWu+NKW3cxCD9tTy0x1cs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ik6dsrXJYrk/VQXyRed2GD1Pp5tDkQSbJ83ictljm1FKfb4Ox8x+nlLt0T2YU9kJR
	 rvmjalYzY7TiZJfQAbCUy1e2Zt84pL9OLjTa20g1DK2yews6kwKo/vq20kUD9jonZL
	 C46MPyDT7DhMhbvQOOqe6zl38xuHODDxKCvm8MTp8HuV003/CEC1zxqnvfncFbp4uR
	 TOIgfbpbbZ1do+E1PYz0KZTcBnbc79rLlddNWRWGBeCMkjN3nAjd7ARCpRdywXrX63
	 xo/tKnRt+jx2nfY5H7izHPB8sfV3RfaNPrIK0MBzXPHbN/jYZbsEyHnJBMRKnw+v7t
	 Gn8OC0dkrijwg==
Date: Sun, 15 Nov 2026 12:18:57 +0100
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
Message-ID: <avmVIb5-l2DUq75m@L30177.local>
References: <20261114-for-upstream-lx2160a-rcw-pinmux-v1-v4-0-eefcea066a55@free.fr>
 <20261114-for-upstream-lx2160a-rcw-pinmux-v1-v4-3-eefcea066a55@free.fr>
 <avi9N8P34X5uel7a@skbuf>
 <avjy-lCL2A9gEhcL@L30177.local>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <avjy-lCL2A9gEhcL@L30177.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_031936_874996_EDCA7448 
X-CRM114-Status: GOOD (  16.95  )
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

Le 15/11/26 00:47, Vincent Jardin a écrit :
> Hi Vladimir,
> 
> > I cannot agree with your API proposal. It exports to the rest of the
> > kernel a blanket API for RCW override of any RCWSR1-RCWSR31 register,
> > *including* the SerDes fields for which the fsl_guts module already
> > exposes an API. So with your proposal, what can be done with
> > fsl_guts_lane_set_mode() can also be (un)done with fsl_guts_rcw_override().
> > The possibilities of abusing this API design are endless, and I don't
> > want to have to deal with them when I can avoid them.
> > 
> > At a minimum, I would recommend renaming the API as fsl_guts_pmux_override(),
> > and make guts enforce which register fields it permits overriding via
> > this API. Example:
> > 
> > static const struct fsl_soc_pmux_mask lx2160a_pmux[] = {
> > 	{ 12, GENMASK(29, 0) }, /* IIC2..SDHC1_DIR */
> > 	{ 13, GENMASK(29, 0) }, /* SDHC2_DAT74..EVT43 */
> > 	{ 14, GENMASK(10, 0) }, /* EVT20..IIC1 */
> > 	{ 27, GENMASK(7, 0) },  /* EC1, EC2, USB_EXT, GTX_CLK, SDHC1_DS <- your series is missing these */
> > 	{}
> > };
> 

I did test it on the board and sent the related v5 based on your suggestion.

For instance, when I did a forced bus recovery of IIC1, it
moves only its related field of RCWSR14, and the first override of RCWCR27
does not touch USB3_CLK_FSEL.

The v5 is here:
https://lore.kernel.org/all/20261115-for-upstream-lx2160a-rcw-pinmux-v1-v5-0-d246166ea469@free.fr/

thanks for you help,
  Vincent

