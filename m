Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45862606A334
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 14:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VROBEBcs;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=iN87VZmS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=W6Tv6gg2RlXhQUM1tcxa1AIAU7ukm5wR66FQHXyYDHg=; b=VROBEBcsLJbIxV
	gBa9IRWkWwcwlqTRU35ensQRItRee2IDrF1cMAZQJEneOfUbmG8LZPDjNjZZC398+xqz2fpwx+r5J
	vX2hLJfvtdWkLa+1kPRFYtWbyLc18MKL0kEpsxD2e2xggFMT9Fbb0o45lj+iJQvfpLLlMW6Ra1LTV
	kW1MzIiqeep/So/zZrmaM64WMfEs+hS7CoFpKSHXcen9+6o6Oc5ROBWzg4P8nUX8EtreFqV82s6X8
	OpK1wWxSoeCIVwTylvhn9QVwU978bJV2rNWgAUV57/7/3EOzR0GwLdxYYXsYsLezbV3AhHum5EKtA
	4aTI01tG4S4MtYbcEbYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaqV-0000000DcIm-3XTt;
	Thu, 26 Nov 2026 14:53:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWaqS-0000000DcEt-043U;
	Thu, 26 Nov 2026 14:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795704784;
	bh=EGZQ5hw1OE7xV9Ltk+oXBVhBXm1P+5H4gIIoayzJU3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iN87VZmSD5C5XJU1a0MmKkg5vZuA3sOHhOxOjn40cjvVa/aB93QpQTZQDd4SIyLZ5
	 8KE/VJkbtVGxV66cCXUWRIiMIyalVummXvfuxF9dvCvLgtHUatbcPw4//2yH/HmRQh
	 5HlyVAaTjbZDJepSc0VJT931NHrKGQUELTBVrY9kARLWkJHAsgdn2EPPM0DtxpDs6X
	 nvQ1PJfxmAD3/dQSa9jCcNKQA9sn3SQjVSuX2Iz24eS7lWIcqF3s6VxNNfizgBJi8m
	 3XePlPoBMYzzpSDvLwE4hvYusbzcy6SYiOqmG1zAwDGwU+d8IKmwjVLo9hKAGavPR/
	 Ur2nr+vZXRhng==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A152E17E00C4;
	Thu, 26 Nov 2026 15:53:04 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 60AA148002B; Thu, 26 Nov 2026 15:53:04 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 26 Nov 2026 15:52:36 +0100
Subject: [PATCH v3 1/6] dt-bindings: clock: rk3588: add PCLK_DDR_MON_CH
 clocks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-dfi-clocks-and-rk3576-support-v3-1-0f33c1b8df48@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=kl73j53q8IZijypx0BWfssWY6LoAy/tptcYcpgMl8Co=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGsIR9BglrZgxoQr6c65BCUnkeVfs6wFT5cKA
 eVu6cnnvIVorIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJrCEfQAAoJENju1/PI
 O/qagyIQAIaqNWBmj3m0y2I5nI5lwOdUpd4d5hVoAuN0jQGucPLzeV/PB8U2czKOVyoCn3nul3w
 o+JCqGbBnHusaS2n2gDLmhOT/NEATW1eqdjHzPOge56/0pmOTKw7UCqnejpnmmbM0NrGsJIJHcI
 IXnMDjOnO2sDfNbd5TSRzitoyjqmlVs/9IPKiyncJcDNxhQAMuCepS4JN6nb6MgdqS2Y+cLO+tJ
 qrvM8piwAFj7WHWjS5Av9yRcbGUTKEeaZYSKci5gp9JWeKaqMXPKFCO5tiRfigJlCCwSX2T/odx
 0aGZvOJE+9Zxn11INKHhc5VrEkUug9EY7nrwvAjOnWky6HHHLElnxcC+XZDhTABem2ftCyPkEJq
 xD3G1OXUdCa+YhFZtI4N5j1tND+XYDL04zKpovkuh65gVUdxai5IoCaY7jXr8KlC36BDs2J4dux
 vdwJTnFr/G8v7wpvKMSiutXdY1AfPHWjC9F2ML2mAchgs/Mf4Ki8E8Dof4FJw67iiE8VJstTNLz
 pN//JdtP5ar9JooIieiakSiWdBJJyqU84kJ7+ZI7AZnIRKb3i0d8loPJ4HjyQUBLrq/TRRSUSS9
 P+UTY3XiXKSSX5FGfvvlg/BLKyS5Mc04NH5Y48lyjvLBKaKordlTkQ9t7Ds1GLxdleLq1FYl0qh
 /iprSqUWVB3BJFZZw5jMu8A==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_065309_672539_578B6A21 
X-CRM114-Status: UNSURE (   8.99  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

On RK3588, each memory channel has its own DDR bandwidth monitor
silicon, and each instance of that has its own clock gate that drives
the monitor logic.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 include/dt-bindings/clock/rockchip,rk3588-cru.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/rockchip,rk3588-cru.h b/include/dt-bindings/clock/rockchip,rk3588-cru.h
index 7528034cff56..6ea25019ebb4 100644
--- a/include/dt-bindings/clock/rockchip,rk3588-cru.h
+++ b/include/dt-bindings/clock/rockchip,rk3588-cru.h
@@ -738,6 +738,10 @@
 #define I2S1_8CH_MCLKOUT_TO_IO		723
 #define I2S2_2CH_MCLKOUT_TO_IO		724
 #define I2S3_2CH_MCLKOUT_TO_IO		725
+#define PCLK_DDR_MON_CH0		726
+#define PCLK_DDR_MON_CH1		727
+#define PCLK_DDR_MON_CH2		728
+#define PCLK_DDR_MON_CH3		729
 
 /* scmi-clocks indices */
 

-- 
2.53.0


