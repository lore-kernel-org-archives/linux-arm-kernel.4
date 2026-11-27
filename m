Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0BF606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0DEtbkey;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=cehcGGpt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nceqd0TOBeVuB+r1NM/sieYkJrmVjiu9YO8R74BAOow=; b=0DEtbkeyaZGWu3SwP+FiHFkr8D
	VfWSPHMUHHMYY5BcZp5/aLrAhgt+7XyYc5PZ6cUdTYl+xNwUxdOP8LWEXzNfV+l4BxEz9PCeKgUKg
	s1Jp1RwRUYtOytn4QD93u2qOrIoYV6TUulTbIzhEpD9Z96Z17pzLuYKcDrbYEqILhd2fNi7aE2ElY
	wRJmuNV/lYWztjIt4fH9YN0ZKGkYFvUUJHHeFU90YQAVhuJj+qaQa/rB1dRS+FwviwonDQeSiUx0F
	z0WM9Hw8xXwxlVjDpWDGAz4WdVf7IvCf9z0Byn+wXjhx1H3YuP3mADzmsWOAciEXivL8p84CP7cYK
	J/1BlyEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuD6-0000000FpYz-2EZf;
	Fri, 27 Nov 2026 11:33:48 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWuCt-0000000FpLq-1Tjr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:33:36 +0000
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 564299832;
	Fri, 27 Nov 2026 19:33:31 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: linusw@kernel.org,
	brgl@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	anson.huang@nxp.com
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-gpio@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] gpio: mxc: Register syscore callbacks after the platform driver
Date: Fri, 27 Nov 2026 19:33:31 +0800
Message-Id: <20261127113331.390479-1-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa21cc8323703a2kunm52c51fe4395df4
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaHksZVkoaHR8eSU4eQxgaGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=cehcGGptb2b5SNz7ywjGGKHtrOzKN6+BFSYiauFNCgmlCDoBZqIN+QNOZXLwXAWYrvGXX16xstqS77Aa1fooncCn0NgK7B3Hz3Cov7VcdZG7ISvH4TCLjc7QEt6IB+HpSF+N0qRoEgvNvN1DsG1vN/ggXaVutB3cO6MguatQv2s=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=nceqd0TOBeVuB+r1NM/sieYkJrmVjiu9YO8R74BAOow=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_033335_635608_6935A5AA 
X-CRM114-Status: UNSURE (   9.90  )
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

If platform driver registration fails, module initialization returns an
error with the syscore callbacks still registered. Register the
callbacks only after the driver has been registered successfully.

This issue was found by our static analysis tool under development.

Fixes: 1a5287a3dbc3 ("gpio: mxc: move gpio noirq suspend/resume to syscore phase")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/gpio/gpio-mxc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 7dabe8073dc6..ed79ce76dcf3 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -738,9 +738,14 @@ static struct platform_driver mxc_gpio_driver = {
 
 static int __init gpio_mxc_init(void)
 {
-	register_syscore(&mxc_gpio_syscore);
+	int ret;
 
-	return platform_driver_register(&mxc_gpio_driver);
+	ret = platform_driver_register(&mxc_gpio_driver);
+	if (ret)
+		return ret;
+
+	register_syscore(&mxc_gpio_syscore);
+	return 0;
 }
 subsys_initcall(gpio_mxc_init);
 

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.43.0


