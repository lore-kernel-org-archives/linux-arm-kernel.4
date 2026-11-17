Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C85D606A890
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 13:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AbK1m3Fi;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LRM0eYzw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=XgOJof+TBeTiJZcdxs7bxkbtxyWej7BoJRUS68w6H2Q=; b=AbK1m3FiSrM3u0Y2mBUVIIspJm
	9nV6mvYa6/BdH9GfyLH9zxNjps0vM30DIbjuY0E7tLV4LZPiqLSQ6n7r88h/ASBS06hsoQwQGHVx5
	v1wZVt0zWslre4CuHA0tNACkf3qfli6k7r+3N+DAIdSX+/2hcDt05IXHnblZo8z52QDt6pIHS0nOq
	GKXnKk1AkxQtrTe+Wh6qb5fU2wB1VbNNadr6peKPCvuzjuljqWjx99GduVhQQNvfcsNYPP2EdysQD
	4HXmcPREIF1iZrXb7Wr1eU6aq0cPHrAoDvVLkoKciflBm+qA5mDSBDod0MkIylIL5EiuLEmN8H0ls
	gJipbaLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTInT-00000005nO1-1f4x;
	Tue, 17 Nov 2026 13:00:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTInJ-00000005nHK-2Fvo;
	Tue, 17 Nov 2026 13:00:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BBA4F61877;
	Tue, 17 Nov 2026 13:00:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794920416;
	b=zSmKHEXtxQt/+MvJ0RLolmLEWR7RT41/nBUr+EjZ7Xgyx9jBFdVqEt9X0+mkPfKicZUX
	 978lQmGjSseQb0wdV7EEOpPsul13P7ou764pUm5WZbNrFy78r9PTpuk9XipMkzTMG+BSs
	 LinGxCiS2gassVwxUbFDsIxDD1fmTlCOBEkJcThbRy87iIZe4k6EeKHnYKlkOTxMM0Y9v
	 M2I/puBYEGOrGXQIKRY6kJpXp/qpYxshT44gSNArxrNEw+IEMB97Ga938+tqqQkP97F9x
	 c+UXh6wztpEXxP0PjOMYiAUwlivsux21TIfx32Ocpev2uY3VbtU53Jq2h43kBIVs3Mg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794920416;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=XgOJof+TBeTiJZcdxs7bxkbtxyWej7BoJRUS68w6H2Q=;
	b=lMPv100zQGjZPcmX1NTHFF1URhvM36LPUNYNRaU+n3j5up0D90/pZdCKcppklDGZsKOT
	 x4kw8LNi/vCRPdeoSXQ6xHo6ng9EJRiM0yLXfF+1fGwFvJFUK5ABA0mFPNyNHeb/FiFo2
	 NpmJ1SSY+enAxSdThRCv6AjAew69MRAdsDHyU9ak6wt4WUU8084G0W4vkPfNDvGkBi1yc
	 tV8aZw0MJFt4/crfIRVdMwOnsYLzzmZHsh69Ajol/nHxDGXX/sGeRNT9I3d2lBjDYSN33
	 zrx48RkRTM8wN+1u8tn9Ll+QrQqk+UvfrnRp2O1VnWfDzTeLNC5rTibtcjsS1y11h5A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D820B1F000C4;
	Tue, 17 Nov 2026 13:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794920416;
	bh=XgOJof+TBeTiJZcdxs7bxkbtxyWej7BoJRUS68w6H2Q=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=LRM0eYzwOyBZ9kI/df1WB1+sh0xJv3tEkhXiKeeb6InTgmr8QndbQVxa6mnPrtxYw
	 sLbos+J3qQcTdC7ZU5HqUhxYayzibNFtHNs52diX6Cfd789WQ8K4SREdk3YMSnaeWn
	 +cZZYFu9Rx2cf39GOW+w7BLO/PbRC9XsAwdShIIDdira02JHQCElG9LeyZshK+e50N
	 Gmho8NPdlO5itXxFFnpQvwhVurdeEPc1aUZrKrs2Y1KeHkCC1HGFe+Ea6itlUQPC1I
	 bpalu0nqEgQ8K9JmvePFnTjmbUCkSLhXpzJeE/FWXDYJU+KZ90JTrdb2hbmuTN8+Tk
	 1rMiyx5gXX+tg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 63F434A966;
	Tue, 17 Nov 2026 13:00:15 +0000 (UTC)
From: Roadbobek via B4 Relay <devnull+admin.roadbobek.com@kernel.org>
Subject: [PATCH 0/2] usb/phy: sunxi: Assert reset before deasserting on
 init
Date: Tue, 17 Nov 2026 13:00:41 +0000
Message-Id: <20261117-usb-sunxi-reset-fix-v1-0-c2b76e0e84e1@roadbobek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAyF4atI1g0kIkp7ldLF6ESbLkaZOCLI3
 N3RLr8H7z/AJKoYvKoDomxqOocCflQwfF2YBNUXQ011y8wdJuvRUtgVo5isOOqOnh0RcdOQe0J
 5LlHKfFffn78t9T8Z1isFOZ9oWflAdwAAAA==
X-Change-ID: 20261117-usb-sunxi-reset-fix-d1a0001440a9
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Roadbobek <admin@roadbobek.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794920443; l=1351;
 i=admin@roadbobek.com; s=20261117; h=from:subject:message-id;
 bh=drgXmTq72phIRmNvyMX2CDu1do9KMGWYoHNHUWHEvOM=;
 b=O92oU708WlHpNSGxF7degjuQB97mTvheQN/ZlYsp/q3UhV1O1Z4f8NqTM9ITdYpochLBYE2i2
 +ib9LHxsVf3A8M3Xui056AQmxxvlvrVW7eKBBCCdThRWSO7dGe+ggya
X-Developer-Key: i=admin@roadbobek.com; a=ed25519;
 pk=TcWSTwITMylwCZLYbw80sv2LQx1zButqiT90TFVvhas=
X-Endpoint-Received: by B4 Relay for admin@roadbobek.com/20261117 with
 auth_id=1548
X-Original-From: Roadbobek <admin@roadbobek.com>
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

When a bootloader such as U-Boot (for example with
CONFIG_USB_MUSB_HOST=y) initializes USB host mode and boots Linux
without stopping USB first, both the MUSB controller and USB0 PHY
reset lines are already deasserted when Linux probes them.

Because reset_control_deassert() alone is a no-op on an already
deasserted reset line, stale hardware register state persists across
boot. On Allwinner A33, MUSB stays wedged in a_wait_bcon with
DevCtl=0x99, Power=0xf0, and a frozen Frame counter even across
hot-unplug and replug.

This two-patch series briefly asserts reset before deasserting it in
both drivers so USB starts cleanly regardless of prior bootloader state:

- Patch 1 asserts glue->rst in sunxi_musb_init().
- Patch 2 asserts phy->reset in sun4i_usb_phy_init().

Tested on an Allwinner A33 Q8 tablet (Laser MID-786).

Signed-off-by: Roadbobek <admin@roadbobek.com>
---
Roadbobek (2):
      usb: musb: sunxi: Assert reset before deasserting on init
      phy: sun4i-usb: Assert reset before deasserting in phy init

 drivers/phy/allwinner/phy-sun4i-usb.c | 2 ++
 drivers/usb/musb/sunxi.c              | 3 +++
 2 files changed, 5 insertions(+)
---
base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
change-id: 20261117-usb-sunxi-reset-fix-d1a0001440a9

Best regards,
--  
Roadbobek <admin@roadbobek.com>



