Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7236760A2608
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JyIiti9S;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=eDbpZMnR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Sb9604ZqOKnL5jLlbCzKt/eW9EFcFKIgFhhBj61S3cc=; b=JyIiti9SsIdnwL
	bSXZRlaiLGuVLUMt2eIaJwmhsbtPO+qUMGlQ1kWyCyPKdmGsEE6wQKuhbSrVlOawBUfBbrdGkBEPe
	TeWf7LkS2ZBCPLso2jmBWrTlcOV7DRDw9vHOB4XPJFOZAqIXVc4db2hDf3OBFFM08+g2MQ5XGEWJf
	i35udfFPp4/QpMnhWUwykhB+dQ7p16cZ+APa0GvphYJzlV+1n00BT0/MnODUHrATQsnNBKUvu2RfX
	6WAYCkehms+2qweI6nwTvoPWWtRL/BFFu+KhXU2ev2P9WphIsMhUwHXLOmyooHHLrVESdZchj2234
	x2G7vgOfi8oy+o3yX2pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU80P-0000000DEXo-1WLN;
	Thu, 19 Nov 2026 19:41:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7zz-0000000DEJs-2lRv;
	Thu, 19 Nov 2026 19:40:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795117245;
	bh=VLIkL6wE7wYf6uwe+nUboRMEv27Th4EuZ1ktfV7x+0A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eDbpZMnRARCAlScndnXjmT1YZ7+9lrqt4NvJUP6el++L5/Y68WoXn1vxtUHtJ/Cdn
	 /xxbgNVVmS7csES1plVHIPLttGaTLNYL2Sfd2IYRd/dBy/v4ljRe4/Aleb6FyL1yrN
	 PLKjMPT9fUSbZ832LL/IoaYvQeZ9x5PUJ3GKwDEbxfvkiDvlJI4ZOEFzQG5026bsFT
	 UT8Dl+dotOQdBZ8pmASeYHCZJm4FeGybj61gNY0a5aNfXB0Kh808ybgm2TECuBW+5G
	 75ltDvi2mOqvrPU41oQ3B7JOYrQWRuYsGneICjuTF/IcAa4AMh+nrjVlQCxW/ipPkc
	 jtcK/KVppmhyw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ECA5A17E091F;
	Thu, 19 Nov 2026 20:40:44 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B094E48002B; Thu, 19 Nov 2026 20:40:44 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 19 Nov 2026 20:40:29 +0100
Subject: [PATCH v18 1/7] phy: rockchip: usbdp: Disable USB3 port during
 normal power-on
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-1-fb325e336494@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1244;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=VLIkL6wE7wYf6uwe+nUboRMEv27Th4EuZ1ktfV7x+0A=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr/ULzw0MbRiyxs1SKri2Sq3RO/Zv355PsmU
 ekbWX0BcxVP2okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq/1C8AAoJENju1/PI
 O/qaWjUP/iX5couLjvn/eYovoBNz/IaaFRooxvFWa3qLmPfhOdf18dOl8AXQKUa+BY85K+KbKnn
 4B8zXRGYgJqNSvEGcIoZWyZoFo2HD29z0VcBXbWucQhj4RZd7E9L6VPu2Gnsu1eAGo0i3B2r3hM
 /5CRrP98nygBWCZgfbl9jzw2EYp8k+dMRNwazA1XwrbaV42rm6VR3FuOmEyDa3Nk29k+qGlaqki
 X7pW2Ug9GErXu3fIRIAswCnOe3o/Rs33fxtz9pEuZXQxgcFkHp40Tcr4ORmqlgrUI18yh1a6p0L
 txCETF0fWhrrEWDABwoxeZaSx/bS/Eq2GAaNqYrd85y3W6wDwMar9JqejEiWylRk7ni+YwpzBYT
 CpRAixl8C4q5PVvrzdox4rHAugm9oHXU55FMj/vgMnj0XiMXpvl+tKnx8sQK4UoGkhGrPHwB81M
 xes/8KXOjA3JtnvIcGOKW+SSBeoAsJE2C8veZ3WXKjE9v3SYVMvHwQ3VitEORFizwcna838QCHd
 FwDOdwSSBNYFRkzc9cFwX5gtMeD8grZr4aUL1lEdnXtJf0lFSUkJPPjQqUQEcgvhiTOzNMHAaM0
 c8cmA9lpbIBCJeyD0q4WxdF9Pnenx7isUCT4cG4mCIHlDyT2ObzqAUd7U/e/lqZyyzdwW2tdCZX
 KT4KI27Hin85id321qJIzag==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_114047_886928_FA91FDAA 
X-CRM114-Status: GOOD (  11.62  )
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

In the reset path, the USB3 port is disabled. This re-routes the clock
going from the PHY to the USB3 controller. This adds the same to the
normal power-on path, so that it behaves exactly the same (except that
the clocks routed to the PHY stay enabled in the reset path).

This hasn't been done so far, as it requires the recently introduced
PHY reset infrastructure to avoid the PHY PLL not locking during
startup.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 9c6d921b9191..d01a819bf794 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1051,6 +1051,9 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	if (udphy->status == UDPHY_MODE_NONE) {
 		rk_udphy_run_reset_handler(udphy, true);
 
+		rk_udphy_u3_port_disable(udphy, true);
+		udelay(10);
+
 		ret = rk_udphy_setup(udphy);
 		if (ret) {
 			rk_udphy_run_reset_handler(udphy, false);

-- 
2.53.0


