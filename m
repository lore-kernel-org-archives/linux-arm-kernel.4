Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA96606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Xe/9OAXn;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rs7Dw8BM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rrmNHSU3ypTCqoRrLbiif4hQznku7QNW/QdUBxa7ntk=; b=Xe/9OAXnwfL7/lGoUfiKRmPDhl
	L9+a4+Y2QxTr9EahjbhQKPJq39ToE39gJJYHV4GBsMJUCXMPSKB+ieBGYpd99P+1gb0qgztBVSOoz
	o/tvFABGfYLajFIB/uSoIjAHD6CYwEfFws5B4wmViurpJ6VYPEFoq20j7RMM1+lQXiD0dmj/jBc10
	z+un+QPemkxUCFLa2x1iKgY+WhohyHmMyKUYrrUxZs+iTucjcuQKOC5FYBPPgkPddhMfJhaQS6Y4h
	vHK9rE7JlotlRgpEzGvgDZgBoRq18BzcPhaQSD84X8IfqdTTwKCPflN+HvQ9WPDv8He8RRxn7evF4
	Wzk52ZrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWxa-00000004CUY-2avX;
	Mon, 23 Nov 2026 16:32:06 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWxY-00000004CTe-04uc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 16:32:05 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-33fb4680717so9553949eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 08:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795451523; x=1796056323; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rrmNHSU3ypTCqoRrLbiif4hQznku7QNW/QdUBxa7ntk=;
        b=Rs7Dw8BMMaaiiGRODsqU+a1PSrF+y9VyBWd/tHE4AZvQQaFOCk6w1sAg3LqU/op5f8
         3kthvY44wVxuWS15raQzLOFkH7VT4TWRSzco2KGu7WuvNp/DwlaXiX//npfZub5E7ZQD
         j9Kj6iBmQlagRy+kyfDaRR0gei2EIjjuKf9gOIqy5zTiJxR0myV82S51vU61wV/w3M+m
         GvXI5s+rE50yfaWH6qwnKyJNoGpxKnLYWptx3I4BKdblhAuCUgMgrmhh5bN3aAqb6jU8
         QqEx9SLURG6xLHNFU3GvWM3p7hMlMkA+HwP+vD154n0nOCHysQcX8r6Ndl3+VPSLD04p
         Vogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795451523; x=1796056323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rrmNHSU3ypTCqoRrLbiif4hQznku7QNW/QdUBxa7ntk=;
        b=potUk6EfsqQ2ESKGPql1a+p8dw/oB/NJ0fA+2fFGfhwgmvcB8C0VN7GDLsVE1LDT3f
         yoBQuZlSy2d2ROAr9A8e5poEZN5P5aqVghaBdVKIMIjdhbd10O3s7znsGQ2DxouUYiEA
         Ce/AHxc2yjYsS1ErDOWyv5+3WisKnRvsDXJYfLUptO3JaTQLYKhS8tMFA/8URA6HId3m
         UH0sjaNdUrdpS4zMqKdZESt4Dw5Oe2ahXprNXUHHmBsxO+mAZtaxcGhpHDkeH5/t1K4F
         n0YYN9d/G1Xm3VIW9Pe2OcZlv8gnXKQpr17Z48og4cYmwjDKOsohqW1wnJIAx5GLWsla
         uPBQ==
X-Forwarded-Encrypted: i=1; AL+hErGLAwjC+RE5MUgnwutR/h5iKmDBtmzViJa5bPK2Zk25N2wGclkk+dAfp7Z2EV26J64Ok+BM4zLfId0I12cCFKg0@lists.infradead.org
X-Gm-Message-State: APuU4Z+hr8eNp962rCtcy2G7fkm1T6X2b2rF1X7YGhtXsDECNyVh+Fcn
	2N0DIOt39VLVbVZpWYYtotNJfgcpH0mAgyAb9r1VzlpleYZkzhAQQf/6cS9s
