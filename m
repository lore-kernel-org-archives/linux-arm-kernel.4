Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B609606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l55e0aHT;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=ABj34+wJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gCtGhq9P7tW1GiFE7NIYAi8YyT5YW4iM+dluafv6q8Q=; b=l55e0aHT6Wl89VITHCyVVj6G6s
	FC0Pv/0QkEaRAecuRUkJDv/EtuU9d4XnTzr7f8NFZzvPWCXBXP8VTaSgKyCmYixzsh2FivkGwy6xE
	Oe+htfgNOOHivYYIwEPLBdeqoyA5+trhcBfhoAei8BW9t65vScva9zLLgdtgH0KlHoUxMzivFhpM6
	052T2ZijgCERo/8GMMTUYmlLpa7XqpKNU2vDab9FaajiTqfcYXzn2UGslpasIPYAqSU1BieutftLb
	SX5Z2yZXYXfiVUjFi2n5Sqd8Yxuk8IHkxUX08ZqnBmak90Dj2ePIVGYHGZX7KHpFduacPLjU61UpP
	FGGiQY8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuD2-0000000FpUR-1fbC;
	Fri, 27 Nov 2026 11:33:44 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuCr-0000000FpKz-2uxO;
	Fri, 27 Nov 2026 11:33:34 +0000
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 564299830;
	Fri, 27 Nov 2026 19:33:30 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: linusw@kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	nsaenz@kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pinctrl: bcm2835: Use managed GPIO chip registration
Date: Fri, 27 Nov 2026 19:33:29 +0800
Message-Id: <20261127113329.390439-1-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa21cc82c0c03a2kunmad7a1b5e395de6
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHk1KVklDGR1DT05JGk9NQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=ABj34+wJctM5FpWjdxVRnlE/k9QYOxcmdzwqbz87tYy9g47vBBeV/ELQme4np/Az5dR8tK5o/jzIBdH2YjH/ynb1bxzQsqyeEn4hhoZP4YwgS3m8HGrhHaY9Ys5ygQr/qb6nLsvHYbQzbM2+A26aA3m/CBkqpJTdbkw/4apDUrQ=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=gCtGhq9P7tW1GiFE7NIYAi8YyT5YW4iM+dluafv6q8Q=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_033333_956999_C735A075 
X-CRM114-Status: UNSURE (   8.41  )
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_LOCAL_DIGITS,
	FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

Module removal releases the managed pinctrl context but leaves its
GPIO chip registered. The chip and its IRQ callbacks can then reference
freed storage.

Manage GPIO registration so the chip is removed before its resources
are released.

This issue was found by our static analysis tool under development.

Fixes: 4434f4c50345 ("pinctrl: bcm2835: Allow building driver as a module")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index c155af38ab81..9184ef13038d 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -1421,7 +1421,7 @@ static int bcm2835_pinctrl_probe(struct platform_device *pdev)
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_level_irq;
 
-	err = gpiochip_add_data(&pc->gpio_chip, pc);
+	err = devm_gpiochip_add_data(dev, &pc->gpio_chip, pc);
 	if (err) {
 		dev_err(dev, "could not add GPIO chip\n");
 		goto out_remove;

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.43.0


