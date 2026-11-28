Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE1C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 10:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4QkMAc2p;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=gCagrhta
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LdOdnNp80lpQwHfGFbDptzi6TOVJcdWug3BPeKjkwAo=; b=4QkMAc2p93ue+X
	kJMj/Xa0AhuwnQRfFxpS/ZbXtjRsWl/zyqw8JmNLTOYbeHi7J9BE2Dxv41/I0NJhDbdUyGA4gv3PA
	C/jmdzDUusB3mWy40DrMIhAXoaHttFPkaaqmuvMGydPvlCNwHDfE3Je0Xm6IeWXhU07O5UbirNL1I
	v8RBu1RTTf/npluW9FxWJlmR+pKmAglI5EoWEDFCJq+qJmbrA9blnUP7PnDzXIwlq8NJIghn/RF6P
	qgxWJ9ZwiVTS7exgwfFNVQj6B1EbxSeqk5pdR2IDrwE26okGJ1VJnGPRwkPrusqQIeSrieSVlWnXl
	BR3x7tsJeJzQb6zi++Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEzG-00000000bno-308R;
	Sat, 28 Nov 2026 09:44:54 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEz3-00000000bkk-0aFr;
	Sat, 28 Nov 2026 09:44:43 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b083e;
	Sat, 28 Nov 2026 17:44:36 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	mturquette@baylibre.com,
	eric@anholt.net,
	swarren@wwwdotorg.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] clk: bcm2835: aux: Fix potential use-after-free on unbind
Date: Sat, 28 Nov 2026 17:44:35 +0800
Message-ID: <20261128-f81b700d6c-u05-1@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128-f81b700d6c-u05-0@mail.sdu.edu.cn>
References: <20261128-f81b700d6c-u05-0@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa2218ad4ed03a1kunmb78794ce451fda
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTUIeVkgYHhlNTE4aGUkeTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=gCagrhtasHzoAaHhmB/8UIk2esjZnrt22Qq8mW8h/Wz9/xF6k9gxRUQhcpmc/FCg83GsDmeiTYWvUyzH+lJL70M+DMD0KH0Cy67drRD5jihDiYcsYmwWNkjKhKffX9Ca6A/y8LlQwvwNFgcSV9HwVZsKJ/L0iGBYC9ij85xp9hQ=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=LdOdnNp80lpQwHfGFbDptzi6TOVJcdWug3BPeKjkwAo=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_014441_468839_C8B7F554 
X-CRM114-Status: UNSURE (   9.50  )
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

The OF clock provider remains registered when the driver is unbound,
although its onecell data is released by devres. A later clock lookup
can access that freed data.

Manage the provider so it is removed before its data is released.

This issue was found by our static analysis tool under development.

Fixes: 5e63dcc74b30 ("clk: bcm2835: Add a driver for the auxiliary peripheral clock gates.")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/clk/bcm/clk-bcm2835-aux.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/bcm/clk-bcm2835-aux.c b/drivers/clk/bcm/clk-bcm2835-aux.c
index 351a63e5cdfc..0b0bb35f3f84 100644
--- a/drivers/clk/bcm/clk-bcm2835-aux.c
+++ b/drivers/clk/bcm/clk-bcm2835-aux.c
@@ -45,8 +45,7 @@ static int bcm2835_aux_clk_probe(struct platform_device *pdev)
 	onecell->hws[BCM2835_AUX_CLOCK_SPI2] =
 		clk_hw_register_gate(dev, "aux_spi2", parent, 0, gate, 2, 0, NULL);
 
-	return of_clk_add_hw_provider(pdev->dev.of_node, of_clk_hw_onecell_get,
-				      onecell);
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, onecell);
 }
 
 static const struct of_device_id bcm2835_aux_clk_of_match[] = {
-- 
2.43.0


