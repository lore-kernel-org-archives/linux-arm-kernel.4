Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9449606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RFobLYQd;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=Q5MfeYJA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rOYTB/1+mPdWoPWkG7UwGHBcoYVB27IWk0cD/8rA3oI=; b=RFobLYQdB1ciM/AeTr9HzycPOf
	1HnySWY4+HIicUoOEZ8bkoQAzmMK0wLfAeaNSxu8LQqXoWY3EaBT4gHcR525/uXPSH6Q750wWO4ri
	t3SZAUzYzHtREhqdfaTGlbMY9wedo248hg3PRhQcDWVQcdX+D+Lo/HTNInB9CuNq0mmhJZMmoRYUm
	m+9NY3QCsVIQuMDRq2cW1MbRvEnzHpyAT7QWwyzEUT0NgKbnUkL9iDnKoL00PIOHjGkunYM2hfJ+y
	iT3AcwKUpXjqe2k7MYtALnmykEXSbjQn4qG4vPsgKzRQPduGLve5Cfh1de/jEhHqCroye4t351Y4w
	04tZmn0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU80E-0000000DERl-1M5i;
	Thu, 19 Nov 2026 19:41:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7zz-0000000DEJp-2VP8;
	Thu, 19 Nov 2026 19:40:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795117245;
	bh=2RRmgDRTmM8f1Nx5NZs/v1FBrq4UA8t3h491WExW2gQ=;
	h=From:Subject:Date:To:Cc:From;
	b=Q5MfeYJAJeT1+DG3QXoXjnStx6S6D6ovVWen1OzNZ0rbVxmDMiFohTUd5Vnl2sbqk
	 03RcwJHUEenUVO4iWu2x2cZUR0TG4NqIGNGeXd8cmA6x0vyOxKyy/KoatOn1cQEtMG
	 RYsx+Rfr7xgzNXI3Nvn2iH8wsMD5b+cH1LM701LtYTQVfkJReYHDiYFxQaAEOcc9ak
	 Ak1vAGQO62vgVIPErYI4fHi+ACAuDdAyvepwELZi5Br5d1VBJAAuyBs+ytyNJIHTM2
	 X5pVUynMHv5kgNZtffvN3gbyu7/U9VThQc8AHv+YH9+Mm4VtsEwfrHzr/kkZcXCcbf
	 Xh+Cy+y/GYgcg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EB54A17E07F6;
	Thu, 19 Nov 2026 20:40:44 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id AF53D48002C; Thu, 19 Nov 2026 20:40:44 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v18 0/7] phy: rockchip: usbdp: Fix runtime muxing between
 USB3 and DP
Date: Thu, 19 Nov 2026 20:40:28 +0100
Message-Id: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-0-fb325e336494@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42Q3U7DMAxGX6XKNZmSJenPrvYeiAvHdbZAt5akL
 aCp707aTYDKJLiLI/scf76wSMFTZLvswgKNPvr2nApZPmQMj3A+EPd1+mBbsc1FJTW3mocWX/D
 oOz5EW3ccG4Lz0PEOQq84IhRClYosKZYoXSDn3xfF49O1joN9Juxn7K0j0OuQ3P21jZ0oRljUu
 2wWS7kS12+ovqtDMxAfZcUFt0XlrHHa6i3ssW0asG2ADban2WQhEk/vk+932VhsEhElm7c6+ti
 34WO5wyjNssUtsvkzchpI6grqSoA2eWXUSj0bRpn/oCrxD2o+B0KptSsFONR3qcUX9deV7lOLR
 JXgjDN5rkVJa+o0TZ9+f08fFwIAAA==
X-Change-ID: 20260914-b4-rockchip-usbdp-cleanup-part3-cca70383ebe3
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4161;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=2RRmgDRTmM8f1Nx5NZs/v1FBrq4UA8t3h491WExW2gQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr/ULxO5rCp/sitnd4sZyzapwkLIi8wdq7S4
 gNuCLHV2RV+M4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq/1C8AAoJENju1/PI
 O/qaH98P/02156aO4krvFdBg2Na6SDrGbXpI2p3k2gkPrDfg4RW2dcM28mwrE24aHlpS8iIb6EP
 PM24Yru1+Shh3u9nmXc98wTmNLnzXf3Iid2O1yn8t9SdZg3OYux3d4+pCuOqNY6Lk2SzIcJFFiu
 cbaflORp0fllAiqJRJIfQm2/x0E1mKI3AXSoMfnj7CMLp0/cHAuQzJ30QZzx2X53n3wJwj73HHn
 59x7v8XYdJWQDV06WH1TYusnV0aONJ1lnqBVy1Pqabp5qbBP+VvTXlemeSTq8tiroRoiLIAPAL1
 7tvR37qMBQzdNkcjYGKYyb2Kmnvn9JsDs9k7PdqGWVQvo711YoKrMLNVBQhxjbqcQSfxn+Cs3Pt
 pX/B9ofTURzoXHOlLemeps0I8OOwq1+hzVZhfqPEXPaAm9gyCI0V0o5S8JXN4zQYfjvvwVcfNWV
 333aiKFoEh0o5ndcrTpNHye1UDwGKkA6BjKIZdohxemab1MpuKmluwiwOolIzecr40HOe0HbAaj
 rWKJm1PvbCLYQbi15Plxo/RUvuO8KsWCk1ua5584CVMHo2k67EtoJGEKIKWqk7Ir2KnbhkS1uw/
 vgrrKsGTCIdvgnmC7B2BmsP/WkUJ/Ig0VqpDRvaNsHh11aL8QkdJDOOWrn0whdxG9WhaEeU+Utm
 IhfpvOdOG/tE8LefGlS46NA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_114047_819035_DCB3DD41 
