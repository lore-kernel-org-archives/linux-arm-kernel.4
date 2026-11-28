Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D585606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 09:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PgtZ1p8m;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=bD2JkDZw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ysEkKO3Bvn0nWC50XbFJHfuTl9LT3CnMuavi4PnMQk0=; b=PgtZ1p8mtC5oFAOmbQoxXwEPVD
	EXZo8Z+GgeEu2DOqixh3DbIf9qiKlKj13xNqtvmcsJxHlLqEBkxv9BqUsaFdGKQd+XIsukc1tEr5h
	HjnA2GhvQc2oEsdE1Kw13VUOXI5OoXpM3IqczoLJ2uCPgkK/8+9nTSCFcvgbCtPbJDH7DrfxF5azK
	ieUcPqbIO8+TgLGdF/DB4jAcYFCVuOKOWqxf9wkQOQYPqcuCcLAC89e4wNdJpruo34jNzvFnTZmEp
	xS5DCgJ7a5pkSZpkROJX7enAtiT0V3RTfo0kYRaTqgcDt0K1W9t4kdYAnhpKkLupUYb+Y20moE6kd
	+6uZ1aQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXF0s-00000000cJo-47sv;
	Sat, 28 Nov 2026 09:46:35 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXF0m-00000000cEy-2WJh
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 09:46:30 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b0890;
	Sat, 28 Nov 2026 17:46:25 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	nobuhiro.iwamatsu.x90@mail.toshiba
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: visconti: Fix potential use-after-free of provider data
Date: Sat, 28 Nov 2026 17:46:24 +0800
Message-ID: <20261128-f81b700d6c-u18-0@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa2218c806203a1kunmdccba7b545213a
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHkpJVkxISE5OH0wZGh4YT1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=bD2JkDZwvDBpvp8BsZ0KvDXsQhjFXHGIdt4fw+UVzAKPmotki+u/thK7U5yRrsjd0K3Aq/PqoW9N8yuherv0tQqZkZO4HyqH2zrK637GXjDg8VC3Sgcru1bZmnFOxGf24ze+2d8fk9mEPMSkRz0QauD3Fhm7L3ygMu27pPdPa0s=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=ysEkKO3Bvn0nWC50XbFJHfuTl9LT3CnMuavi4PnMQk0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_014628_941930_F2BB0F0B 
X-CRM114-Status: UNSURE (   8.92  )
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

Unbinding the clock driver frees its managed onecell data without
removing the OF clock provider. A subsequent clock lookup can access
that freed data.

Use managed provider registration to remove it before freeing the data.

This issue was found by our static analysis tool under development.

Fixes: b4cbe606dc36 ("clk: visconti: Add support common clock driver and reset driver")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/clk/visconti/clkc-tmpv770x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/visconti/clkc-tmpv770x.c b/drivers/clk/visconti/clkc-tmpv770x.c
index 1e2e8d6437fe..df5196f11219 100644
--- a/drivers/clk/visconti/clkc-tmpv770x.c
+++ b/drivers/clk/visconti/clkc-tmpv770x.c
@@ -347,7 +347,8 @@ static int visconti_clk_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	return of_clk_add_hw_provider(np, of_clk_hw_onecell_get, &ctx->clk_data);
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+					 &ctx->clk_data);
 }
 
 static const struct of_device_id visconti_clk_ids[] = {

base-commit: d8f05ec001e838cdb94fc14efa7c411e676f9ab9
-- 
2.43.0


