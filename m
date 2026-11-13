Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60411606C900
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xiU1ALMO;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=opy3G873
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=erFYt3v+QSuQ7rGTo+dYGddg5732pLpZexzaOVFDdxw=; b=xiU1ALMO5/K0lu
	sPXSTFm/3/2yVhf/kJ84WYrc10v/Z9kmtELashAhEe22BAsv5WFsxEgRDmRFWi7YIAU/BMHvBk+3e
	/JdFtV3bWU2NpinEga37+8LzStYzUdOvpcsW58NEXLMrsbsyUtA35aq8v7sRDXKIIbcDbP17xb4ZW
	XlyGdxkw9YU00gbACCBDy/V/OsHd5DZD9Ego12D6dl9mufftljfA4TB2fSIx7Z0iOEjI11Ih2Elf7
	zp7rjkMjyOouAtZaaI8C41uR/1mdaS6vy7P0pFzEEfRxnXQ6iWViT6XjafMBgZH/z7/NgolMvOQJT
	fE1hXzSlSKThZUhA2A0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoz1-0000000CRB8-2Xm7;
	Fri, 13 Nov 2026 10:58:15 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoyt-0000000CR64-1yGO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:58:10 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261113105803epoutp02a309e2f6a5f2422cbfc744fb32a004d6~nlZ5P8qfo1351713517epoutp021
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:58:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261113105803epoutp02a309e2f6a5f2422cbfc744fb32a004d6~nlZ5P8qfo1351713517epoutp021
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794567483;
	bh=erFYt3v+QSuQ7rGTo+dYGddg5732pLpZexzaOVFDdxw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=opy3G873sZF9JiotAYpXM6jLtSFOaFYb4Gp3ydBgN9lxBi834bJkG+INdp8+3j4W9
	 EMrB+NoLBoLjIOqmgLsIBk+U4LtzKIP5DvDGhacbc1GP7mn07a5IH118ftzaPaJzsS
	 lxFoupAI7UBMlX1unMrl9SVQeFpJJm80fESg83xk=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20261113105803epcas5p23ed9f3d31f3f821508cb942a7b3aa00a~nlZ4zTk3l1894418944epcas5p2x;
	Fri, 13 Nov 2026 10:58:03 +0000 (GMT)
Received: from epcpadp2new (unknown [182.195.40.142]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4jQvP71MqKz2SSKX; Fri, 13 Nov
	2026 10:58:03 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20261113104841epcas5p2823126ce22f44cc98fcbdf94403c32e3~nlRtsfACF0610106101epcas5p2t;
	Fri, 13 Nov 2026 10:48:41 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261113104838epsmtip25ae1a5c48af7750b30108a09ab7d028b~nlRqwervP2503625036epsmtip2H;
	Fri, 13 Nov 2026 10:48:38 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 04/14 RESEND] dt-bindings: clock: exynos8855: add hsi
 clock definitions
Date: Fri, 13 Nov 2026 16:36:02 +0530
Message-Id: <1771243284.81794567483188.JavaMail.epsvc@epcpadp2new>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113110612.3265841-1-raghav.s@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261113104841epcas5p2823126ce22f44cc98fcbdf94403c32e3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20261113104841epcas5p2823126ce22f44cc98fcbdf94403c32e3
References: <20261113110612.3265841-1-raghav.s@samsung.com>
	<CGME20261113104841epcas5p2823126ce22f44cc98fcbdf94403c32e3@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_025807_851066_C2436E48 
X-CRM114-Status: GOOD (  11.72  )
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

Add device tree clock binding definitions for CMU_HSI

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
 .../dt-bindings/clock/samsung,exynos8855.h    |  8 +++++++
 2 files changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
index 53fc8040e173..21928235d131 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
@@ -28,6 +28,7 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,exynos8855-cmu-hsi
       - samsung,exynos8855-cmu-peric
       - samsung,exynos8855-cmu-peris
       - samsung,exynos8855-cmu-top
@@ -52,6 +53,26 @@ properties:
       Phandle to system registers interface.
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos8855-cmu-hsi
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (76.8 MHz)
+            - description: CMU_HSI NOC clock (from CMU_TOP)
+            - description: CMU_HSI UFS_EMBD clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+            - const: ufs_embd
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/samsung,exynos8855.h b/include/dt-bindings/clock/samsung,exynos8855.h
index 5d8b38a744b5..67cd97d8fab8 100644
--- a/include/dt-bindings/clock/samsung,exynos8855.h
+++ b/include/dt-bindings/clock/samsung,exynos8855.h
@@ -214,4 +214,12 @@
 #define CLK_GOUT_WDT0_PERIS                8
 #define CLK_GOUT_WDT1_PERIS                9
 
+/* CMU_HSI */
+#define CLK_MOUT_HSI_NOC_USER              1
+#define CLK_MOUT_HSI_UFS_EMBD_USER         2
+#define CLK_GOUT_CMU_HSI                   3
+#define CLK_GOUT_SYSREG_HSI                4
+#define CLK_GOUT_UFS_EMBD_ACLK_HSI         5
+#define CLK_GOUT_UFS_EMBD_UNIPRO_HSI       6
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
-- 
2.34.1



