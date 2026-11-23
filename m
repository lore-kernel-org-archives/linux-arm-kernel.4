Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DED9606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 00:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kIxfIwgt;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=opXAUP98
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Quk+i+RLhvm+ITRHRSHRS993N/vU6wVhQmtQekP7shc=; b=kIxfIwgtWbPq71
	+jcAu/oEW/qgegjdcLXykcu40z7s2qZDWJkm+5bMZvYihY60gVjqos2+BJqBRTb2GiYJKQQ88dSn7
	+Qk7749joSQlMK6sj3VUXr7HZbmj9lrI5roKteS9G2Nm+DULErkbJUXRp6O827eeR2Rkco5SJ7ign
	hsJERF+xrPNXUcV9b8Ozdnc39zNdoNYnDbV27I1VJNbFRXWS7lR5ftns6Gd312KOIEuK1lxi2DVMW
	KNIptDYblMirdlPuR9vmis9seiMg8gtMDxpbAtSPgGrOnvuejujVYiazZsB52qIjeH18AYlwbmWY0
	WhCFD3wZ8bPAyljnVwDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVHeC-00000001x5U-0NyO;
	Mon, 23 Nov 2026 00:11:04 +0000
Received: from out203-205-221-239.mail.qq.com ([203.205.221.239])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVHdq-00000001wta-3nBk;
	Mon, 23 Nov 2026 00:10:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795392637; bh=Quk+i+RLhvm+ITRHRSHRS993N/vU6wVhQmtQekP7shc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=opXAUP98ECNIPzHHTYFhcatQkP88dFwsZ54X0MkK1VSSh7Wi3WY41x5a72qgtgBZO
	 px/X1VIig0djaR4+iWv2hv3TxKKJLfJowaNJoXOHXjCy0cZV4mR2SJykX0pGDGYbO8
	 rnS2MgnWIqawE8/QGBGQhkBOV82/+z5GbBXnTX48=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 2A1184D1; Mon, 23 Nov 2026 08:10:33 +0800
X-QQ-mid: xmsmtpt1795392634twi6siz7n
Message-ID: <tencent_362F86565B982729D9FAF4092C36DF5C0D0A@qq.com>
X-QQ-XMAILINFO: NAFJfp6T/atIbpMrV/G9srCwmCIGjaHoKLYzKk4QKc757IuZk0lgeclpX8mOY/
	 kDigw3JkmCRVa7d233NPv4QU+G0n1Hqvq7cD+rzA65nFGuZs0D5QBFK9vECRtdgcpeNi5YreUCHs
	 GKolS5WC8x7WkL/otZ2jGo0+mwxyVpz4qgWexvi9MWR2YrudAXpXaS1JaA2A4QsbWrRvf94xXtG4
	 c3n0t2IDsiZnIkAjWQirxMsI074oEru+WtsVXpzYSdkwb/G1znBpZjaUaNrksRWQgQ/zJoyMxa3J
	 1KUX+MQtW0ui/mOo5sT3GBnJ4Rd0t0rnlGjGzA2xqeMc8GNXOCEEnaPW2D8kyC2vo7hcv3xd33f8
	 j03qY4kudsE2HxPQ0uHcte8b1mR4wgSm9iqI/Qian2rzQDxaBtz8VZVz+AluESbtg/c9Q8BAYgAU
	 TzYv9xYl6MG/ZaY+3JUYq5JscFyA6g+hX9OfaGrQB9ZHPwm6Ojr6VSYgjwqkVm+4W4i++vL6yZzV
	 W9Uj8bcTa9lfELbbcpBC7wCWU5fe3+jj0g1ETcyPcSI0twzVld3lmpeAtrZ1iezlaW8hD1Ol6tdf
	 h8XU4KTzmjbnis/KlhBBJgHJLFfZiksCnLVJvjydPPV0BN/WONf/Nwxovtr5y4rvAKkTc4sjTcii
	 YSGxnFAbol98wWycxk/yFJ5tWo9wwQRBlb3FRNdVq+QbhqcF5L5r1I5ymJnZETS87dlbKdnwoPAW
	 /vPHhJA1VIO2GGfJNEEn6MBxQLgSaEimZRnLUcqCMx9LxTbYAPs03jEDWzwPjJeCPaR6mRyDVFvb
	 nKFJhuvwc6afPrp+dlq0RxWRWORd1L1Blb1DPR110UxnUJd3/RtCbR/oaWGzZM6prgMbRNQBYkf8
	 fpjwtKnGG6ZgQbEablmyyf9BOLjof+WUuupcKfOIgGB8oIhV6Vt4l1dcmWV90Rv4xJicks6bzhUW
	 UTXYaEgXtH0heU0UhjXvv2oKKwXf7ZT8aXOqOyMhLj5DNMrxR8uGOuUny1x4BbvWM8r1ubTfd05E
	 4RwMHLi0akmLH2DWkDPCwo6p5ZwcxMPzkrzAYrDxqnSlVcqhdZqoPQaDQ4I2xj8viFV4JARQglEU
	 /2ifPIsVuuVRKROOjqd/0W8ZfgkQ7de0u787W6e58twRe40iUq+nFr6YDBcEX6W0JV1xU7lDPsw7
	 BY6C8eOV8rpbHm4Tv/4LkZ38ZUhbql1bDcTj7ApDDx5zxvFq6MFg9d40Yee5Ck38/xQLk=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Xiangyu Zhu <1194781887@qq.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Xiangyu Zhu <1194781887@qq.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: clock: rockchip,rk3506-cru: Add SAI MCLK output gate IDs
Date: Mon, 23 Nov 2026 08:10:28 +0800
X-OQ-MSGID: <7dbf1b4557d7cd9eec7d03838bb169c5db327bd1.1795366993.git.1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795366993.git.1194781887@qq.com>
References: <cover.1795366993.git.1194781887@qq.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_161043_258435_1B3796DE 
X-CRM114-Status: UNSURE (   8.23  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add clock IDs for the four SAI MCLK output-to-IO gates of the RK3506.
SAI0 and SAI1 are controlled by bits in the PMU GRF, SAI2 and SAI3 by
bits in the system GRF.

Signed-off-by: Xiangyu Zhu <1194781887@qq.com>
---
 include/dt-bindings/clock/rockchip,rk3506-cru.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/rockchip,rk3506-cru.h b/include/dt-bindings/clock/rockchip,rk3506-cru.h
index 71d7dda2..708502db 100644
--- a/include/dt-bindings/clock/rockchip,rk3506-cru.h
+++ b/include/dt-bindings/clock/rockchip,rk3506-cru.h
@@ -281,5 +281,9 @@
 #define CLK_V0PLL_REF			268
 #define CLK_V1PLL_REF			269
 #define CLK_32K_FRAC_MUX		270
+#define MCLK_OUT_SAI0_TO_IO		271
+#define MCLK_OUT_SAI1_TO_IO		272
+#define MCLK_OUT_SAI2_TO_IO		273
+#define MCLK_OUT_SAI3_TO_IO		274
 
 #endif
-- 
2.47.3


