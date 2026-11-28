Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84E7606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 10:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1MnDpjhh;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Ji7MA//N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hoZoPXQcxdC/nOdJi6eB9NK86MbjG3HjeYJVZIRZ1gw=; b=1MnDpjhhuzZRqq
	d7M7nlsJwA8PcGgl5sMlu56EPfUh88g30GDqWQ3vsXGDMVAd43oUCFazG4lyqfHq05MLYbLShb9Lf
	qjHFjbXG4KP/hzOxrlvR9Ar9Q6cm8bP9rIVmZrT56GQziz+6TPQAkAxN7cTw3rYXIm8Fy+fot0MoO
	abhZq65NlMpqkAKNN4sdGbanc7PEwIRyTd5InTmJtS2AP2rsN0EVO+7irMw0b0ORL6VduXxKJ4X6J
	wmkajonbaEE+0AgnE+qoI6QiiEivwrqbL3ZAR5oOGWVssG/PHEXWdhDHe+khwm0lksWR4SfSUmQHh
	clmZUkHhlMJzJHaaSGIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEum-00000000ajn-3Npw;
	Sat, 28 Nov 2026 09:40:17 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEuX-00000000ag1-3aAn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 09:40:04 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b07cc;
	Sat, 28 Nov 2026 17:39:56 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: emilio@elopez.com.ar,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	hansg@kernel.org,
	bbrezillon@kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 3/3] clk: sunxi: Fix potential use-after-free of APB0 provider data
Date: Sat, 28 Nov 2026 17:39:55 +0800
Message-ID: <20261128-f81b700d6c-u17-3@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128-f81b700d6c-u17-0@mail.sdu.edu.cn>
References: <20261128-f81b700d6c-u17-0@mail.sdu.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa22186904003a1kunmfd893f62451bf0
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaH05CVh1LHhhDT01PS0geGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=Ji7MA//NgQUoSpE+U7M3iwc95L8PClsL5Jetm5R7OYmAZna+Cn+AOfdSgviKMkUuV+6AiC3nH4JCUUukVjxfnJsUsnG6RlN0rxCxeCoPCoRRk1J9nfA1hxQikXhN7QOw5449oYwek4lo3uB3UBfdYVS2W/5ZKwCnwIEvcjbNONY=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=hoZoPXQcxdC/nOdJi6eB9NK86MbjG3HjeYJVZIRZ1gw=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_014002_159649_0E3656CE 
X-CRM114-Status: UNSURE (   8.69  )
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

Unbinding the APB0 gates driver releases its managed onecell data but
leaves the OF provider registered. Later clock lookups can dereference
the released data.

Remove the provider before the managed data is freed.

This issue was found by our static analysis tool under development.

Fixes: c8a76cac19ee ("clk: sunxi: add PRCM (Power/Reset/Clock Management) clks support")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/clk/sunxi/clk-sun6i-apb0-gates.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/sunxi/clk-sun6i-apb0-gates.c b/drivers/clk/sunxi/clk-sun6i-apb0-gates.c
index a10ebd1998fb..9d1fef8c520e 100644
--- a/drivers/clk/sunxi/clk-sun6i-apb0-gates.c
+++ b/drivers/clk/sunxi/clk-sun6i-apb0-gates.c
@@ -87,11 +87,17 @@ static int sun6i_a31_apb0_gates_clk_probe(struct platform_device *pdev)
 	return of_clk_add_provider(np, of_clk_src_onecell_get, clk_data);
 }
 
+static void sun6i_a31_apb0_gates_clk_remove(struct platform_device *pdev)
+{
+	of_clk_del_provider(pdev->dev.of_node);
+}
+
 static struct platform_driver sun6i_a31_apb0_gates_clk_driver = {
 	.driver = {
 		.name = "sun6i-a31-apb0-gates-clk",
 		.of_match_table = sun6i_a31_apb0_gates_clk_dt_ids,
 	},
 	.probe = sun6i_a31_apb0_gates_clk_probe,
+	.remove = sun6i_a31_apb0_gates_clk_remove,
 };
 builtin_platform_driver(sun6i_a31_apb0_gates_clk_driver);

-- 
2.43.0

