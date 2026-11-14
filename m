Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5C6606A330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 01:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nnB5iFjb;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=cevfcFXe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jXCRl5od6/bd+8TATrwS6lLPDMeMCt8jrOi77H1L6As=; b=nnB5iFjb/v07pO
	TVCMH0b85V1FvQ47j7R0Z1svXZzipo+hG8FTkCd/uwJ56mjdFwSgxWgAz9kVXl92GdFwjm4DPkRDt
	ZLcrPJxu3dS591GYqiYGm2IOgJQ5pSxQqBVrmdAEp823qtp9+0HfH16rqnU0DFEhAbgDJTJTJmRMg
	9w2DoB74bERMbTZInpOYwRMbq3ZTSDw6EF0x0nTJFmu+odN9ljPTP6Dh9ih7KCpQDYJZ7cufZzf64
	tal5p4rlAVGtO9DjecGhJ9EsUH7YiCPS7JDVU9K9wE1xeawGypNF9jQwK+sangp45bKVE/cFyvfeE
	XSCdp9BI0Y3K7TSRVv+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS2AS-0000000Eyao-2qyU;
	Sat, 14 Nov 2026 01:02:56 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS2AL-0000000EyTm-0WeT;
	Sat, 14 Nov 2026 01:02:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794618166;
	bh=sUG9ych+u8JRCPvClkQmNGRZbz6iFbmjqNm2EPiF2aE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cevfcFXewlPtqKLSUYFBpFP1cWSglgoud4wItwWRsYqTOTIeMCwNLowO1igKI/RmR
	 VufOcXu919xCRw3SfiiVbcVaRAQFV4T8DZRfn2lAiA3ku9sG4V+xaY00zy2ymTTChM
	 TLb3KGSRmrBSUNgZtaNEw5muI3Uh5M/bQtl1UaXuE3byCjZkpHdL1eFXYQATRB+TFQ
	 CElIli/AxOyuz8mCLFAVNdQampQZXVJBshR+D584LinaUOqhbFt5V77NK1UnBrKzkH
	 Amp+3PiK48AgrPOKrHFrLi+vaOhJJxFgmCdmFZHXcSKtctoCRhHku+9OozgTIwYsAu
	 gLjF2qWsM0EmQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 08E0617E09BC;
	Sat, 14 Nov 2026 02:02:46 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C172D48002B; Sat, 14 Nov 2026 02:02:45 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 02:02:00 +0100
Subject: [PATCH v19 1/6] phy: rockchip: usbdp: Track PHY power state
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-1-b79fb5f4b42a@collabora.com>
References: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
In-Reply-To: <20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Igor Paunovic <royalnet026@gmail.com>, Alexey Charkov <alchark@flipper.net>, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-phy@lists.infradead.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2524;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=sUG9ych+u8JRCPvClkQmNGRZbz6iFbmjqNm2EPiF2aE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3szXBuJQq7BfqOKugr4c8R251lbULzRPpx
 608CreYNgHQuYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq97M1AAoJENju1/PI
 O/qamasQAKT/3JIgUbM6SBLv48AEunELYHOg/udHGqLuISEkCCGDXgaQFh9AS8jeMS12Arr3Vmj
 KZG6FqoxuQnA8/CAu/t2aNKvq0CbdE4Qevm02p0oe3kR3s7SAkzrwgC+/V2M/slWDsxhYG28Ql2
 SR9UDlOo+EfArP1lHqJ5zrgMq0eqKa1VfKq1kOvzwi6p+oB8ykEC47YZNtMtXV9q39Wgp/udNrk
 Nb+w0wblhMya3F+C5K4M/WgR+yLpwA9w4WzqHkxAgujhKvISmLvyWFdOB2pSz16GCrYWt4i5N73
 Yx/U4WHLnReVtHlpOA1v2g5tQn6N8rga775UXRnlAQYZ6Y46zw3e+LAn4oGQXUr0eH2Lzc6AvbB
 wXdHN4MKId0tZquZV4U9a9PgwG8Y+1TwjlxwbjW0p/FcWbUXKFV1ymrLiUNRObY9uMGzpl8PA7c
 D225d+mQHo2fqaEMopZlLqht9vOp41kF0MtFKfV2f8hz6xr8BjqaDt+IhZsYudoNkePCcgsMNrd
 Wzto5TRiZ2jDBDhMslZc95aQr2/ZdTso6sk3qPOl+dqetoWBQv8BwNBzFTUPhWkWQ0HxL+2ykqe
 TIGQMCqrufddEiF/AJCepG9jxXe/xUnkjDEo1At6u70B0JX/xMJYrpTsveBjPeuGXY+dn7oV0Rc
 jJcUSwK5/eScNAV9VFjkxYg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_170249_342785_EBE9AC69 
X-CRM114-Status: GOOD (  12.58  )
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

Track PHY state requested by software for DP and USB3 individually
in preparation to rework and fix up power state handling.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Tested-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index e748acdd2d31..cb1f455accf8 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -175,6 +175,7 @@ struct rk_udphy {
 	bool phy_needs_reinit;
 	u8 mode;
 	u8 status;
+	u8 sw_mode; /* modes currently requested */
 
 	/* utilized for USB */
 	bool hs; /* flag for high-speed */
@@ -1051,11 +1052,15 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 	int ret;
 
 	scoped_guard(mutex, &udphy->mutex) {
+		udphy->sw_mode |= UDPHY_MODE_DP;
+
 		phy_set_bus_width(phy, udphy->dp_lanes);
 
 		ret = rk_udphy_power_on(udphy, UDPHY_MODE_DP);
-		if (ret)
+		if (ret) {
+			udphy->sw_mode &= ~UDPHY_MODE_DP;
 			return ret;
+		}
 
 		rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
 
@@ -1078,6 +1083,8 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 
 	guard(mutex)(&udphy->mutex);
 
+	udphy->sw_mode &= ~UDPHY_MODE_DP;
+
 	rk_udphy_dp_lane_enable(udphy, 0);
 	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
 
@@ -1286,16 +1293,25 @@ static const struct phy_ops rk_udphy_dp_phy_ops = {
 static int rk_udphy_usb3_phy_init(struct phy *phy)
 {
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
+	int ret;
 
 	guard(mutex)(&udphy->mutex);
 
+	udphy->sw_mode |= UDPHY_MODE_USB;
+
 	/* DP only or high-speed, disable U3 port */
 	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
 		rk_udphy_u3_port_disable(udphy, true);
 		return 0;
 	}
 
-	return rk_udphy_power_on(udphy, UDPHY_MODE_USB);
+	ret = rk_udphy_power_on(udphy, UDPHY_MODE_USB);
+	if (ret) {
+		udphy->sw_mode &= ~UDPHY_MODE_USB;
+		return ret;
+	}
+
+	return 0;
 }
 
 static int rk_udphy_usb3_phy_exit(struct phy *phy)
@@ -1304,6 +1320,8 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 
 	guard(mutex)(&udphy->mutex);
 
+	udphy->sw_mode &= ~UDPHY_MODE_USB;
+
 	/* DP only or high-speed */
 	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
 		return 0;

-- 
2.53.0


