Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407AC606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XHd4CoAh;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=MzkMG2Yg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7kTrMFu1cYkoIn1xnEU6VU4HwJdg6h66WXrpMlgK15U=; b=XHd4CoAh6gOc/6
	wbnE9IRSh652KdI7WCRPhXv9BbHbvz4LcH8GX+2ULzOSSxq1dorVyb/OLKRmqQISsGlXzzoCW9LIW
	TCSSWCvJOLfvEo0LCskYjwWUZNnHvmUzMxIwm6WE2VLV+aw4HKa4wy4pEiMLK5OcVrFhjzbbQD8oF
	x+zjf5NUxeeJjTmlu8urb5D4YgjdaZQL2JB6DxCjLKunmuBpLB4K5L3vV/OjEidSFAxHWs1u20xQK
	4DwzFOCGk+7QbswijrhdJT/Kg1eeBGB9aPNljyp6PvUKKyTOTCzky8lYkvlAfKS//DKhhRBe1JRdf
	oFQGrtGQeOs8YaYsqqDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU812-0000000DF2Y-0iJN;
	Thu, 19 Nov 2026 19:41:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU803-0000000DELh-1UR3;
	Thu, 19 Nov 2026 19:40:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795117245;
	bh=ZJJnGyy7bCzUp+dwilrqINl/+jw9ECyHmmQLI6RNOt8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MzkMG2Ygq6B+U9U7iYmHk/hzyD9oJWweTvQsm27/qzT+a5R3kPpmF/j/05Z6g/Prj
	 qEAyJHQwsXtOfz2d3qQ7BgXpLf4RyAKd544JmZTw9Tw92Ug0qn0WKnks1nRzYchBPO
	 Lfr9s+Hw0F8BWHBGKMigQkHipr+xlH/HLCJQeCRpJwoyKnI9G/QgKD806H0smbQ8NM
	 7LU1qI73JK5TTkbiM6+0z9YWqRR+7fOJgkTE70Df/+zgLh00AP6VncMUH21TtX0V0o
	 YQQJcbAKweu5ovvm9R1/CYff7851zjblBbIbiOLoeVvzi3aYn8iLcPg+NRfGbYnr4I
	 evHYOVOq/6hTw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4597017E0DE8;
	Thu, 19 Nov 2026 20:40:45 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B7768480038; Thu, 19 Nov 2026 20:40:44 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 19 Nov 2026 20:40:33 +0100
Subject: [PATCH v18 5/7] phy: rockchip: usbdp: Re-init PHY on mux change
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-5-fb325e336494@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1196;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ZJJnGyy7bCzUp+dwilrqINl/+jw9ECyHmmQLI6RNOt8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr/ULzKaChPEYt/9fxdAQdVsH1fqc72zg+Om
 txAR5G+ejrp/4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq/1C8AAoJENju1/PI
 O/qa+x4P/29rFOaQrzXajByPbHGRG/Td37cmPgas647t0zaeDsQoxYpKNS7T934aOndPmRuQbZm
 ReQcXxLrqO2oMbWq5B6TbmqbufOeC8Stsh2m5x1YImlP86lZhTQglKsNPf4adllV43BpBeVue1d
 4c4Ie9KSKVKQzicPduCgk3Zw19PuZc7oiByKRtK/GfnD6Tv4Ruzj0VC0M0oywRtGwjUgn5Ygx22
 Ugwcde2vxyLMEophltQOic4a0sH+NPbFhUiilPKILDomJvZvy0OnqkFoHBHwLdbJQFC2ORo0a8x
 l3rMOO5HaygBz9uixQycM30ukajziol18F74QJVZQw6KJhPJRQLuH8GUz00p9q/1HsNBri2i3w9
 iufBdM4j2ke+J0Bhqwl13+h744cLC23ShumhdBHjM9bPg+9S+Zz/pWcfT1ezt3+8Rf5NReOMlKy
 9FEyA8s7L/12VvTDD09Llud3tSeSUhvspb8j9ZDuxiGTc/6+risDStULvRYVuJkWYtaKr/60eXs
 l2Wz7vvT/8CQjVP/bFRKrH/dKj1jkZvcyyLV9tEp+pORdT397h/NXZ9RJfLRk7VlSzKxtAXPp+g
 94xjV2xZjGKs80tdSCOQU6izx301BQliSrYofFW1oP2Cq6DptyL8eh9y56XbWfs7iv2R1ifyCYy
 uE9fPD5kQBqaRtXqsJPg0TA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_114051_587654_3ED3A871 
X-CRM114-Status: GOOD (  12.37  )
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

Ensure that the right part of the PHY are powered up when the
mode changes. This ensures the PHY is re-initialized in the
following two scenarios, which are currently broken:

 - cable orientation changes without DP being involved
 - switching from DP-only into a mode with USB support

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 140bec887a5e..e4bbcb4edeae 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1438,7 +1438,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 
 	rk_udphy_set_typec_state(udphy, state->mode);
 
-	return 0;
+	return rk_udphy_update_power_state(udphy);
 }
 
 static void rk_udphy_typec_mux_unregister(void *data)

-- 
2.53.0


