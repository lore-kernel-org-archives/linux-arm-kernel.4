Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C84606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 02:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p6ribT+g;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=eFREfpg2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0aqdef+A3S0AoJl+8zueLzbSlQNp6YnEX03i+OBapQ0=; b=p6ribT+g+kJ25bpjOJYHGhMwar
	3AJlfQuQhsIO1ewqLZCg8AQAiLYjYUsYSm3cK8hvbQMXN1iwviZjqJIlRmxnKlC5N8MznyrINPrsW
	zwkjMOuQKX3NUeLsUvSJwWJVh/9nzFFlh9jLSGJf0+OvjM+cElciir46AzPcisYvJLtSO31567LJi
	J8Rws74DVT7h7ISW7fEYLYej5mRhVB1hN10YamjfQwH9UUFbYBQhwaMhz1nGt9gMpprXD84cbhIJh
	817NUjjwZTchp/1mZ1c7IkNf6xPgLmUQ2fEs6lSmlk+ZUvP4GPVjCypMaxHovDGrheKN8VhW5hJcM
	kyZxkJ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8cj-00000004Nd2-0FOo;
	Tue, 17 Nov 2026 02:08:41 +0000
Received: from cmccmta2.chinamobile.com ([111.22.67.135])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT8c0-00000004N4e-3TkQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 02:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=eFREfpg2qx5YE7Ur+HrG3/OnU6r9WX0hwvKsHhNo0FPBVbJeTduUQTPEuvn5LTmrSo70Z1kpV98FA
	 pIpMjOxEgGBIscdnWae3lrdffKBrQzAWZqfPCBnI2FRtD/hOUvXU+txAvBqHKzsNxy4SyLksuq4joL
	 z6jcr4KjzB3Ke2cw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36afbb6f3298-cffaf;
	Tue, 17 Nov 2026 10:07:48 +0800 (CST)
X-RM-TRANSID: 2ee36afbb6f3298-cffaf
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66afbb6f3de6-9f0f5;
	Tue, 17 Nov 2026 10:07:48 +0800 (CST)
X-RM-TRANSID: 2ee66afbb6f3de6-9f0f5
From: Luo Yifan <luoyifan@cmss.chinamobile.com>
To: Russell King <linux@armlinux.org.uk>,
	linux-mmc@vger.kernel.org
Cc: Ulf Hansson <ulfh@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] mmc: mmci: handle clk_prepare_enable() failure on runtime resume
Date: Tue, 17 Nov 2026 10:07:51 +0800
Message-Id: <20261117020751.20250-1-luoyifan@cmss.chinamobile.com>
X-Mailer: git-send-email 2.24.4
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_180804_532800_C650E187 
X-CRM114-Status: GOOD (  11.19  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mmci_runtime_resume() ignores the return value of clk_prepare_enable()
and then calls mmci_restore(), which writes to the controller registers.
If the clock cannot be enabled, the restore runs with the clock off and
the PM core never learns that the resume failed.

Return the error before touching the controller.

Signed-off-by: Luo Yifan <luoyifan@cmss.chinamobile.com>
---
 drivers/mmc/host/mmci.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
index f5ee793dda..16c8cf57fd 100644
--- a/drivers/mmc/host/mmci.c
+++ b/drivers/mmc/host/mmci.c
@@ -2578,7 +2578,12 @@ static int mmci_runtime_resume(struct device *dev)
 
 	if (mmc) {
 		struct mmci_host *host = mmc_priv(mmc);
-		clk_prepare_enable(host->clk);
+		int ret;
+
+		ret = clk_prepare_enable(host->clk);
+		if (ret)
+			return ret;
+
 		mmci_restore(host);
 		pinctrl_select_default_state(dev);
 	}
-- 
2.24.4




