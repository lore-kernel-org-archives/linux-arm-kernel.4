Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314A360A6F48
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iNZYLoTs;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=rRDNizMD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+NP2Sc9QfAH27QKUaoXkjp0qHnyNnKKBhYsb0OsmWbM=; b=iNZYLoTsSHTqG8
	r/i6Z6ChU3dq4WurIiLQa+bWPdxHgQu0q0B54A0NNVkxS2GCsUyyUyf6LT1hGytZ3jRw1ZkNdsPnn
	Aqr4c8MLEV/F54thO3XwRok0dUHJ3N9mCUY70DNzc59IxFy9FEMXlmUvVqhI+rmi/MMZQbdkDVAxn
	WkmArIZqes1XyZvZxN+WdMRIVH3nPam6Djha4OXCel2SZus4oGHHg0kZNWnRwyaYNAQm3R/jG4zf5
	5Hu53639WuzbvYQI+8mEBEoTHNKzt6ibdmz4iDKVsPaF4QTF5hLKng98IWLRCr0FguLLkT5xiVMA0
	NIisYTrNXRgKkTya7Prw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRouj-0000000CQ00-23gZ;
	Fri, 13 Nov 2026 10:53:49 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoug-0000000CPzV-0LbB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:53:47 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261113105343epoutp02653c2e5f9c6758bc5a6a82b76d19546f~nlWGml8Af0752407524epoutp025
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:53:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261113105343epoutp02653c2e5f9c6758bc5a6a82b76d19546f~nlWGml8Af0752407524epoutp025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794567223;
	bh=+NP2Sc9QfAH27QKUaoXkjp0qHnyNnKKBhYsb0OsmWbM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rRDNizMDhuC0YrE80JfrzGWKuj4stjsLCQYyetT1AIWQm59bTMUMusplHw5J6vc3r
	 cmhT9kpSisjzrLaG/r3G3jNBNgyp9YDs//BziIf/ELYlyFnlgO7qY4MyJxArpW+0xF
	 DYGwjpxl+9FZH61zWvBLAXqCBsvTPNihLZLsiWQQ=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20261113105342epcas5p23b9906156baf48daf6def2360cc7a3de~nlWFu0ori1645616456epcas5p2Z;
	Fri, 13 Nov 2026 10:53:42 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.95]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4jQvJ53n0Qz2SSKX; Fri, 13 Nov
	2026 10:53:41 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20261113104847epcas5p1d970255218f1ca78b19690bfd097f303~nlRy0o_DM0455004550epcas5p1g;
	Fri, 13 Nov 2026 10:48:47 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261113104844epsmtip2f002bc3207e882b2bbec4d82de94f3f1~nlRwQ9dOK2503625036epsmtip2I;
	Fri, 13 Nov 2026 10:48:44 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v3 06/14 RESEND] clk: samsung: clk-pll: Add support for
 pll_4313
Date: Fri, 13 Nov 2026 16:36:04 +0530
Message-Id: <20261113110612.3265841-7-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113110612.3265841-1-raghav.s@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261113104847epcas5p1d970255218f1ca78b19690bfd097f303
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261113104847epcas5p1d970255218f1ca78b19690bfd097f303
References: <20261113110612.3265841-1-raghav.s@samsung.com>
	<CGME20261113104847epcas5p1d970255218f1ca78b19690bfd097f303@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_025346_461663_A32321D2 
X-CRM114-Status: GOOD (  17.84  )
X-Spam-Score: -4.4 (----)
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

From: Alim Akhtar <alim.akhtar@samsung.com>

PLLs 4313 are found in the Exynos8855 SoC and it is similar
to pll_531x except for CON8 offset, so re-using code for
pll_4313

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 drivers/clk/samsung/clk-pll.c | 11 ++++++++++-
 drivers/clk/samsung/clk-pll.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 3d837bd74355..7b0756127306 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -1306,7 +1306,15 @@ static unsigned long samsung_pll531x_recalc_rate(struct clk_hw *hw,
 	u64 mdiv, fout = parent_rate;
 
 	pll_con0 = readl_relaxed(pll->con_reg);
-	pll_con8 = readl_relaxed(pll->con_reg + 20);
+	if (pll->type == pll_4313) {
+		/* Offset for PLL_CON8 which hold FDIV different for PLL_4313
+		 * which is PLL_LOCKTIME_OFFSET - 0x4
+		 */
+		pll_con8 = readl_relaxed(pll->lock_reg - 4);
+	} else {
+		pll_con8 = readl_relaxed(pll->con_reg + 20);
+	}
+
 	mdiv = (pll_con0 >> PLL531X_MDIV_SHIFT) & PLL531X_MDIV_MASK;
 	pdiv = (pll_con0 >> PLL531X_PDIV_SHIFT) & PLL531X_PDIV_MASK;
 	sdiv = (pll_con0 >> PLL531X_SDIV_SHIFT) & PLL531X_SDIV_MASK;
@@ -1729,6 +1737,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_309:
 	case pll_531x:
 	case pll_4311:
+	case pll_4313:
 		init.ops = &samsung_pll531x_clk_ops;
 		break;
 	case pll_1031x:
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 2457cf47c109..4825e1f5b9db 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -49,6 +49,7 @@ enum samsung_pll_type {
 	pll_0718x,
 	pll_0732x,
 	pll_4311,
+	pll_4313,
 	pll_1017x,
 	pll_1031x,
 	pll_a9fracm,
-- 
2.34.1


