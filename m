Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A158606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b/Nt+/zw;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=MG4vbkgS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ALZFKbs138rL4X7hGmqZ+xvl7ond3UdYP0thrAs8QzM=; b=b/Nt+/zwb3YGti
	p8D9beId1s1WWr6fYYGAlhpTw07pw706bCW3be1nuyaL2CcXGPK12LXiPzT408vqiTeLxh+fO+Zrb
	lXKxgEUyJrBW6Z1UZSFlbQDJMtL0LFriCpzPkJM3U0UOydcLaJDWoJ8qwvcXEfezfSa7wFPiQdZQa
	YfCBFHUJDF0tRMYOQth8VBLhFV0Uavsrg0dO/2b8Lv1iYElPjLi17RXrlq7ajcM8e6434K4trpfaI
	GyWQxeOFu+dztwRoARED5wOA4xe7P5pPRQrqBt9NvKUQWndUGIvzIev9RdzLfT8225q2p97eyQw3+
	aWqo4YSyCJxt9QD7vozA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU81E-0000000DFDY-2imo;
	Thu, 19 Nov 2026 19:42:04 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7zz-0000000DEK0-3iNM;
	Thu, 19 Nov 2026 19:40:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795117245;
	bh=Y0ahJFIOGX3bRryRmmv/cq+7XRNRRYPyaAzmDErQaZo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MG4vbkgSWkmTyRlzPfpCkO8QFEaFJCL8/aGiHoZ2uVZZ5P7FsEAM5ihARYZrL22la
	 sTgIqThwAYR+RXsUu5T+ty8iPLeihFXDxl2+bQR9wNZDnM9PztnOrn+gTbjcZMjhxs
	 8vITy9/viVRuYwamDsAsfyip7Hb5qQBWsTYNVaSUa+E16OPgWaCy/0CDu/bvinEZH8
	 gX9ggPTrC6pb+Y8XOfJh0E9KDfrzYEXCs4Ibsf0dv6f+5s2dUJTiiHxp0oKTSG779h
	 RVSs2IAYYcOIJmbSijl8Hn7oZym8ZMTt+PTuTZ+3ihf30YFAY7S6AnpKcsMzLSXtBA
	 9PI45RkesHcYw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EDE5417E09BC;
	Thu, 19 Nov 2026 20:40:44 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B1F1E480030; Thu, 19 Nov 2026 20:40:44 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 19 Nov 2026 20:40:30 +0100
Subject: [PATCH v18 2/7] phy: rockchip: usbdp: Drop -EPROBE_DEFER hack
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-2-fb325e336494@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Y0ahJFIOGX3bRryRmmv/cq+7XRNRRYPyaAzmDErQaZo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr/ULzWcVBRSGHMxKdXwUnhKXpCkIPxJP3Bw
 2zgj7+qxiVgyYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq/1C8AAoJENju1/PI
 O/qaSPcP/1U5PjJHwkxPPfdbAWWp7CDdlJKRyT1dl/RfTmagjnZq55tAczE6PrikpjqitiD4rKD
 69RNfSKcMXHF6xIdNEtPuUd6mwoYBll1fkjGTKtu99RqdvrTFgfciaTDsGuzd6TYNbioRxIlVW3
 TbBElBQUF7Gpx/qNwD2N0DZB/ZLz2yqkzijMxQWGcuAGIZqdJG3KzlWBW7DiDiv2nmRJDYreVAO
 zb2PbNtY+uVx2aqOTqgfGmKBPRMNq+RIWZEtMetzQof2c6cJeO56hC+EaAhORrfZYUDN5bP1Uuq
 2QwN0sCDTPc76OtUEQ8kBKvrJndKR9xkNR6gJKVPDTdUhACcqZCJ8sYETAUhALE9CpVhZlBxROg
 VTtu5/fSSxdG4K/A/GC9ZuD2kTFfYvSuoSxbAOa8CziZd5HesdoRLuB4CBtkRTiFx6oKwaQW9ZD
 jpUdm7rbdowJVMoDEaa4ZPDmT/xOLb1CYE+GKKi6+i1xWi57Exh62wMe0g97oROnytjPe6pAhGI
 SzPWAj1j5zJwI+Y1KkuxImEHP/rVarY3Ce6C3kFM0KuuhQ2bKdkt4qSzyxgzQWjEVq9veQ5nVy/
 243xGKKy5MmmNq7vvejljT+V/3P8T7rC5azANGk6ZXE3ZLOOxZnJIHpFOo94dK62I1CF6UWlrHx
 D6dwgiQirb5jDSjGojg4wMw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_114048_084748_B08F51ED 
X-CRM114-Status: GOOD (  13.82  )
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

The hack to return -EPROBE_DEFER when the lcpll lock timeouts is no
longer needed. The driver now does a reset during its PHY init, which
avoids the problem.

Since rk_udphy_status_check() is called after the probe, it should not
return -EPROBE_DEFER.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index d01a819bf794..025c8d52d72c 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -754,17 +754,7 @@ static int rk_udphy_status_check(struct rk_udphy *udphy)
 					       (val & CMN_ANA_LCPLL_LOCK_DONE), 200, 100000);
 		if (ret) {
 			dev_err(udphy->dev, "cmn ana lcpll lock timeout\n");
-			/*
-			 * If earlier software (U-Boot) enabled USB once already
-			 * the PLL may have problems locking on the first try.
-			 * It will be successful on the second try, so for the
-			 * time being a -EPROBE_DEFER will solve the issue.
-			 *
-			 * This requires further investigation to understand the
-			 * root cause, especially considering that the driver is
-			 * asserting all reset lines at probe time.
-			 */
-			return -EPROBE_DEFER;
+			return ret;
 		}
 
 		if (!udphy->flip) {

-- 
2.53.0


