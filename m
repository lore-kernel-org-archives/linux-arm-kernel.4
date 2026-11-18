Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED37606A337
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 14:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OfoPNBpT;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=SJqmsQ0u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nFXqbRa1OhelbFVhcjizOVyRIMqDJEhst38NtKslZYw=; b=OfoPNBpT26+Q0O8e4biF3pWJH7
	pVdhF/t4GYD6IqzlTCzmgUZ4coSTceTaPPCJl+laOQQlpbWy0pUaWoYaIzNRlRhPW8887z5M4Ni0A
	xNgW99Da/N3IjWoYjGFGAukbATdFa1ZqREiMxKA2Xyi95raHtTJ3EEZg+9n8c6q9XvO48VSldFn4h
	+XZG94CJJyyUusgRTfKL2IiVCJlAShQ9m3JqMzGiNR9SqqYds5rw6K7AeFbgiRE5MEcznbXpxqkbg
	hA9Mhahm8MX7awR5iYgZcBrb5WUnHRt5ZBpehm5Ys71czgCFJrAFpM1hRmAoY7BgBhSbVxpYQuUZ2
	5TudQBwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgXW-000000095Be-0gg8;
	Wed, 18 Nov 2026 14:21:34 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTgXR-000000095AF-0L0h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 14:21:32 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5526d794e;
	Wed, 18 Nov 2026 22:21:20 +0800 (GMT+08:00)
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
Subject: [PATCH] gpio: aspeed: Fix potential coprocessor bank map leak
Date: Wed, 18 Nov 2026 22:21:19 +0800
Message-ID: <20261118-324f82bd41-gpio-aspeed-0@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1ef08970203a1kunma113d6ec1a11e7
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGhlDVk9JQk5IHkpDS0IeHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=SJqmsQ0uS+5cKunv2Q1gw3yeNHJ31mxKPRdWXq42AJzPd8YIz2EVvhnTxBVEcxUfVaTPpWWa4ycF5OoU6bX9WixaC5ZQsjaZuLFRNZRto9hgJnPvL51ERYHphi3h/5Cc74atzmTdvvdHfxkp5HtkOusdvtPWu0TCavL3cOxlgso=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=nFXqbRa1OhelbFVhcjizOVyRIMqDJEhst38NtKslZYw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_062129_591035_3380A9BE 
X-CRM114-Status: GOOD (  10.62  )
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

Register a cleanup action before adding the GPIO chip, so removal frees
the map after removing the chip and before freeing its owner.

This issue was found by our static analysis tool under development.

Fixes: a7ca13826e47 ("gpio: aspeed: Add interfaces for co-processor to grab GPIOs")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/gpio/gpio-aspeed.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index dc53b2decb66..bb30bbf8c60b 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -1300,6 +1300,13 @@ static const struct of_device_id aspeed_gpio_of_table[] = {
 };
 MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
 
+static void aspeed_gpio_free_copro_bankmap(void *data)
+{
+	struct aspeed_gpio *gpio = data;
+
+	kfree(gpio->cf_copro_bankmap);
+}
+
 static int aspeed_gpio_probe(struct platform_device *pdev)
 {
 	struct gpio_irq_chip *girq;
@@ -1364,6 +1371,10 @@ static int aspeed_gpio_probe(struct platform_device *pdev)
 				gpio->config->llops->reg_bank_get(gpio, (i << 5), reg_rdata);
 	}
 
+	rc = devm_add_action_or_reset(&pdev->dev, aspeed_gpio_free_copro_bankmap, gpio);
+	if (rc)
+		return rc;
+
 	if (gpio->config->llops->privilege_init)
 		gpio->config->llops->privilege_init(gpio);
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

