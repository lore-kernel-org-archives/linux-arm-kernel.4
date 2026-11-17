Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE180606A894
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 14:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kKGqCP+N;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=J7U40aS7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LmdnAdyFc/KExKjlXTQQG9vPex2c1X+M3F6FG9ILMsw=; b=kKGqCP+NTRGxCj
	jlyiI9ajXBbrDpnywNJ4oipWRb1a9n21dcfZM+MAAcquwXC2/RES1I98Fh8GytHT+QTXLpif0UmCh
	gDZoh7RD6VlyBo7WQPq58H1b9O5d3JZF9np5DZVJqrJ/sAMoU18GoebplMstI7JUY5jvJAo2azN9w
	xLv7LZpTDkhNJhwVKksnYUGPn5WhZrNivaZ5LeY70S0t84wAu+kOASypzLBgKbxQPRtNkVZaX22/y
	KSuYCxtUAAQCoMfwQCw2Fms0OAiUQpzPkppX4EGT/Ul+I94kzUanuWCepgLNo5JF9GHqDSCAcV/K4
	m+RDEOXBwqzeyNYe4srA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK5m-000000066kW-3gDx;
	Tue, 17 Nov 2026 14:23:26 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK5i-000000066cA-1uIM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 14:23:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E947F4E4158E;
	Tue, 17 Nov 2026 14:23:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B745E5FD6A;
	Tue, 17 Nov 2026 14:23:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F2B7E11BC0039;
	Tue, 17 Nov 2026 15:23:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794925398; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LmdnAdyFc/KExKjlXTQQG9vPex2c1X+M3F6FG9ILMsw=;
	b=J7U40aS7WBu6kKVkRezLn47fJrpUXyPOBQu4dgs67vHMxgOWv2kMJQsSg+jyzCbDYCIF7G
	vSr0R7ZvDK3Xs7tChTwjYj9wcRCe06qR2GNDb9pOQCafzX5NWZaQjFlYKYyxaNFvcejqkP
	GjYjm7sR2sYhwHCnGH1kCUvyNfNzVENHYVB1qlucYC+IkOjmal+TP8UI/jCK+adO0wCEc5
	seOiDX0jrFv5H6kBd0fw6VXx8FEl8RxqDIwFuELjywmMcKAC+VxcnsEC6MDT5cVFp7QIWF
	6tYMD+CaLBBlJelZfI8Hi29pDa5dx2cI9EiJqPyVRcu7pMlvIVqx2PaHp5nJSw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20261103100602.1310416-1-vulab@iscas.ac.cn>
References: <20261103100602.1310416-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] mtd: rawnand: atmel: Release the HSMC clock on legacy
 init failure
Message-Id: <179492539687.2259780.15450665265756565603.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 15:23:16 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_062322_635496_6F345DD2 
X-CRM114-Status: UNSURE (   8.21  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 03 Nov 2026 10:06:02 +0000, Wentao Liang wrote:
> When atmel_hsmc_nand_controller_legacy_init() fails after acquiring the
> NFC clock with of_clk_get(), the error paths return without dropping the
> clock reference.  For failures after clk_prepare_enable(), the clock is
> also left enabled.  The caller returns the error without running the
> controller removal path, so the reference and the enable count are both
> leaked.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: atmel: Release the HSMC clock on legacy init failure
      commit: 85dc1b1e3bf5d299fc3531dfa9ee8473bcfc075e

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl


