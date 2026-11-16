Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A15606A331
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 07:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PsjKw//b;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=ZaDDPzsc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cpKxpc6WsFeeIjPOouIAutKYzzXcNv+Zda+j40xqrT4=; b=PsjKw//bFJi1KozoFUxSPOeU0R
	Os3FUkn4TYRMnWOQITCer3iJwIqbZdI76t2Y16av5MQoM9K03MxukAV+S4DJlKC14Fv2rEBZyo4ds
	7Jv40kUeGLbJFZjQsIHSxWeh/1V6sd++e3BwXu8o0vXixl4SrUHMRCHR+uXpADaFf4WZCCZNoF0l3
	m9cyOwCADrGf2Pr019EUsmUBwAcuSQL2AJtZtuMyJsGSTSs9vtVfWxhLdcuA1hwTHaYFLo+XLOBzQ
	SkiSmqjuCntDkTLiLlMvucYvamMDCyZdVu3/cHPrtxXFJgBemFf1H6XeQmI59tr98liCToh7eNYHt
	HD5hVD2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrAD-00000001PLi-3fjw;
	Mon, 16 Nov 2026 07:30:05 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrA7-00000001PKT-3Ite
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 07:30:02 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 2276B1F8CC;
	Mon, 16 Nov 2026 08:29:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1794814191;
	bh=cpKxpc6WsFeeIjPOouIAutKYzzXcNv+Zda+j40xqrT4=; h=From:To:Subject;
	b=ZaDDPzscN1ltEbMVzyLxLzy6ReDNSpiilgbf3In3Ed36NMvylO0xTU6O01WzZA2Mh
	 rHctIcdBPAPpR80jH9vBnniG0FaigUtxWemjau0MNzGqQcjf4xnECf6gPTG3bM9Z48
	 LSG58aLaCVa0/djiHJpH4W+WG9AJvYn5YJA9FlauHtU0B41LMFzd8TmDzlqf7XnWWl
	 wh7Qy4grV0kfim9yxSAEAIOgiSlqZ2/upRHqPZIY1WdiAAmzQgfImcqmm6DAC8p76m
	 StCGLsx2sKthKr8XUxUMawKMzs8CDzo1u21rPoiN2e9yEt2Nl0K+r9hPdx65WGcvry
	 3tT8/c4txjCXA==
Date: Mon, 16 Nov 2026 08:29:47 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 0/3] Add Lotus Carrier Board with Aquila iMX95
Message-ID: <20261116072947.GA16341@francesco-nb>
References: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_233000_907319_2574FC6D 
X-CRM114-Status: GOOD (  11.36  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 11:37:32AM -0300, Leonardo Costa wrote:
> This patch series adds support for the Lotus Carrier Board with the
> Toradex Aquila iMX95 SoM. Lotus is a carrier board for the Aquila family
> featuring a small form factor (Nano-ITX 120mm x 120mm) and built for
> volume production.
> 
> The board features:
> 
> - 1x 1Gbit/s Ethernet
> - 1x 10Gbit/s SFP+ cage
> - 2x RS-485 (Isolated and Non-Isolated)
> - 4x CAN (3x Non-Isolated, 1x Isolated)
> - 3x isolated digital I/O
> - 1x CSI
> - 1x DSI
> - 1x TPM 2.0 chip
> - 1x microSD slot
> - 1x USB-C DRP
> - 1x USB 3 hub
> - DisplayPort through a Mini DP connector
> - A mini PCIe slot with USB / SIM card connector for a modem
> 
> Additionally, this series adds pinctrl groups to the Aquila iMX95 SoM
> dtsi, muxing the I2S_1 and PWM_4_DP pins to their GPIO functions. On
> Lotus, these pins carry the SFP+ low-speed control and status signals
> and the isolated digital I/O readback signals.
> 
> Link: https://www.toradex.com/products/carrier-board/lotus
> Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>

