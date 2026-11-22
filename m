Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C20606A331
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 14:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cJZzZd6J;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=N66DNJa8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UT6ps64F668nova2kLKPiXUITTrjy6DxQnfrymQobSo=; b=cJZzZd6JMNyVL0jBCXrTAJqHcG
	KmCDgRKxWBTn+vgkcCCvL/BuKjI+Gpilyw6dacpDXxQ6O3uuwiMuvXZCFGFZ+gA/jlFerMQj84zvn
	8LhSrABZSsFJz8L9mx+kInC0i59dCzqeJ6gfhJcA5h97SgwvHWnWw9HRtUouQ0hr3Y8nbojxFxHri
	mt3c0TnoXDBS6r8budVWdjToCe8DF7XdzqHf0BgQX8rCdjdh7roDrX7fmB0gjsN19Ew2vX8UNOkT3
	a+Za7v+cfVgClV2ctp0//nOJ//4K0/KqCSFvBHxlQn7Jh6hFA4zB099yXjWs+aa0C4N6baSmcGvm3
	rQtmYqBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV8t3-00000001DnX-17nn;
	Sun, 22 Nov 2026 14:49:50 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV8sz-00000001Dm0-1aDy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 14:49:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A423D4E416C9;
	Sun, 22 Nov 2026 14:49:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6B10D60512;
	Sun, 22 Nov 2026 14:49:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2790711E60230;
	Sun, 22 Nov 2026 15:49:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795358978; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=UT6ps64F668nova2kLKPiXUITTrjy6DxQnfrymQobSo=;
	b=N66DNJa8YjNzKnWHnzM692QDi5itNkxnx6Ayb++iXjPUDAcogJMw+rMrENYvBOWTlFBbom
	mTGXMFnyfNjZzPZSpCZ9BRLDj/vwGTBAsEjw3+M+m0C8MgwD1KQSxrMhgsQsQvBAyCYblY
	P5/96JdenISrIOSaThFIZmtkt08J1BlT9/Drbqd8rA6YHNh5Jp8rfh4JrL2cn0kPUJzov5
	5dIqnVzbbHCwzdGIjAsvUuyzm4v7LomRT5Vw7XoROt3MEDB43GesDqX0O5ybkXMHyKY3tw
	+95lW2RqUXKwLe+eEfIrFCN0/EMgknyHpCFl1qbfn80sxNR0ethuhWhqjal7tA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Willem de Bruijn <willemb@google.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Nicolai Buchwitz <nb@tipi-net.de>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH net-next 0/3] net: stmmac: dwmac-sun8i: enable Flow Control
Date: Sun, 22 Nov 2026 15:49:22 +0100
Message-ID: <20261122144926.284857-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_064945_554621_DA85C715 
X-CRM114-Status: GOOD (  10.11  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

While running the "ethtool -t" selftests on H2+ (orangepi zero), the
Flow Control selftests consistently fails.

I originally blamed that on the fact that the board was connected to a
peer that didn't support Pause and that we didn't negotiate Pause at all.

The ethtool selftest are sensitive to what the Peer advertises even
though this is a full loopback test, but it is what it is :(

Since then, the orangepi zero I'm testing dwmac-sun8i on has been wired to
a proper peer, and the selftest still fails. This selftest sends tons of
frames in loopback and checks that Pause frames are generated, and
failing it means no pause frames were sent by the MAC.

Turns out, multiple things were missing in the dwmac-sun8i
implementation to get Flow Control to work.

Patch 1 allows independently setting RX/TX FC

Patch 2 is the one making FC actually work, by configuring the fifo
thresholds

Patch 3 sets the quanta values in the frames.

This seems to have never worked, so since it's not fixing a regression
I'm targetting net-next here.

This was tested only on H2+.

Thanks,

Maxime

Maxime Chevallier (3):
  net: stmmac: dwmac-sun8i: allow controlling TX and RX flow control
    separately
  net: stmmac: dwmac-sun8i: emit pause frames when the RX FIFO fills
  net: stmmac: dwmac-sun8i: configure the pause time for TX flow control

 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 30 +++++++++++++++----
 1 file changed, 25 insertions(+), 5 deletions(-)

-- 
2.56.1


