Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D54606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 13:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kAe/n8Af;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=N3cJTdKy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7d2Kk7WcyF8PRkP72zbhRGMkbN0Tb+b+QibWkFY2CgE=; b=kAe/n8AfjhG1W4
	X3mENfMGKGLJDQ3zPaKAR86DqW4Ly2VGVI2ZZTEBYU2YRbfLkgpQ/RF8jgjhs2Y4kVlgcoueVHjUE
	Xr/ifADL9wT+dE0vAVJSuTD5YtT0tUn5W9Pg2OFndmUyFSMRhakSbE3wPsJxhd6il4eTN6EAxl99j
	EPVvlbQjkW//ZJNqDz6MGhptipb3ngieQi/P3L7q6rfQ+v1fIlSVX/f9wISzF4pEhzvrqT71KRFrZ
	/HuNnFl0Rz73H1V5ge9qoU036DQYz7E0Cm77iW5UZlV/4pl6IFQ7dlHKsXAeLyw0h5vQ5jYs2QiPH
	Yaiu/yMczF/9P3R6ihGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2ei-0000000C9C7-1NKJ;
	Thu, 19 Nov 2026 13:58:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU2ef-0000000C9A8-2Xsh;
	Thu, 19 Nov 2026 13:58:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=7d2Kk7WcyF8PRkP72zbhRGMkbN0Tb+b+QibWkFY2CgE=; b=N3cJTdKy6IMcl2NcMZXMfS08Ul
	mfH1xM/q6PPSgZ9I6LIGHpYjuZQkFWRz02xZq/KJyqivipYk4W+aUC8MSO5d9DVCvjZ0zS7euxgp5
	UNUw26+sVBrTkNCUU9lD8GISFqdaXtpg4zvFk2n2UADIaC9HbYM5Cy0wEx6AaurkY4PUlFP9Ur2fI
	aI2p0JvNP9NM2TvV34cjaf8XSeTcK9axhywJ67pFsRFwk/6amjHhMEE1aZsydgE9dksF30Cp9/KXd
	t9/6I7RI88//kefaq7jnBD8kVaNtZrfzL5z2PqetlAdJYdvC29Y5F/N90v+BwV926Dn5Kt5yQysx8
	5X0Ik+Pg==;
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
Subject: [PATCH v4 1/6] spi: Allow spi_toggle_csgpiod() to get called from atomic contexts
Date: Thu, 19 Nov 2026 14:58:03 +0100
Message-ID: <20261119135808.2377849-2-heiko@sntech.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119135808.2377849-1-heiko@sntech.de>
References: <20261119135808.2377849-1-heiko@sntech.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_055825_989363_80A559DC 
X-CRM114-Status: GOOD (  13.93  )
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

spi_toggle_csgpiod() by default allows for sleeping gpio controllers.
In the upcoming atomic mode for late stage systems,

So determine which stage the system is at and select an appropriate
gpio_set_value function to use.

If for whatever reason a sleeping gpio controller is combined with
an atomic operation using a gpio-chipselect, this will cause a warning.

This also introduces a helper spi_in_atomic() to determine when that is
the case. While the upcoming atomic transfer should really only be used
during late system states, this helper just makes sure to distinguish
between sleeping / non-sleeping.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/spi/spi.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index a6a9aaa47fde..5e05f2fef12e 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1244,8 +1244,18 @@ static inline bool spi_is_last_cs(struct spi_device *spi)
 	return last;
 }
 
+/* Check if sleeping is allowed */
+static inline bool spi_in_atomic(void)
+{
+	return IS_ENABLED(CONFIG_PREEMPT_COUNT) ? !preemptible() : irqs_disabled();
+}
+
 static void spi_toggle_csgpiod(struct spi_device *spi, u8 idx, bool enable, bool activate)
 {
+	/* Will complain if atomic transfer is combined with sleeping gpio */
+	int (*gpio_func)(struct gpio_desc *desc, int value) =
+		spi_in_atomic() ? gpiod_set_value : gpiod_set_value_cansleep;
+
 	/*
 	 * Historically ACPI has no means of the GPIO polarity and
 	 * thus the SPISerialBus() resource defines it on the per-chip
@@ -1257,10 +1267,10 @@ static void spi_toggle_csgpiod(struct spi_device *spi, u8 idx, bool enable, bool
 	 * into account.
 	 */
 	if (is_acpi_device_node(dev_fwnode(&spi->dev)))
-		gpiod_set_value_cansleep(spi_get_csgpiod(spi, idx), !enable);
+		gpio_func(spi_get_csgpiod(spi, idx), !enable);
 	else
 		/* Polarity handled by GPIO library */
-		gpiod_set_value_cansleep(spi_get_csgpiod(spi, idx), activate);
+		gpio_func(spi_get_csgpiod(spi, idx), activate);
 
 	if (activate)
 		spi_delay_exec(&spi->cs_setup, NULL);
-- 
2.53.0


