Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDE7606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 06:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aHMskixW;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pfrb/+1V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=73kaX3/gJU+TE1/qYxJBWp5+fn83LX1wOwAPpJeJd5c=; b=aHMskixWqXuCAgnzRDtgHPC6vL
	2kCOmlrx4v97+pLYUJhMfaofeu7L49jy7m4H1yTXDogeyZW+aYqqZKEfyKrfT1LZRv3XmsI73MVAA
	ChzA4KD4C30eV/lL5Wj7WsR18sllhQJirw/VjnqN9QSREr8M9qGi95kMNUkOKYba5HjYgxv3bx1B7
	YeYybMhHhmQSduGntUiy7BA+7dCR2Rg8uUcvjOTxepwKcfKW+UDajxMiNkGOSoNLYxGyDA79H4Pcc
	qlSNjJLZNFXZOPsHCMxWXNRHAAnaQ2qE8J0F856rOFLj1tT/mMc8IO60X7HdrvYygGouLyL8HyoaF
	jIPG+QTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVNyq-00000002PCp-1tsw;
	Mon, 23 Nov 2026 06:56:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVNxb-00000002P6J-0EWW;
	Mon, 23 Nov 2026 06:55:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 21D73613FC;
	Mon, 23 Nov 2026 06:55:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795416929;
	b=ZWu5m22Lqk8WKxzB5dua8YjcXMnTBC+2ZDnoyVmBV3sMHTaYNr6lwRCq/i8yKWl5Wg1y
	 Xa/H6eK/6ME+5piZ70Y/0n5r7/+N7OsfZrdO3guopeVJgBvbE43MWH//iwZj0gQiw2/KH
	 q5Npjz95ZBeS/smpkOkjWQukykHpwguEGkthidmKw+6OPZlMavRd7lgAV1FFq56drAaIP
	 ut0wu811WSt3VnN2ZvgLdgNVhysRNUvhO+fNyiDo4boVO3FbTxywqHWiT1yklfPAq66GX
	 rFR+z0XhUScLGpHtqk+7UMgSN6ysPyXQf8dLr+qOvHR1UCMaDnBIAyspEpchM9GkV+w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795416929;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=73kaX3/gJU+TE1/qYxJBWp5+fn83LX1wOwAPpJeJd5c=;
	b=CO2/sQQ9it/wMCWBaeLmGyd7Aw4JMymrrd7khxQlYchm/U6LEYhERnIREu5GiPBa5m42
	 S34IEcIK/uOgkhjk+OIonb/XOrdyDOAiu/5TNgIuv2gUR8jWFyIgRSQVhOzTGt5XE0DBv
	 iYxugN5AAMOC0Sw7X+t4eepOKfttjdiqyxWAuZAPPNUo5l0FFlkoGMBcm62ijsajlIt5P
	 eOrInuMM/8xFKw5klof3Eb4PzH78dQwfJ2cNoOrhpVdAMJwLhCMNA//jm7+RRuiakH82u
	 n4dCWOeL3tjczG3amwjtdcX1Xf1J5UTgzRroL+9FPBtfcX8LuzHqW+0rzxYr8krXgZQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B457C1F000CF;
	Mon, 23 Nov 2026 06:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795416929;
	bh=73kaX3/gJU+TE1/qYxJBWp5+fn83LX1wOwAPpJeJd5c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Pfrb/+1Vx2y88G+5fbe1DJbfLTGXKMaLbp0eTtHGh6FCY5BzCWYWPHh08mmnNcDfd
	 tDsF5DnGoeDk3ee5EG5cpCKMA8mmVRNPZoQa3l86RVDM/x2aHAOrkAaD4t9rxeWbDH
	 SmiUIDXe/isakFtDgttKv5TM+fRx9FqMbGv3A69cZwB3DtEiO4jO8riHthpSFoGYwp
	 w9HtaqOCJYIp3INpGRLYgSDNg8YhnGrLBB08y3gEMZ38tASz2rU/au1VM4sFgXDnOT
	 dbvNxANKsDtGCJ4M9sHribZCPX8kgnEIDS9J+HRIVlr5aBQ5EXW7hWDPYIqrwRpCdZ
	 OBNMqAwGCSGwg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3E2E64C3AA;
	Mon, 23 Nov 2026 06:55:16 +0000 (UTC)
From: Bobek Brzeczyszczykiewicz via B4 Relay <devnull+admin.roadbobek.com@kernel.org>
Date: Mon, 23 Nov 2026 06:54:09 +0000
Subject: [PATCH v2 3/3] phy: sun4i-usb: Fix phy2->clk2 reference imbalance
 in sun4i_usb_phy_init()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-usb-sunxi-reset-fix-v2-3-4e51d3a64964@roadbobek.com>
References: <20261123-usb-sunxi-reset-fix-v2-0-4e51d3a64964@roadbobek.com>
In-Reply-To: <20261123-usb-sunxi-reset-fix-v2-0-4e51d3a64964@roadbobek.com>
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Felipe Balbi <balbi@ti.com>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Bobek Brzeczyszczykiewicz <admin@roadbobek.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795416949; l=1149;
 i=admin@roadbobek.com; s=20261117; h=from:subject:message-id;
 bh=2/RvSPv9KdaGKCqwuU1CPvhUhe3Y2XomCyvU8DfERlY=;
 b=8SadnOA0k7DAxtcHP3w9+5kmioUG393Aa8KvOxAQQwynz3lISKa3QefO2RtF2O3grc23Erh+Q
 ViQsz6Rgd5LAHTW+luPwAwI0GVW+8O+ncw5k4rigTo+hWItwpJOYBNG
X-Developer-Key: i=admin@roadbobek.com; a=ed25519;
 pk=TcWSTwITMylwCZLYbw80sv2LQx1zButqiT90TFVvhas=
X-Endpoint-Received: by B4 Relay for admin@roadbobek.com/20261117 with
 auth_id=1548
X-Original-From: Bobek Brzeczyszczykiewicz <admin@roadbobek.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: admin@roadbobek.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Bobek Brzeczyszczykiewicz <admin@roadbobek.com>

In sun4i_usb_phy_init(), the needs_phy2_siddq path enables phy2->clk2
to access the REG_HCI_PHY_CTL PMU register for PHY2, but then disables
phy->clk2 instead of phy2->clk2.

This leaks a prepare/enable reference on phy2->clk2 while prematurely
disabling phy->clk2, causing a clock disable/unprepare underflow when
sun4i_usb_phy_exit() later runs.

Disable and unprepare phy2->clk2 instead of phy->clk2.

Fixes: b45c6d80325b ("phy: sun4i-usb: Introduce port2 SIDDQ quirk")
Signed-off-by: Bobek Brzeczyszczykiewicz <admin@roadbobek.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index a62558124d2d..6e35eb77c879 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -318,7 +318,7 @@ static int sun4i_usb_phy_init(struct phy *_phy)
 			writel(val, phy2->pmu + REG_HCI_PHY_CTL);
 		}
 
-		clk_disable_unprepare(phy->clk2);
+		clk_disable_unprepare(phy2->clk2);
 	}
 
 	if (phy->pmu && data->cfg->hci_phy_ctl_clear) {

-- 
2.53.0



