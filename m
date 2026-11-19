Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A02606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b1N4iYsz;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=aY0IUfhD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hsV9AnVg9OEpUyytpCbMtf0xyY3yxUF12MQ/J8+qAq0=; b=b1N4iYszqOxlVy
	np1C772RsdPSoZBI8TMRHTfOwRb6JjWnLSqqWoohqbDfPQU0iHR5wMBf8EVUio0NVrYRdOXBrHMTG
	pkTtkHMNYVwKQy5lPHUhYrNEldCU/AHCfoLbThBzocpMGZB15+64feWOW0P7o7kL+hsLGnVSO0QDB
	cgcCA7cM4bYWmqzkmQ3QHzfp5K/HYR12kL45i60ZX04tRpvbTs4J5i9ssXGoZ1dByhdF2vOpcxI66
	2vcsMWQo3OUP2fK3p/hIHEHITGEwEjIkzobJ4j4lrmVCoHa2OpdI1OnCjznUSpma/UaQ5jMiuhzwo
	6D8Ch4yiEPX/aCgGan9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU80s-0000000DEv7-3fGg;
	Thu, 19 Nov 2026 19:41:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU803-0000000DELi-1Fdm;
	Thu, 19 Nov 2026 19:40:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795117245;
	bh=UD+MvinUlfHsugRDvqIwZxdx/6jrogHoWpGGB9OFIeU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aY0IUfhDKbLew/xENqwpGBEdCzDg4Xv/q6G70RuXNbUPMZ4C1DOqGTtNfelRvx2vI
	 X69OXcfGYrxpG66iR3iDzZIDBDHMsJSj7CF9aQH32Oe38bW/KzOU3KZtvyUK6fpZTo
	 bxLG+IN8CfAzlPYpGcjlxN6dCmn+dUiPI0dnaxfGOt+bFFIYfC8IzUw4vhkXNAfqXp
	 JVTVmIJZnp3ojPvrXtvQ76VeDiiYX+Hg3iqKWUDOAg+LkWry4/tw9XHmZpY1ZJA4Jz
	 NltXw8XxSL1iok8XcSungO1BJ7Z/3+apcA7zlrAIzcMnHAmAEn4bMLJ1wpZ8Pdofje
	 b2hwV1KXE7f7A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 516EF17E0E04;
	Thu, 19 Nov 2026 20:40:45 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id BB88248003D; Thu, 19 Nov 2026 20:40:44 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 19 Nov 2026 20:40:35 +0100
Subject: [PATCH v18 7/7] phy: rockchip: usbdp: Add DP lane setup to power
 state update
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-7-fb325e336494@collabora.com>
References: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-0-fb325e336494@collabora.com>
In-Reply-To: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-0-fb325e336494@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Igor Paunovic <royalnet026@gmail.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Yury Smirnov <yurymonzon@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=UD+MvinUlfHsugRDvqIwZxdx/6jrogHoWpGGB9OFIeU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr/ULx45TuEFAjpP8euUVII85OZafc5lPLYG
 LLLW6PxXqheaYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq/1C8AAoJENju1/PI
 O/qaf0oP/RXGAQwihHDu/vzkVWSff4WGwfZrcOsFwe6l+i8nS+f3tXiyMl87OC+VcJaZ7K9tgEB
 MC42459ej4QbPdDNlQzqnPpkG62xEx6mWk4qIM3vi4sOFDfdqtf9PNcVTqhmV/30XXzvX6uvqjm
 cO8IMONXWKuKhziX++k8mQ1n/cEIdlgyxSCJt/nHopeRrFgAlIe6B5D6GY/75SD76BqT6UreOHt
 N/upzKfZOYSdzw0oOFMtaDK18iIDb5qq2NBVfw0ySaoTaaJH8LzDEQ0swzgnVUPZLS7PEN/UNgS
 tQJc+iu/3u0NnN8q2TAnHCibT8IiBURFqdFccXyqUG8L1BF4pVrxTebZxem9RIaZbGhIkvqIcJ2
 UP7GBRl4pgN3mhD7LI1q+vK0LbBuZXmBi4tgfeaySL/hw2tG/ybnf7XqcCMErmR5Q+6c/fCorQU
 cCxhO7ufh8B/WM1U7p0ZbIdgtUHINmF2JKtR4DXJMTUuW3AG5gcCxRWkNRoz84+HU7a4fWT2xDc
 /7bFlgv3CdJBqMUbam7tmEefff155Eb75INQbj1HM4rLE3mH1ogQb8ROzMqUOnp3k3E9q5vxI5A
 oXjoFe45xqRfFXkJfSWGX7p5CkpiogYKUNJAWaCssv7DWtbt8IMOQn7yWUsD//dO5HwD2xknkiI
 E21XPWKIp5iXeddMsKiwvNw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_114051_527645_ACDB3C5F 
X-CRM114-Status: GOOD (  12.15  )
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

DP lane map and AUX orientation are only configured in the DP PHY
power_on callback right now. This means when the DP controller keeps
the display enabled after a cable is unplugged, it will not come back
properly with the cable re-plugged in swapped orientation.

To fix the issue, we update the DP lane mux configuration in the power
state update. This gets some special handling, because calling
rk_udphy_dp_lane_select() accesses the VOGRF which needs the DP
controller's power domain enabled. It is active while the DP controller
has the PHY powered on.

Apart from that VOGRF may lose its state when the DP controller is
disabled, so we keep the DP PHY power hook as-is instead of fully
relying on the power state update function.

Reported-by: Yury Smirnov <yurymonzon@gmail.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index e72752ed4968..7a37b63ea51d 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1115,6 +1115,13 @@ static int rk_udphy_update_power_state(struct rk_udphy *udphy)
 		}
 	}
 
+	/* Setup DP lanes and the AUX polarity */
+	if ((target_mode & UDPHY_MODE_DP) && (udphy->sw_mode & UDPHY_MODE_DP)) {
+		phy_set_bus_width(udphy->phy_dp, udphy->dp_lanes);
+		rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
+		rk_udphy_dp_lane_select(udphy);
+	}
+
 	/* Ensure USB3 support is enabled when supported */
 	if (udphy->sw_mode & UDPHY_MODE_USB)
 		rk_udphy_u3_port_disable(udphy, !usb3_port_enable);

-- 
2.53.0


