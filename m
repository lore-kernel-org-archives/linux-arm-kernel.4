Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58673606A332
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 09:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ebxyVtRv;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=ZU62VlH2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gSyjsmHc8LX/g/eZNAKvONs3IMZTeyCYPd5ojYwnEZY=; b=ebxyVtRvrAPyR+
	6aE2UqSEAN/SQ4WWg4EV3AT1VHKq8n+RgVYW0li5JPDHW4IcJhCvGMVHwJiaxBKnwKEcMOo0mdIrr
	8/AU4k61MMt9etb/hSDuzK4rMoGzVMB8c7CGXKatSu4oX7ROAUVJalkwfn6SNsio+NFOyTW+/sU8i
	ByvpDM3wVf1/At43IsA2gRBph/zu68AEVEVB0i+o/2md/lDDj7BAk1Ozsxjb94DM4PfnI+IXeL3Q6
	H7YSutYgZd+AuIcWXeBRAJpMLJLqTNsreN2ninnMS+zLOhgb9kOOttfgyYLzhR+D0r1ZV4oA8y5yY
	wnITpp6OMiGlFYbaFLiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXF0f-00000000cBS-33xb;
	Sat, 28 Nov 2026 09:46:21 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXF03-00000000bzT-3yJj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 09:45:47 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b0885;
	Sat, 28 Nov 2026 17:45:40 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	m202171776@hust.edu.cn,
	peng.fan@nxp.com,
	dzm91@hust.edu.cn,
	lyx2022@hust.edu.cn,
	zero12113@hust.edu.cn,
	mr.bossman075@gmail.com
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] clk: imxrt1050: Fix potential use-after-free on unbind
Date: Sat, 28 Nov 2026 17:45:39 +0800
Message-ID: <20261128-f81b700d6c-u08-2@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128-f81b700d6c-u08-0@mail.sdu.edu.cn>
References: <20261128-f81b700d6c-u08-0@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa2218bcee803a1kunmf33ff7a74520cc
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTE9KVh5OSkpKHh4eS0pJTlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=ZU62VlH2h4hE9/9zWZXysoJSdpxPrrhnKu0pa+ttn59nFXYcNZaOGZ45Sdg+zs5gQAS67EE4YGTQLO8+RzbVhhrLk0W5Kv/Z8+5rujWLCLCPjRWTq8P8Eaj56HnE/6LzPlM9ea9/jL+O0DY38z3gKG7hq9am9iyGFOb8mJu7snE=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=gSyjsmHc8LX/g/eZNAKvONs3IMZTeyCYPd5ojYwnEZY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_014544_344695_5A5934F9 
X-CRM114-Status: GOOD (  10.84  )
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

The OF clock provider retains the managed onecell data after the
driver is unbound. Subsequent clock lookups can access freed memory.

Manage the provider so it is removed before the onecell data is freed.

This issue was found by our static analysis tool under development.

Fixes: 7154b046d8f3 ("clk: imx: Add initial support for i.MXRT1050 clock driver")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/clk/imx/clk-imxrt1050.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imxrt1050.c b/drivers/clk/imx/clk-imxrt1050.c
index db152c66d66f..28f4534cbeff 100644
--- a/drivers/clk/imx/clk-imxrt1050.c
+++ b/drivers/clk/imx/clk-imxrt1050.c
@@ -150,7 +150,7 @@ static int imxrt1050_clocks_probe(struct platform_device *pdev)
 	hws[IMXRT1050_CLK_DMA_MUX] = imx_clk_hw_gate("dmamux0", "ipg", ccm_base + 0x7C, 7);
 	imx_check_clk_hws(hws, IMXRT1050_CLK_END);
 
-	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_hw_data);
 	if (ret < 0) {
 		dev_err(dev, "Failed to register clks for i.MXRT1050.\n");
 		goto unregister_hws;

-- 
2.43.0


