Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BE7606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 08:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jnt3Z29R;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=cnSjooVO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=f5BoHCYmI3AueGUF8gtZThk/HSnjp4gpzVbfV1gUkLc=; b=Jnt3Z29RxPp6TdUZk8bm8YqMeK
	NWKBLKlXUSAZx94UikQ3GZNHE16KZTTSv5eQ8Zv1c2m86sA7x2WEy6xq8zZbYc3iHLSz6zlUI8k3p
	NHY7llgZaKd+R0Vtt1yRP1E/Nnxg5J33MWtx8UWGrctPHjSL73M4N2+kbFi2kgTUQUZXQldPubstY
	LKYMLFpLMgSBs0QEJmgAe5eq5P0jlKnJiHOeSZ6SMZ6lEuTut24t+mS9P6BQxTbLTBfFds12yQO6p
	Xf49xwpWXGE33pkc5YXOpfCAPQiuNtQJQMFwmStOynz7Kl5kgEg5r/oJaTWytEyV/3kejtMP5gk9G
	Jgxs8zCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUol-0000000COK1-0CeY;
	Thu, 26 Nov 2026 08:26:59 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUoe-0000000COHL-3ftk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 08:26:57 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 561726936;
	Thu, 26 Nov 2026 16:26:49 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	arnd@arndb.de,
	krzk@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: nuvoton: Manage MA35D1 mux clocks with the controller
Date: Thu, 26 Nov 2026 16:26:48 +0800
Message-ID: <20261126-a35bb25eb5-u10-0@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa216f6e77703a1kunm282c61bd3c2aef
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSUhPVkMZHh4dT0gfGEIfQlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=cnSjooVOuMpS5jSUAo2Q5Hrqdg//m1kQY4FuXYpcCxIbDlRanWJf7LgpXmz1eP7q+UciBNoy2BXvf/nZSY2FfvIbeHt42SsTCfTs326fcVJpN5S4XtJUEU6qU8+hZQoMedXGctyOSKKoyY6RQFd8DdyGTr1DeDbizfQoV2oGsqA=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=f5BoHCYmI3AueGUF8gtZThk/HSnjp4gpzVbfV1gUkLc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_002654_922613_AE271C66 
X-CRM114-Status: UNSURE (   7.75  )
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

The MA35D1 muxes remain registered after the platform device releases
their register mapping. Use managed registration so both mux helpers
unregister their clocks before the registers are unmapped.

This issue was found by our static analysis tool under development.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/clk/nuvoton/clk-ma35d1.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index e95f72bb8103..4428556b64ad 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -380,9 +380,9 @@ static struct clk_hw *ma35d1_clk_mux_parent(struct device *dev, const char *name
 					    const struct clk_parent_data *pdata,
 					    int num_pdata)
 {
-	return clk_hw_register_mux_parent_data(dev, name, pdata, num_pdata,
-					       CLK_SET_RATE_NO_REPARENT, reg, shift,
-					       width, 0, &ma35d1_lock);
+	return devm_clk_hw_register_mux_parent_data_table(dev, name, pdata, num_pdata,
+							  CLK_SET_RATE_NO_REPARENT, reg, shift,
+							  width, 0, NULL, &ma35d1_lock);
 }
 
 static struct clk_hw *ma35d1_clk_mux(struct device *dev, const char *name,
@@ -390,9 +390,9 @@ static struct clk_hw *ma35d1_clk_mux(struct device *dev, const char *name,
 				     const struct clk_parent_data *pdata,
 				     int num_pdata)
 {
-	return clk_hw_register_mux_parent_data(dev, name, pdata, num_pdata,
-					       CLK_SET_RATE_NO_REPARENT, reg, shift,
-					       width, 0, &ma35d1_lock);
+	return devm_clk_hw_register_mux_parent_data_table(dev, name, pdata, num_pdata,
+							  CLK_SET_RATE_NO_REPARENT, reg, shift,
+							  width, 0, NULL, &ma35d1_lock);
 }
 
 static struct clk_hw *ma35d1_clk_divider(struct device *dev, const char *name,

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.43.0


