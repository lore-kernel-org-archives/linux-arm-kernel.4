Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271A1606A339
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 10:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jp411GGP;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=AQuAO0+L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nA9uVd9Z0U/OOJAJirWA9SKPkRY0C9MO6GKy6l0PlO8=; b=Jp411GGPogeEmlA283VXaHN1k+
	Bp80+67RQK1P45kjtGijAA60Ny6gbGaf9291g/nR7JHbCogZOw7FZULa/gby3fgvZ+O/toPVJr0Pu
	62YUFwPGDXrd/v2KEhPGjHLVAFgtyDD2oLbePn2Q+mH2CAHUEVlywhsfUgQTghWOEVaZJAQI1woWw
	R017GeY0X1lE4R+oI5FwtQxyhk4anjAvBZrKaB8Y+pU5R8GvqpNswvlK9BRU+R2Z7JKyGUEFnkUBS
	Yn5uPTAqV0XpgCK84+raOwvNZkLHGVm9N+fzdz0sm9+9I5+rx3m9nI0rmRW3/YdWxRFJ19AmDQeLF
	8aWASzEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAew-0000000FjYA-2dPC;
	Sat, 14 Nov 2026 10:06:58 +0000
Received: from smtp4-g21.free.fr ([212.27.42.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAep-0000000FjU4-2y8g
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 10:06:56 +0000
Received: from L30177.local (unknown [78.241.242.250])
	(Authenticated sender: vjardin@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id BBAB619F57E;
	Sat, 14 Nov 2026 11:06:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794650809;
	bh=g0Aj3QD5cJIwmcGFVWYqEOdOoEhMM0NOddv6KOjkgb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AQuAO0+LZLEF/gQfONel9daJSQ5G+M95vDYtU9EaA81yx0jCh7xMnXqRLFgMJBU9K
	 jeOuqebH4GbanWCKhqhNViberAirFwC36UCWL77DI4wzGunWvC5L7kd1A0VyS2kvzv
	 q1ANqthOBT7i5HnPa6QJVVK1pWT8laUcldqzv5BvOYFdmwEkhliKxq6HWuLnNMJnJc
	 J8eEOBvLyLi+Grsj+LX16XZw2uVEhzq42HFUCJbHMBREzYGMMPbyL5n5bG1NIAiQIT
	 vS8liQaaogXWcElLIw2rjPZBVMty3c9qR5g6YqYGv9+CHx13rwb+N4Vuk3Kbvb3lis
	 Dt0bnTZBHj5YA==
Date: Sat, 14 Nov 2026 11:06:22 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: Re: [PATCH v4 3/5] soc: fsl: guts: add the RCW override of any RCWSR
Message-ID: <avgynp6NS1u2-2Qv@L30177.local>
References: <20261114-for-upstream-lx2160a-rcw-pinmux-v1-v4-0-eefcea066a55@free.fr>
 <20261114-for-upstream-lx2160a-rcw-pinmux-v1-v4-3-eefcea066a55@free.fr>
 <d0f781bf-a325-4eee-9431-7eb387279934@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d0f781bf-a325-4eee-9431-7eb387279934@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_020652_218126_1DB8BC4D 
X-CRM114-Status: UNSURE (   7.04  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Linus,

> Acked-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

With this ack and the reviews from Rob and Frank, my understanding it
that the patches 1 to 4 can go into the pinctrl tree, while the
patch 5 can go into Frank's tree once the driver is in.

Am I correct ?

Thank you,
  Vincent

