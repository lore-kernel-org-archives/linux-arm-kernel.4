Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569CB606BD88
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 10:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VF8B6iFR;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=k967YDOy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=maBUpjo3g0KZFtGYzIJqew6LPOZ23uD7gqeYdMcjDLU=; b=VF8B6iFRKXZgt9
	dlq97qUjPeZNygqrlp9wt9lORX7qfnVI1ETpyVxuH0wrT46pvwJJSlqBOppkEtfHs0M8jbmJf7hwV
	XhS369yLn7dqAZRuVbtz8KtsvMLnD7lDAB9OZj0deRJQfJ2k5T9zYyU4TzOV+fxSMlxMzsnoFjoP5
	RzQaDaNZ5NFah+Phyq6myu4d8QuHQTRZLfcK23iJwDEQ1tdiTSsQ9DKpdo5QyRU/5WWbuzrRycjGo
	o7pl9SlxlGoHAt2/Qi2NriGalkZs+VectjjneqdiLt3m4Z2c9TBlFdIJ6FGJi61PpZ0EP1x8umOND
	earTr337SUHmPmyVD0ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRovc-0000000CQDk-46iy;
	Fri, 13 Nov 2026 10:54:45 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRova-0000000CQCz-23J3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 10:54:43 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20261113105440epoutp02b88862e0418b84df384c741ed8a3fe18~nlW7uLrtI0749907499epoutp02Z
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 10:54:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20261113105440epoutp02b88862e0418b84df384c741ed8a3fe18~nlW7uLrtI0749907499epoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794567280;
	bh=maBUpjo3g0KZFtGYzIJqew6LPOZ23uD7gqeYdMcjDLU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k967YDOynOs5q+qTUYvdIT1strVqrEfz9CK9q+ZaBNiBLttKLgFh7nDNcDEawf2VC
	 fX4nUn+mtxZo18PiW0OwfYBD/3pFet5vPvwEFbe5SzX+w62RaepQU6OboAhhH2qyu0
	 l/7P2RyDiv6AjpfcZrBxTPlGGpUwiSTkrPTFIR1I=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20261113105439epcas5p4247ef2ea76494e3b06bdd51a6c346821~nlW7K2_JM0195101951epcas5p45;
	Fri, 13 Nov 2026 10:54:39 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.90]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4jQvKB3qxLz3hhTB; Fri, 13 Nov
	2026 10:54:38 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20261113104904epcas5p1546fd543fad42a61f1a70d4fd55ac833~nlSC6VPUQ1962219622epcas5p1F;
	Fri, 13 Nov 2026 10:49:04 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261113104901epsmtip2f65f7a35aa6da8d4c5dd619b875a2007~nlSAOTIAn2220522205epsmtip2M;
	Fri, 13 Nov 2026 10:49:01 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v3 12/14 RESEND] arm64: dts: exynos8855: add cmu_peris clock
 DT nodes
Date: Fri, 13 Nov 2026 16:36:10 +0530
Message-Id: <20261113110612.3265841-13-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113110612.3265841-1-raghav.s@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261113104904epcas5p1546fd543fad42a61f1a70d4fd55ac833
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261113104904epcas5p1546fd543fad42a61f1a70d4fd55ac833
References: <20261113110612.3265841-1-raghav.s@samsung.com>
	<CGME20261113104904epcas5p1546fd543fad42a61f1a70d4fd55ac833@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_025442_911962_79FB5BE0 
X-CRM114-Status: GOOD (  11.98  )
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

Add required dt node for cmu_peris block. Also add sysreg_peris node.
sysreg_peris contains DRCG SFRs bits which are used in clock driver.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos8855.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
index 2e5dc79d66bc..b461de6a7548 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
@@ -146,6 +146,27 @@ soc: soc@0 {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x20000000>;
 
+		sysreg_peris: syscon@10020000 {
+			compatible = "samsung,exynos8855-peris-sysreg",
+				      "syscon";
+			reg = <0x10020000 0x10000>;
+			clocks = <&cmu_peris CLK_GOUT_SYSREG_PERIS>;
+		};
+
+		cmu_peris: clock-controller@10030000 {
+			compatible = "samsung,exynos8855-cmu-peris";
+			reg = <0x10030000 0x10000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>,
+				 <&cmu_top CLKCMU_DOUT_PERIS_GIC>,
+				 <&cmu_top CLKCMU_DOUT_PERIS_NOC>;
+			clock-names = "oscclk",
+				      "gic",
+				      "bus";
+			samsung,sysreg = <&sysreg_peris>;
+		};
+
 		gic: interrupt-controller@10200000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.34.1


