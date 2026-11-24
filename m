Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289E4606A338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 13:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jNcsPKx4;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=N7ngKo7Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ovezNbKq1di3ZHCw1znvhP+NWifa/caqVGbMLX51hiQ=; b=jNcsPKx4/PthPgYgzF1zful/gI
	Ij+U0m6+GFgeTDuENTs2NGbBVC3sJvwdk8khajcmDZls5F3SA14qYGW7UA8J+a2qaGG9dVSKFEHLp
	xmv9FOWidIiOGDex56yydVEc9mjNfX1Ujd+oKDsYeNgeMaQ9wYL+kIMVpXjRDQRqTzmuekB/P7KjC
	I3S9UbuWH5aaZ9xGIO3+oX9baSG+a0Z1OIjAJb1nmbLAf2PZFkq9jPe4UvutSgqnePuUmBSDaPXqO
	1QHDlDw2YJkpHJglS+fk1lp8LBJ7TYAHl70TmgopULFz/CztrQfT9cEYluxxvkPH/Bj/RNrW4ZKZh
	N1qTe9vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVr2x-00000006hGL-0z9h;
	Tue, 24 Nov 2026 13:58:59 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVr2q-00000006hEl-2XOR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 13:58:57 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55d4cdb9b;
	Tue, 24 Nov 2026 21:58:34 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2] gpio: aspeed: Fix potential coprocessor bank map leak
Date: Tue, 24 Nov 2026 21:58:32 +0800
Message-ID: <20261124135833.2275409-1-liguangshuo@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa20dd9e9d603a1kunmd236b143342496
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGh9DVh9OGk0dSU8dQ0NJHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=N7ngKo7ZCWnEgm4MR1UoljiLZqL54oYjinK4ncmiSoEaPirLBbsyo+85LUBwKLvBuarDaB8Q5pXvSaCApSG920C+GgMA71CLMTs9mzyz1KjCto5XKCAygIYxfuPQGONJcSRYbG+M8JAZqq1kwgw5mqO94kMa2z9zqcQuEsMxYF8=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=ovezNbKq1di3ZHCw1znvhP+NWifa/caqVGbMLX51hiQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_055853_521129_403AF8D9 
X-CRM114-Status: GOOD (  12.68  )
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

The coprocessor bank map is allocated lazily but is never freed when
the GPIO controller is removed. Its only owner is the device-managed
GPIO private data.

Allocate the map with the controller's managed resources before
registering the GPIO chip, so chip removal finishes before the map
is freed. Round up the bank count to cover a partial last bank.

This issue was found by our static analysis tool under development.

Fixes: a7ca13826e47 ("gpio: aspeed: Add interfaces for co-processor to grab GPIOs")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
Changes in v2:
  - Use a managed array allocation instead of a cleanup action.
  - Allocate before GPIO-chip registration so teardown callbacks finish
    before the bank map is freed.
  - Round up the array size to cover a partial last bank.

 drivers/gpio/gpio-aspeed.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index 45e90ebaf078..8f66be7ff9b5 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -944,10 +944,6 @@ int aspeed_gpio_copro_grab_gpio(struct gpio_desc *desc,
 	if (!aspeed_gpio_support_copro(gpio))
 		return -EOPNOTSUPP;
 
-	if (!gpio->cf_copro_bankmap)
-		gpio->cf_copro_bankmap = kzalloc(gpio->chip.ngpio >> 3, GFP_KERNEL);
-	if (!gpio->cf_copro_bankmap)
-		return -ENOMEM;
 	if (offset < 0 || offset > gpio->chip.ngpio)
 		return -EINVAL;
 	bindex = offset >> 3;
@@ -1381,6 +1377,14 @@ static int aspeed_gpio_probe(struct platform_device *pdev)
 				gpio->config->llops->reg_bank_get(gpio, (i << 5), reg_rdata);
 	}
 
+	if (aspeed_gpio_support_copro(gpio)) {
+		gpio->cf_copro_bankmap = devm_kzalloc_objs(gpio->dev,
+							   *gpio->cf_copro_bankmap,
+							   DIV_ROUND_UP(gpio->chip.ngpio, 8));
+		if (!gpio->cf_copro_bankmap)
+			return -ENOMEM;
+	}
+
 	if (gpio->config->llops->privilege_init)
 		gpio->config->llops->privilege_init(gpio);
 

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.43.0


