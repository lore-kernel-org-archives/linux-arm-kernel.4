Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D393C606A323
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 04:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FQO5YFRN;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=M7JWE2Et
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+rGTBLT3wwmPVYA4drxDvmKiLgmjfMAUnQ/eOQPgd24=; b=FQO5YFRNQjrjvskOVNfApcgJS9
	KyZWVm6lA+Rc5ikLpX/8UoFBTHfey4YfajQh6mUlwURoTHmGAW0zBNkgSHKl43LJxaSB9W+HLbrKV
	cWbgThodsFXEGFRWXyR7DrJ/vYU9lWUx/z3TKITqhqEeNn3MYwwYuC4aMZDt5v7BZp23JTKruI4PR
	SIdRuyUgrczmwReQ95jS9shUn+ieUPVED0G/IlNgwt/xZ3hNcuS2vgKRjFcXHPM0g83+T2PSlIdMd
	0RmeTwMg7Mcd/Lm3AhKoFW5VM93mt0FD3XRCSt81bVLwbJ2cLstMPmJfUWh8BtPpjOhn2tSOXyVaW
	2A7RXPdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSRpn-0000000H3x4-49jg;
	Sun, 15 Nov 2026 04:27:19 +0000
Received: from cmccmta2.chinamobile.com ([111.22.67.135])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSRpg-0000000H3wK-2mzx;
	Sun, 15 Nov 2026 04:27:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=M7JWE2EtO30y7rDPR1NaaLdApNOO6bgkG6OQ3Hx30ZLHuoDRZyUUBdkNXogBtjSSKatNJDFyI46dc
	 i0ueokU9D2SqyVpysvQNxVDvDJd22r1/odVkOAiPc3oCpx62WGUmjx6yG2gK8P2HGU590bcbF1pIdH
	 OMRDVAxwFeEiwyWs=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76af93489f21-f5aa8;
	Sun, 15 Nov 2026 12:26:51 +0800 (CST)
X-RM-TRANSID: 2ee76af93489f21-f5aa8
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.23.105.246])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46af9348a5dd-593e3;
	Sun, 15 Nov 2026 12:26:51 +0800 (CST)
X-RM-TRANSID: 2ee46af9348a5dd-593e3
From: Xia Yan <yanxia@cmss.chinamobile.com>
To: vkoul@kernel.org,
	linux-phy@lists.infradead.org
Cc: neil.armstrong@linaro.org,
	mani@kernel.org,
	heiko@sntech.de,
	p.zabel@pengutronix.de,
	ayaka@soulik.info,
	kishon@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yana06070@163.com
Subject: [PATCH] phy: rockchip-usb: fix reset control leak
Date: Sun, 15 Nov 2026 12:26:40 +0800
Message-ID: <20261115042640.426517-1-yanxia@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_202713_302998_07D321D3 
X-CRM114-Status: GOOD (  10.42  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

rockchip_usb_phy_init() acquires a reset control from each PHY child
node but never releases it on probe failure or driver detach.

The leaked exclusive control prevents a later probe from acquiring
the same reset. Since lookup errors are converted to NULL, subsequent
PHY reset calls silently skip the hardware reset.

Register a devres action after a successful lookup to release the
control on probe failure and detach. Keep the child-node lookup and
the existing handling of lookup errors.

Found during review of reset-control lifetimes.

Fixes: 0f74ab59ce87 ("phy: rockchip-usb: use rockchip_usb_phy_reset to reset phy during wakeup")
Cc: stable@vger.kernel.org
Signed-off-by: Xia Yan <yanxia@cmss.chinamobile.com>
---
 drivers/phy/rockchip/phy-rockchip-usb.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usb.c b/drivers/phy/rockchip/phy-rockchip-usb.c
index c5a2853a63d3..79b3315b6590 100644
--- a/drivers/phy/rockchip/phy-rockchip-usb.c
+++ b/drivers/phy/rockchip/phy-rockchip-usb.c
@@ -183,6 +183,11 @@ static const struct phy_ops ops = {
 	.owner		= THIS_MODULE,
 };
 
+static void rockchip_usb_phy_reset_put(void *data)
+{
+	reset_control_put(data);
+}
+
 static void rockchip_usb_phy_action(void *data)
 {
 	struct rockchip_usb_phy *rk_phy = data;
@@ -219,8 +224,15 @@ static int rockchip_usb_phy_init(struct rockchip_usb_phy_base *base,
 	}
 
 	rk_phy->reset = of_reset_control_get(child, "phy-reset");
-	if (IS_ERR(rk_phy->reset))
+	if (IS_ERR(rk_phy->reset)) {
 		rk_phy->reset = NULL;
+	} else {
+		err = devm_add_action_or_reset(base->dev,
+					       rockchip_usb_phy_reset_put,
+					       rk_phy->reset);
+		if (err)
+			return err;
+	}
 
 	rk_phy->reg_offset = reg_offset;
 

base-commit: 9a0dd2a09484e5ba45eb8e6ab58c0effe18703a3



