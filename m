Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE6F606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 18:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E4PZoGjA;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zyFNXAhd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=z0fn3F766wuQK7x5mxxCqW7uOeoT4GbYQhAdJOMmB5I=; b=E4PZoGjAWTCPbW
	9q3na9G4vJVaCOzoyhWS750aB8VJ/xRyZk/eXHVsjpwQhL6lPtFVzGULDcHgI0aBY4f5VP3q/GQJj
	+HVkxs08ZhyqUfnXqWtZB1+xRyPZAK2FPyaNxgqx4WVA7MsM6NEg2t+sq50HGTMDbo0UK1VhwIUmc
	oqso7iOC+ImVCXX8lfkfLDmrN+99ZR8abbbaZ/aSZ3E3twKIX0s7hlOC558bB4DTmGxJL9wNVd/bx
	1+qfpusauqkv2JgvbXJzusqqa+Z3xFC/PWzDHNpvP/Hvb/ifJXWnV4TpcwQD5xqpk98cpLu+/GGMa
	EXnI4MNyNDT1irY+5U0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHNI-0000000Awbe-3Aya;
	Wed, 25 Nov 2026 18:05:44 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHN2-0000000AwYQ-2ctk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 18:05:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 18A814E41781;
	Wed, 25 Nov 2026 18:05:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E2CFC60480;
	Wed, 25 Nov 2026 18:05:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A456B11E6B0E1;
	Wed, 25 Nov 2026 19:05:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629921; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=z0fn3F766wuQK7x5mxxCqW7uOeoT4GbYQhAdJOMmB5I=;
	b=zyFNXAhdALZuyx8Bv8QI3r5W/mRqMqrMtjWNM79N33AqkCAksk8tmkuOwLNkQtxWEPuk7e
	QuoWGXatVVoMJ63AXUAHhQ3HPh+7BSeV/pTScOyMnjEooBJMC8KHBZlA+3TXYuIaOS6Ean
	CDyrS76D9Z4KXxqP+Hc6XYNtytdFEKGvW80ufcjuk+a7FzLsKGxCUn5jXAdks1dkGAiczr
	P0RXbZbAnKLoEWBYJ8KNZ0gQxi81p8YcpI4PDfombMiU07T4t2EW5gtmMbDK6IF2tzt5Bi
	prJV1kiMj9n2cKIRgO8E/NnGFVU0ENCzexwWg4r5MSIc1EtBW7FtnBfV/qDSRw==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v13 4/5] arm64: dts: imx94: Add display pipeline nodes
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-clk@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
In-Reply-To: <20261120-dcif-upstreaming-v13-4-966ac248773f@oss.nxp.com>
References: <20261120-dcif-upstreaming-v13-0-966ac248773f@oss.nxp.com>
 <20261120-dcif-upstreaming-v13-4-966ac248773f@oss.nxp.com>
Date: Wed, 25 Nov 2026 19:05:04 +0100
Message-Id: <179562990452.846133.17994433821419936260.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_100528_815594_8A1699B2 
X-CRM114-Status: UNSURE (   6.88  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 20 Nov 2026 12:50:39 +0000, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com> wrote:
> Add the nodes necessary for the display pipeline on i.MX94:
>  * LVDS/DISPLAY CSR;
>  * clock-ldb-pll-div7 needed by DCIF and LDB;
>  * Display controller interface (DCIF);
>  * LVDS display bridge (LDB);
> 
> 
> [...]

Acked-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


