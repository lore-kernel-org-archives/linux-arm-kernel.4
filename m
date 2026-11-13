Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DAC607412A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 13:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C5crQdUC;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=CuZhwzYl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=an70ig7dAEwpGArUZ6IJueFBhswwSw/pstiiDjbFBS8=; b=C5crQdUCPajZfc
	kmhMsMvimvO6j8nYTkrd2ustI8BhUUubKlVC4myGelqvbt8h9Sg6YUAiW75dJpbPyON6xbNC5tIOk
	bBSsCkJwfEDdFn5q6cAqfVdE1+1pjzNRWB313zDQbOw675kx1iJ4/KdNnaAWY5V+8fAUd14a3M8MI
	ONVQsMrYVjsvZy+Bg//Mr8cCNjftwwn089Ha3AQjF3NxwNzQJ50qNFtet4NOoH4KTWNkFT0ojXBSV
	t1GiQ0dfJAn27JWkJ6qi8tGJ7KPyt7e0cifO5w+6ZD431J/WRRqi2bwvR65JwByAnWgzHB+aHkR7M
	3R/2I0VckmZO8CVb8E6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrfq-0000000D1bn-0DGl;
	Fri, 13 Nov 2026 13:50:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRrfh-0000000D1V1-2QTd;
	Fri, 13 Nov 2026 13:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=an70ig7dAEwpGArUZ6IJueFBhswwSw/pstiiDjbFBS8=; b=CuZhwzYlzuHWQ4UCTTUy0ZkzvV
	xnQzjRAEtjIb1wzaxFOXXYoLHosClMw+j7RLDWKCnsvEtBxIxlfLztM8z3NkH2wDCSYCSnyYQfoSh
	v5rlqKbOtLszR47s2bUaZgSNTApyVw++jOgOwYVQ3lRYET6CDriE4TUgyd81TgRRO7pR4f+SsaUmE
	V3abAWyXsIhyqr4VxBUKUZo09njnagyaNDjtSHW9EL9Dk4EFyZC6+nkIxgNc50YREAwcPJB5a8ggn
	crHdRy7jxgqDumoisEsb2sDfdurBvMEIIpym1H6sYZcNqtYyWKSFV2ZgIpOGQY/UV40rlLNavevP8
	e++v95eA==;
From: Heiko Stuebner <heiko@sntech.de>
To: broonie@kernel.org
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	quentin.schulz@cherry.de,
	Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v2 1/6] spi: Allow spi_delay_exec() to be used from atomic contexts
Date: Fri, 13 Nov 2026 14:50:12 +0100
Message-ID: <20261113135017.1047959-2-heiko@sntech.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113135017.1047959-1-heiko@sntech.de>
References: <20261113135017.1047959-1-heiko@sntech.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_055029_642090_94329104 
X-CRM114-Status: GOOD (  14.76  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Heiko Stuebner <heiko.stuebner@cherry.de>

When using spi_delay_exec() only the fsleep in the subsequent
_spi_transfer_delay_ns() can actually sleep.

As we might want to use spi_delay_exec() from atomic contexts in the
future, move the might_sleep() up to the actual place that matters
and fall back to the existing ndelay if called from an atomic context.

This also introduces a helper spi_in_atomic_mode() to determine when
that is the case. As this should really only be used in very special
occasions, it really restricts things to late system states.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/spi/spi.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 40cda0037ea5..e79f16aca1a3 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1700,15 +1700,27 @@ static int spi_transfer_wait(struct spi_controller *ctlr,
 	return 0;
 }
 
+/*
+ * We only allow atomic transfers for very late communication, e.g. to access a
+ * PMIC when powering down. Atomic transfers are a corner case and not for
+ * generic use!
+ */
+static inline bool spi_in_atomic_mode(void)
+{
+	return system_state > SYSTEM_RUNNING &&
+	       (IS_ENABLED(CONFIG_PREEMPT_COUNT) ? !preemptible() : irqs_disabled());
+}
+
 static void _spi_transfer_delay_ns(u32 ns)
 {
 	if (!ns)
 		return;
-	if (ns <= NSEC_PER_USEC) {
+	if (ns <= NSEC_PER_USEC || spi_in_atomic_mode()) {
 		ndelay(ns);
 	} else {
 		u32 us = DIV_ROUND_UP(ns, NSEC_PER_USEC);
 
+		might_sleep();
 		fsleep(us);
 	}
 }
@@ -1756,8 +1768,6 @@ int spi_delay_exec(struct spi_delay *_delay, struct spi_transfer *xfer)
 {
 	int delay;
 
-	might_sleep();
-
 	if (!_delay)
 		return -EINVAL;
 
-- 
2.53.0


