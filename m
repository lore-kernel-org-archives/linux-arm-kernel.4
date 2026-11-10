Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E71B606C661
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 09:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=07or55hK;
	dkim=pass (2048-bit key) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=GXKfaXPR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RqKb78p7qpWJlKAs1Itlkd98Zkf/qvmrWv/pFqO1J5I=; b=07or55hKdYQFVb
	kId+RIkv5MGgBw2zrfMHVz+FZ2N82NF650I0m+RWpDJjj+iw79PQBrwtPtnMsC1rNobF4/hVvgM41
	Qgs1ojgCdt54YZutn+O7C/zwFkr5CGQgWcOtyAzTvSVmcKxwhfbPe75WjJvfFnLF2M37rpD6eukPD
	V0GXzQzzpG8VTCqBAxoKImwIxp3r2A5in00FhGzZwDZsa/MqLfrSDIN3kOHOw7+QTjiU0ZG+ymjvY
	11B9RxW5LMR0HyVqx6yOnJMtgKT5lAHzuRCyjlZwTK4bV7EnfbtnKrhgCWqE+THjnB2JOWidGtA7Z
	2lmIRdArnXxeQwAbK8TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQi0n-00000003Eis-0Z2r;
	Tue, 10 Nov 2026 09:19:29 +0000
Received: from mail.kernelriot.com ([74.208.142.49])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQi0k-00000003Ehz-3lsX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 09:19:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1794302365;
	bh=kQBTjdYh2JWmkBfDmSwwc/2rdQED1OQpth8b7MZf1hQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=GXKfaXPRHbJgZTRCX20dK30P3/GvXQmtvZc5FWdvRQYvseCs/iN8D2DltZjpckMND
	 plrKIspEqStfKqIIwcFNS+L57fFJJp7Jp7msEezv965i8O9VHmFJGXa3ZJ/UqREdDF
	 8ur0jpgCMdGqXZZFAFQoFe8QuuKWT2g9YlOd9uDMAD2bO35/gpCm893tOKykrkqX5Z
	 Jy+qwEQskvlv9wV/VytJzBIdi3t8oZS8kZ+D3IlMJXWky0S3fl3/88FHl0/4TWymBT
	 Fj75cIZkA6javPnvgswqBP4SeSP2FuxgkIIq1Ni+RaDTG0m4gNhIRbbbVOMlk8BGK9
	 fTKTKh6jisY2w==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id 515E781428; Tue, 10 Nov 2026 09:19:25 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net v2] net: stmmac: Clear DMA errors for multi-channel interrupts
Date: Tue, 10 Nov 2026 06:19:01 -0300
Message-ID: <20261110091901.7080-1-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179379704484.488856.2140619507341432623@kernel.org>
References: <20261103125430.962715-1-maxime.chevallier@bootlin.com> <179379704484.488856.2140619507341432623@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_011927_011417_C4CEDB7B 
X-CRM114-Status: UNSURE (   6.94  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Since RBU and RPS were enabled only for statistics, was masking them in
> multi-MSI mode considered as an alternative?

Hi Maxime,

Tested that route on dwmac4 (YT6801, 7.3.3) next to v2.

Stock 7.3.3 dies in 4s under a 4x 64B UDP flood (122k irq/s storm).
Both v2 and dropping RBU from the abnormal mask survive with the same
~3M RX frames within noise (3 runs each, alternating), but:

                 v2 (A)        no RBU irq (B)
  MAC irqs:      18k - 43k     0
  rx_buf_unav:   9k - 21k      0
  %irq CPU:      3.9 - 7.1     1.1 - 1.5
  RX frames:     2.5M - 3.0M   2.8M - 3.2M

Same on 8x UDP + TCP TX (30s): both stay up, A takes up to 33k MAC
irqs, B takes 0.

Caveats for B:
- Core is a 5.2, so only the 4.10 mask was exercised.
- RPS never fired, so this doesn't test the RPS storm fix from v2.
- rx_buf_unav_irq stays at 0 (pre-1b9707e6f1a9).

Want RBU dropped from the dwmac4 mask too? Can send a patch or you can
fold it into v3.

Magnus

