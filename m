Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A8F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 14:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UNGqMJos;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=JWiWAJSt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LuSdbCS6PnEOFW/yBPEagnpefQJlzkts0oUQFSt4QkQ=; b=UNGqMJosmHT9aU
	1eLGMjIenxKslcaQZxo1dAtnyFjUBIecCw3Y2I3YelgxzicZG14Dhs6+a6VfePR+DyZfmiXQsQy/J
	8VmKSfyIi9ABUwj6nzG7MEhdKgJBV2eNR3i0LzamqSbcaumtErYGhR1wSza7Ew+lRkpS8EAj116A9
	QBtpkcCMHHF0FvyW7CqBb8TvuRCNn6tXn0tXUFQxnTjmmTpVqXfHUnoyyI4SIQWHluZwi0lBQr+xZ
	tRD767aRj5W6DiFhP3rsJkRK3WCacOGBdFgAMSwAiWI+1OulJFwg4ubzmdR14eYIXRkxCGeH4cWsA
	i9y0G9lnxy0xF+X1TiGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaqq-0000000Dch7-3Crb;
	Thu, 26 Nov 2026 14:53:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaqS-0000000DcFA-04GI;
	Thu, 26 Nov 2026 14:53:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795704784;
	bh=VXjQmgPNcP6TxrE9fEJyZi07Hi5P0Q3culnMpUj9c98=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JWiWAJStLHRo2lj/uUtvvglAI8dN/zmaCL/VwmSC2+oFe+qVIWaiucaNHbelwKhEm
	 9+RPqJ/ihcaxCZflBG5ggTpttlRkC+/nMzwCBxrHB0oEM7IjSJTyhXpz7Na75yfgpW
	 MDCF7Odlew+LZpAeL0aaM3EZIiNLuhC1jVPoje5lwp9jt6PLSZ1I1ewbgRsmth2h7P
	 81U3ZYUEU8Rj5915rfjq/0fqKQUCNmPWM7FuvHwXu94TQ0kHzhThg0YKh0284cnox5
	 B8FY+jm7BVJKt5f+vdyNCTHCH63bNN5yDlxo1xN4Zfk8BVmBgZ0K1eDdLKkTEk2jxn
	 MapqJCyKC+DXg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A567D17E0FD4;
	Thu, 26 Nov 2026 15:53:04 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 63808480031; Thu, 26 Nov 2026 15:53:04 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 26 Nov 2026 15:52:38 +0100
Subject: [PATCH v3 3/6] clk: rockchip: rk3588: add PCLK_DDR_MON_CH gate
 branches
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-dfi-clocks-and-rk3576-support-v3-3-0f33c1b8df48@collabora.com>
References: <20261126-dfi-clocks-and-rk3576-support-v3-0-0f33c1b8df48@collabora.com>
In-Reply-To: <20261126-dfi-clocks-and-rk3576-support-v3-0-0f33c1b8df48@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chanwoo Choi <cwchoi00@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1856;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=WfqRSjYFz7+ljRQE5uaOc11qdMoKK31EtGs4gkDrNM4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsIR9BgLmQS56N3xRiujYqbu7FvWjcjLib8h
 7MqHxszt3xtu4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrCEfQAAoJENju1/PI
 O/qa7pEP/jmZJ6C/rwWR+v7DY5++az7FWNw+FIgrGJ5IlqSiFzidk2vKcxyBNNisbI64fMeEMlm
 AF9oSRdCMdoLBlDZmkZjQu64bMwveOM8B6PwFIx72Jd45EIFU5zgbfoKssucGoJHcuNQbHjv/3s
 IvZdei2MSevo+3hUL7OMYUPQdRRWQ0lo0eLkxwZIMOqDh8IdPySfpFlxFPiffLCRvPi07cb/OEl
 ZwcRy3YD+oAKaXuuLve0XaEEThTUpFBVQzVKDCldpARdabgcHODRz0j1UvziTtRPnzVBRow6Rah
 KRfCGTfLfuFFpjRCG2Nssk+psTrCZ8RiQLnabZnBAWCirOxlbRC3onC2pOdEynUWvaOx5v/2SIH
 EPth60jSuSNxkTfR1LVxghCybcmK+0GHpE0SvkiBX5/F4nJri+p6idi+72iAVvpW+80nbru6dw2
 M20V4iK1kV03pFHr0fmHhMdTkrMqDUW03pwNJZaobdyTyu5GIxnepC5PM5HDaKEl/C6nl+vQpfM
 bcIC7GAnP0xjZasghwEBEr3Mz8IGbVUhenm3YTwY+5yn4SfopwSBu91iOAwft287tq+ZvQic6Bx
 gC3PNmWiN66suX44mBfs8sYghVUWyWMt53scI2wX0uo42k1dYZbiNd9xDRC3iuMFp2GXzG2eEKX
 vh1G1MKENO5ej8D5OkgUq9w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_065309_729831_C0DE4593 
X-CRM114-Status: GOOD (  11.26  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

On the Rockchip RK3588, each memory channel has some bandwidth
monitoring silicon (hence the "DDR_MON"), which is driven by a clock
gated by PCLK_DDR_MON_CH0/1/2/3.

These clock branches were left out of the mainline clock tree until now.

Add them, with the proper CRU reg bits, and the proper parent.  They are
given the "CLK_IGNORE_UNUSED" flag, so that older device trees with
newer kernels don't turn off the clocks because they're seen as not in
use.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/clk/rockchip/clk-rk3588.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
index 24baa0ef9bf3..0485faf27163 100644
--- a/drivers/clk/rockchip/clk-rk3588.c
+++ b/drivers/clk/rockchip/clk-rk3588.c
@@ -1349,6 +1349,14 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
 	COMPOSITE(CLK_DDR_CM0_RTC, "clk_ddr_cm0_rtc", mux_24m_32k_p, CLK_IS_CRITICAL,
 			RK3588_CLKSEL_CON(166), 5, 1, MFLAGS, 0, 5, DFLAGS,
 			RK3588_CLKGATE_CON(70), 4, GFLAGS),
+	GATE(PCLK_DDR_MON_CH0, "pclk_ddr_mon_ch0", "pclk_center_root", CLK_IGNORE_UNUSED,
+			RK3588_CLKGATE_CON(20), 1, GFLAGS),
+	GATE(PCLK_DDR_MON_CH1, "pclk_ddr_mon_ch1", "pclk_center_root", CLK_IGNORE_UNUSED,
+			RK3588_CLKGATE_CON(20), 14, GFLAGS),
+	GATE(PCLK_DDR_MON_CH2, "pclk_ddr_mon_ch2", "pclk_center_root", CLK_IGNORE_UNUSED,
+			RK3588_CLKGATE_CON(23), 1, GFLAGS),
+	GATE(PCLK_DDR_MON_CH3, "pclk_ddr_mon_ch3", "pclk_center_root", CLK_IGNORE_UNUSED,
+			RK3588_CLKGATE_CON(23), 14, GFLAGS),
 	GATE(PCLK_WDT, "pclk_wdt", "pclk_center_root", 0,
 			RK3588_CLKGATE_CON(70), 7, GFLAGS),
 	GATE(PCLK_TIMER, "pclk_timer", "pclk_center_root", 0,

-- 
2.53.0