X-CRM114-Status: GOOD (  13.67  )
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

This (final) cleanup part depends on new DWC3 glue driver series:

https://lore.kernel.org/linux-phy/20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com/

Changes in v18:
- Link to v17: https://patch.msgid.link/20261114-b4-rockchip-usbdp-cleanup-part3-v17-0-1af5f566408e@collabora.com
- Ignore Sashiko report that rk_udphy_u3_port_disable() is not called
  when rk_udphy_usb3_phy_exit() is called. This path ensures dwc3 no
  longer accesses registers (Sashiko)
- Ignore Sashiko report that the orientation switch event should also
  update the power state for setups with orientation switch enabled, but
  mode switch disabled. Currently upstream has two DTs doing that and
  both are incorrect (i.e. mode-switch should be added). Considering this
  is a pre-existing "bug", it's better to fix these DTs (independent of
  this series). The mux is necessary to support 4 lane DP mode anyway.
  Basically orientation-switch without mode-switch makes no sense for
  this PHY, because orientation-switch already requires that all 4 SS
  lanes are routed. DP AltMode also requires the SBU lanes in addition,
  but there is no reason not to route them when the other lanes are
  already assigned. In the unlikely case a HW vendor failed to route
  them, adding the mode-switch is still fine (e.g. it also allows
  switching between SAFE and USB) anyway. (Sashiko)
- Fix PHY clock leak for high-speed only mode (Sashiko)
- Ignore errors in rk_udphy_dp_phy_power_off() and
  rk_udphy_usb3_phy_exit(); when PHY is powered off, no failures can
  happen and when PHY needs a re-init after the exit, the error is
  effectively for the other PHY. Thus avoid propagating the error
  (Sashiko)
- Default to TYPEC_STATE_SAFE to avoid one extra useless mode change
  (Sashiko)

Changes in v17:
- Link to v16: https://patch.msgid.link/20260930-b4-rockchip-usbdp-cleanup-part3-v16-0-bc144f80afc4@collabora.com
- Rebase to v7.4-rc1 and v19 of the glue driver series. This drops
  the first patch, as the PHY reset notifier has been replaced by
  direct calls added in the glue series, which now also introduces
  sw_mode.
- Add one more patch to gracefully handle DP lane remuxing after cable
  orientation change when the DP controller kept the display output (and
  thus PHY) enabled even with HPD=0. This can apparently happen with
  some DRM compositors.

Changes in v16:
- Link to v15: https://patch.msgid.link/20260915-b4-rockchip-usbdp-cleanup-part3-v15-0-9ad90a456953@collabora.com
- Split out "Disable USB3 port during normal power-on" from first patch
- Collect R-b tags from Mani

Changes in v15:
 - Link to v14: https://patch.msgid.link/20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com
 - Split the series, no patch changes in this part

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (7):
      phy: rockchip: usbdp: Disable USB3 port during normal power-on
      phy: rockchip: usbdp: Drop -EPROBE_DEFER hack
      phy: rockchip: usbdp: Rename mode to hw_mode
      phy: rockchip: usbdp: Fix power state handling
      phy: rockchip: usbdp: Re-init PHY on mux change
      phy: rockchip: usbdp: Add USB-C state without DP enabled
      phy: rockchip: usbdp: Add DP lane setup to power state update

 drivers/phy/rockchip/phy-rockchip-usbdp.c | 240 +++++++++++++++++-------------
 1 file changed, 139 insertions(+), 101 deletions(-)
---
base-commit: bc71431221f5ba8bb33918399552636e059c2c45
change-id: 20260914-b4-rockchip-usbdp-cleanup-part3-cca70383ebe3
prerequisite-message-id: 20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com
prerequisite-patch-id: 4fa3aae8ccfa5383522070179c8777302411082c
prerequisite-patch-id: 0cfab94fd67b6304cd303a9810981aaca328c651
prerequisite-patch-id: c2e1c453454a7589a691fe391dc79e86f09ca7b7
prerequisite-patch-id: dadeaf9e369e04d8b3329493a1a0756ddd6140f0
prerequisite-patch-id: 2c727b8400980c760ca8f1e5fd989a3bf9404020
prerequisite-patch-id: cf4e7d51c77a5eccda6c687730eddd3135d94d91

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>


