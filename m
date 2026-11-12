Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B109606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 10:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HLlRHiST;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ny7X4Hvn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZP3U5tKFMTHhfEkSOkzIHCLH+O/mUp11WA5Kb/PScQc=; b=HLlRHiSTcJnPCPrB0CMg3AqBEs
	ey3nyL8bAnZCEp4TC2clMduCiUhkZvt9AXsCs4NtUeuRonOgi8SPt1q8ZZE/n1gLWM+y85a94JJ7t
	zksA/dlBez4xO7STJ7/mo2nBdPrqXZYifSgFumbViS0rwOaHDL/pp6p7OWYO31k3JdUC7yj/9MraK
	EYI/69KGTPtmN0JSbldEQ2M7+ruk1+4TOfLEXbeRn9WhbLwyIfm1Fn1RYTCraq9hPUuGW0o1HLZbH
	8jPdNahPR3iANiganzIA0ivlBiGI0WXobCud43YJ88CGgEDXQiNzNKGRlCNZJrLjGQJw6Jprg0qIR
	mmbgnGVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSFR-00000009YjN-147P;
	Thu, 12 Nov 2026 10:41:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSFN-00000009Yit-0lhZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 10:41:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9DFA260D68;
	Thu, 12 Nov 2026 10:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D83D1F00A05;
	Thu, 12 Nov 2026 10:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794480096;
	bh=ZP3U5tKFMTHhfEkSOkzIHCLH+O/mUp11WA5Kb/PScQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ny7X4Hvn9UH6mVup1UvEbkAfGc8JY7VlNNNI96Rh8wwN1bR0EwV4gzt8yE+wqa/8r
	 oF5fVa29etzTNaKAy2YFBaeku48E1mY07UDW65GViK2gQOq3h2y/ZTXQ7V9b+zMIJR
	 /xaYSk9mqAXQzWRMgbmjxUrtEL60BJ8U79nESmxJvPqfA6zYl0FKsxIIrBCj65czpo
	 JseNY5/q1Yy2av2SqkHLCDr9k1PG+D3Kx7PXkKJBC54BqxM0mQKD+GyG7L7VGhI1Px
	 BWxrlY7uEVtl6B08t8IPWbz3pNrXrTecf4zGnvQPSku6vZe0qhvEHV62uYgKYD2oty
	 QrtzyroSYsGcA==
Date: Thu, 12 Nov 2026 11:41:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Obergfell <frank.obergfell@bytesatwork.ch>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Michael Walle <mwalle@kernel.org>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Alexander Forsch <alexander.forsch@bytesatwork.ch>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/5] dt-bindings: arm: fsl: Add byteENGINE i.MX93
 platforms
Message-ID: <20261112-acoustic-natural-koel-053ef8@quoll>
References: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
 <20261111133119.1063210-5-frank.obergfell@bytesatwork.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111133119.1063210-5-frank.obergfell@bytesatwork.ch>
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

On Wed, Nov 11, 2026 at 02:31:18PM +0100, Frank Obergfell wrote:
> Document the vendor prefix for bytesatwork AG and add the compatible
> strings for the byteENGINE i.MX93 System on Module (SoM) on the
> byteDEVKIT carrier board.
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml         | 7 +++++++
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  2 files changed, 9 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


