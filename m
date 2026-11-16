Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA1E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wtJFHe0x;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=XISsBhif
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=vsitf1gCOt+86OlSnGNHzwq1zmuiy2PBWHlc3qqYy+Q=; b=wtJFHe0xfgef/GLrKQEEeXzB2a
	+OubYPtC4oTrk2ZKbEhYOnZ5yxs/Y6ztvjSjVAXCr2rmJhkeOI7ElnzpQDTvSTKRwk5vXuVuAd9lT
	5CKnr8i07yRzDJL15sbSjcYRHTWbMRIhZWnV3vQW5VaEC2TZfHu8y5i/V1rxdZBu/TyrTEqHqlYPu
	ET4tvtx4dTs49xcwoiM+YQhabRVYbwQoFh7QfXTWruKG8OTfCTn/sU15fh9Xz4ETTDH2kUEyTFIIp
	8sZeN6NHYzz2wZjYyg2vnZiGBDQvLjAowRhaYlOzGUU4oFP5TXYxQQODKO8bUA9xIswDOMa7S3wJv
	n/Y55OYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxdX-00000002oPy-2svU;
	Mon, 16 Nov 2026 14:24:47 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxdU-00000002oMw-1UBu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:24:46 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54dbcb476;
	Mon, 16 Nov 2026 22:24:29 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	stable@vger.kernel.org
Subject: [PATCH] serial: 8250_aspeed_vuart: Fix potential stale port on probe failure
Date: Mon, 16 Nov 2026 22:24:28 +0800
Message-ID: <20261116-c29ba55625-serial-aspeed@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1e4bec2f203a1kunm8be27f0910e50c
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCH0NKVkhOTR9JGh5CGE9MSlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=XISsBhifYCn6xh7OaTRbFGgVwiNZZiOpkthsG6JNvk/Z/i6mtIwSCXIOBml8hm6ef4Hr0L+SAmpO8kJt09+6ziFv1NkOJ838dmKWYaXigNYLolHm7Ss50Jr10pdVwp/2F8qJqvoI1xFDpiNrm/dRw8kN0YJ7F/Vx/F2d3LdYnjA=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=vsitf1gCOt+86OlSnGNHzwq1zmuiy2PBWHlc3qqYy+Q=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_062444_643511_BF96A584 
X-CRM114-Status: UNSURE (   9.61  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Invalid LPC configuration can fail probe after the UART port has been
registered. Removing only the sysfs group leaves a port whose private
data and mappings are released by device-managed cleanup.

Disable the VUART, shut down its timer and unregister the port before
returning from these failures.

This issue was found by our static analysis tool under development.

Fixes: ca03042f0f12 ("serial: 8250_aspeed_vuart: add aspeed, lpc-io-reg and aspeed, lpc-interrupts DT properties")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index c8dc87f6886c..2cd1c9146ec8 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -513,7 +513,7 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 	rc = aspeed_vuart_set_lpc_address(vuart, prop);
 	if (rc < 0) {
 		dev_err_probe(dev, rc, "invalid value in aspeed,lpc-io-reg property\n");
-		goto err_sysfs_remove;
+		goto err_unregister_port;
 	}
 
 	rc = of_property_read_u32_array(np, "aspeed,lpc-interrupts", sirq, 2);
@@ -525,14 +525,14 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 	rc = aspeed_vuart_set_sirq(vuart, sirq[0]);
 	if (rc < 0) {
 		dev_err_probe(dev, rc, "invalid sirq number in aspeed,lpc-interrupts property\n");
-		goto err_sysfs_remove;
+		goto err_unregister_port;
 	}
 
 	sirq_polarity = aspeed_vuart_map_irq_polarity(sirq[1]);
 	if (sirq_polarity < 0) {
 		rc = dev_err_probe(dev, sirq_polarity,
 				   "invalid sirq polarity in aspeed,lpc-interrupts property\n");
-		goto err_sysfs_remove;
+		goto err_unregister_port;
 	}
 
 	aspeed_vuart_set_sirq_polarity(vuart, sirq_polarity);
@@ -543,6 +543,10 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_unregister_port:
+	aspeed_vuart_set_enabled(vuart, false);
+	timer_shutdown_sync(&vuart->unthrottle_timer);
+	serial8250_unregister_port(vuart->port);
 err_sysfs_remove:
 	sysfs_remove_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
 	return rc;

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