X-Gm-Gg: AZFdTZcTvyYP0gfsMGY3oNL4OzBaJ1kCzUsqrH+Yhvcr9gyXWBAWhu9WEDV9KYfzd6y
	Mzb5OBx3RA/44vFunCGC3MYEhsX7qm/6O9veB83nnDlUoLq5taDA50Ax5E1fbRWhzEsTOhznsfs
	e78OABf/dC4rm+RxjrXbbTM42YHQYUMHthBC2H/NB4fGuZJQyPcrOWwfAbe2jpaxGSgkZTXhBAv
	EFY3Jfryftpil7XW9+0AOwdwx7D9hf0YknIzvlrJYJzgXtsmpxdJqX0KbSJtK0WcyV4E86gUkQg
	6gtZvp3vAGPf9LVaINd1g+Fy5Wdnyle4n900fxp34Hk8HWN1nwAn/8rCjiLle1Y+zGvcDR1zU8d
	lr51g7IOWEZwxT8qoohE8j0ODPeGD5D2HPpYY0Gh7lm0UgS8eqBZBvHT8942xk5/MeAIMLBhZ88
	47j8zLM1Wil+5ItFT7U7s7DaU1hSDDdU1jal/8k1i60PJ3f0zyCrNPg7kFD8UZxz+3/nNGU6Jl1
	xiAC4oAiG7Mhv0IN4o3Q/ILxLdWkXXUhEo+ruLLBEJMryjbFogaMy6SXFD3uWKlEzIqN00fuE40
	qGT4JbU8xkF9iUzAYBSz20No95tWHYlqU48G7DKxjJwN0LQ1Xq0pi1IBdA==
X-Received: by 2002:a05:693c:88c7:10b0:386:b3aa:77f0 with SMTP id 5a478bee46e88-386b3aa7d6emr2891515eec.18.1795451522495;
        Mon, 23 Nov 2026 08:32:02 -0800 (PST)
Received: from localhost.localdomain ([218.212.26.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b1965c02sm9727659eec.27.2026.11.23.08.31.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 08:32:02 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: MD Danish Anwar <danishanwar@ti.com>,
	Parvathi Pudi <parvathi@couthit.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Roger Quadros <rogerq@kernel.org>,
	Mohan Reddy Putluru <pmohan@couthit.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: ti: icssm-prueth: Retain port node references until remove
Date: Tue, 24 Nov 2026 00:31:30 +0800
Message-ID: <confirmed-20261105-26-ee6bb3813c44@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_083204_056605_FBC4F0EC 
X-CRM114-Status: GOOD (  11.88  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

icssm_prueth_probe() takes a reference to each available port node and
stores the nodes in prueth->eth_node[]. Those references are released
both at the end of a successful probe and in icssm_prueth_remove(), leaving
one excess put per port after unbinding the driver.

Keep the references after a successful probe, since the stored nodes are
used during teardown. The existing remove path and probe error path then
each release the references only when they own them.

Fixes: 511f6c1ae093 ("net: ti: icssm-prueth: Adds ICSSM Ethernet driver")
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
AI assistance was used for analysis and patch preparation.

Based on next-20261104 (8b7179210b22).
Compile-tested: arm64, GCC 14.2.0, W=1, drivers/net/ethernet/ti/icssm/icssm_prueth.o;
baseline and patched objects built with no warnings.
Static source review; no hardware, boot, or KASAN test was performed.

 drivers/net/ethernet/ti/icssm/icssm_prueth.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
index b42c98e861e081d6c616881786b94e8bcde6b944..4f9529e0e404fd9cfee9e7340f2f048442ab938a 100644
--- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
+++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
@@ -2018,10 +2018,6 @@ static int icssm_prueth_probe(struct platform_device *pdev)
 	dev_info(dev, "TI PRU ethernet driver initialized: %s EMAC mode\n",
 		 (!eth0_node || !eth1_node) ? "single" : "dual");
 
-	if (eth1_node)
-		of_node_put(eth1_node);
-	if (eth0_node)
-		of_node_put(eth0_node);
 	return 0;
 
 netdev_unregister:

base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4

