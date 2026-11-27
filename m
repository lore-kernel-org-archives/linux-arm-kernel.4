Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A56606A321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 11:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XmqPVwaH;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=W7Ka+ecY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ds4sm9si83a81aIQG4knnSuuijkX5GS60QybAJGIn3Y=; b=XmqPVwaHc/L8aM
	BX3ajM7/+lI3+K52o8Xn3g1in7vS7IioHtM91PF6JuuNPCxMtHLaCgrkktKX4W8jGOC0DtLtxeF0J
	MjLUv2FZ7OpvAsDH7b11y9NyW/llzrhgpoAtAsv9G9pCCGbBfKpEZuC8upgfq9G2sSkdc+RdtyckW
	+u0lbn4EReptdHrA3ukmDk14P46iZBygKJQoKSSCdz92zIYHyArRAODPP3owQDwjx76ydVlxL355u
	CoL+HFHnPSpnbxb9zvDV93VZLcFAeOoDqlZwscwMo0pQs+z5/Z7oweuKlEfAe/AQrkWrcZ3LRegQk
	fiwPVjqEUReMr211980Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtkR-0000000FjEF-3Zis;
	Fri, 27 Nov 2026 11:04:11 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWtkN-0000000FjBu-06ot
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 11:04:11 +0000
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5641a2c39;
	Fri, 27 Nov 2026 19:04:02 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	Frank.li@oss.nxp.com,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vz@mleia.com,
	piotr.wojtaszczyk@timesys.com,
	manabian@gmail.com,
	robh@kernel.org,
	saravanak@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/3] dmaengine: of: Add managed DMA router registration
Date: Fri, 27 Nov 2026 19:03:58 +0800
Message-Id: <20261127110400.379397-2-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261127110400.379397-1-202300460064@mail.sdu.edu.cn>
References: <20261127110400.379397-1-202300460064@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa21cad339203a2kunm13da2c70394a81
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSRkeVk8dTRgfSUlJHk1IHlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=W7Ka+ecYvyw4V8c6uiTg2flQXAlY6YfUwjGS2RAdLmNEwTFsjVqeKUHR5sXB63kdRAfIOZzTtf1NPxHcGFi0Aezp4k+14h6iAKuivYneUMXUKDj+sBzKhbtZA4yOmJIdE/9WE33hkpCwmrXQV7+ft5jGLChKhbB3wCOuQtrG8MY=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=ds4sm9si83a81aIQG4knnSuuijkX5GS60QybAJGIn3Y=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_030409_444607_86442F02 
X-CRM114-Status: UNSURE (   8.27  )
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

Add devm_of_dma_router_register() to unregister a router when its
device is detached. Reuse the controller cleanup action, since routers
share the same OF registry. If registering the cleanup action fails,
remove the newly registered router immediately.

Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
Changes in v2:
  - Add the reusable managed router helper.

 include/linux/of_dma.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/linux/of_dma.h b/include/linux/of_dma.h
index 16b08234d03b..7f9198ea9627 100644
--- a/include/linux/of_dma.h
+++ b/include/linux/of_dma.h
@@ -64,6 +64,21 @@ extern int of_dma_router_register(struct device_node *np,
 		struct dma_router *dma_router);
 #define of_dma_router_free of_dma_controller_free
 
+static inline int
+devm_of_dma_router_register(struct device *dev, struct device_node *np,
+			    void *(*of_dma_route_allocate)
+			    (struct of_phandle_args *, struct of_dma *),
+			    struct dma_router *dma_router)
+{
+	int ret;
+
+	ret = of_dma_router_register(np, of_dma_route_allocate, dma_router);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, __of_dma_controller_free, np);
+}
+
 extern struct dma_chan *of_dma_request_slave_channel(struct device_node *np,
 						     const char *name);
 extern struct dma_chan *of_dma_simple_xlate(struct of_phandle_args *dma_spec,
@@ -103,6 +118,15 @@ static inline int of_dma_router_register(struct device_node *np,
 
 #define of_dma_router_free of_dma_controller_free
 
+static inline int
+devm_of_dma_router_register(struct device *dev, struct device_node *np,
+			    void *(*of_dma_route_allocate)
+			    (struct of_phandle_args *, struct of_dma *),
+			    struct dma_router *dma_router)
+{
+	return -ENODEV;
+}
+
 static inline struct dma_chan *of_dma_request_slave_channel(struct device_node *np,
 						     const char *name)
 {
-- 
2.43.0


