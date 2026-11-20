Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1532E606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 00:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oy2iyfN/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AVzC1pqe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=06XIf4D6mSmxSRM87PPvsuohF9WiWE8VJBFQty+Jsbg=; b=oy2iyfN/ohTrGJhWXlWP+qd4vj
	L5mbiXrb3uPlWniDD4oFu5pp24Ul0r65AOWA+nLhEtK16sjiwom/qQZMEz4tqwBOQBfSND/+6vjc2
	Vop6u/XlPFib7aHE9mrVd3c/aCFFeyMghbC4nS5AI1sDAZBryO0Yh5lUVYPG14NndYgzgwBrgiOi+
	LUNCcdi7cGUwjW6PmH2v1H51ZjslmrnnlC0BFJYSqLYYxeJPpcFLBhdKugryx30ekTM2JqY6Iv7is
	8yGTZImJh6P+0LKMJbkUinagZQx7p394cipUUCX2lZsKYsl5TSEXx8ulPXppYzy2M5H823TQR6K8A
	e0giQVzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUCf5-0000000Dl4Y-3qQI;
	Fri, 20 Nov 2026 00:39:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUCf4-0000000Dl45-3AK0;
	Fri, 20 Nov 2026 00:39:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 834C244E36;
	Fri, 20 Nov 2026 00:39:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795135170;
	b=hl85o+DYYlrYQbF3okZU7Nzrb4sf9AUKvRk0caygJ5Jss+uhZSQQWpdOuL/YP0Er4yIv
	 tk5H7BLYZXD1eP4Uas2zRe9aqd8xdBSUBuLedqE3KDec+pWTbFrMrCN/NMkgTkH2lkclF
	 zgVDqBAV68PBfM3x4se6azOzQ7SGkE8pe3N/qp7kQq+rN84U6SOiIvOwFKMxVP6d7gfg2
	 MiDeIJXnGQ33fVLEnVKEM8J/VvTjtaZRCVWGjzfeNx2qW1L96noUgb0uRgQrM8eql90oV
	 XkOULXNaf2Lnfrppg4y3IFr3sYrQTgPZQOuPdmejC6+HVNEGifUO9WLO5/1T3rcJHYg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795135170;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=06XIf4D6mSmxSRM87PPvsuohF9WiWE8VJBFQty+Jsbg=;
	b=cAHUPflqo4rCJJdeV01+OGEdj+enG3B6r5QaL5EuTA1rm4BxH1hp4Pg/6NzLY9Yg7mZo
	 HZH/Wn8RsuD9iizGFFWp4CD88rOuzYxlYYrCV1gipaH5DrTCogv1LyNfm/pDGUIFMVqsQ
	 TQ6Ti92FcFm5bdPaeojak0ZuKXwyoIj7kOiyerACzjJwMNw+Chvn6+Xc7IS2D02Mxmedh
	 SYGvEZb/kxIw7+FsWufEYbnW08fJzivqaXO/o0vjjsmgqWH/IBVzBIkfN1Q/qar3pexZL
	 wTzGUZ/aQigY8NA6T0kOv19ITEZh1o/OpIRHiKFpbk4OXgr9AbtopAR4x80KpFsCrpw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C92B51F000C4;
	Fri, 20 Nov 2026 00:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795135170;
	bh=06XIf4D6mSmxSRM87PPvsuohF9WiWE8VJBFQty+Jsbg=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=AVzC1pqelpZDFsuL0+8rTC44215b/ZfeEs4JIrzxvwiYXNnl/O4pAvGgqodH8pVWa
	 cc7anPRTpfKbaII7D1+GjySbDhSF0cH+Vm4YGwDn+uo7C3kib5G6fVvom6H6gwSJaa
	 vkNy5CH++wGn8EHBLjly0gBSDy8axCF/qjyrJWCiCucJC2JoszZToBrcqF9AgMEKFz
	 ymH9aFiAiZ+yGINugFO+gdJB4bBkNXdBKVy5q+TQ+BMQVa86YyjNjDN5f+4mp731Zy
	 FhRVWNw7TxyHiXKZR2gUl488HlxlL4iTm/a7hZvWxjQJ8reUWnYmX/Gta7LV8Lt+xW
	 Pa2aK3L75ZF7Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 561F842503;
	Fri, 20 Nov 2026 00:39:29 +0000 (UTC)
From: Ricardo Pardini via B4 Relay <devnull+ricardo.pardini.net@kernel.org>
Subject: [PATCH 0/3] arm64: dts: rockchip: Add Mekotronics R58X-Pro
Date: Fri, 20 Nov 2026 01:39:26 +0100
Message-Id: <20261120-rk3588-mekotronics-r58x-pro-v1-0-4e70c077c7b4@pardini.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL6W/2oC/yXMwQ6CMAwA0F8hPdvE4WYWf8V4GFvRStxIC4aE8
 O8MPb7LW0FJmBRuzQpCX1YuucKcGoivkJ+EnKqhPbdXY4xHGS7Oe/zQUCYpmaOiOL/gKAWdjX0
 Ktks+WKjDKNTz8tvvj7917t4Up6OEbdsBGklNMH8AAAA=
X-Change-ID: 20261118-rk3588-mekotronics-r58x-pro-54cfda4bd8a4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Ricardo Pardini <ricardo@pardini.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2290;
 i=ricardo@pardini.net; h=from:subject:message-id;
 bh=qkeBb/nL37zpe/lCO/iNX9Ueu125W6clmIxV9IQB1Tc=;
 b=owEBbQGS/pANAwAKATteP+Oex+3pAcsmYgBq/5a/rKyFUzEa+akU1CoUICGtE4RZXisRa4iEo
 DiAG/Yw1bSJATMEAAEKAB0WIQSsGCMM9q/qytxIiJM7Xj/jnsft6QUCav+WvwAKCRA7Xj/jnsft
 6XrGB/oD0+HisA/tWCn9MPRMdhZzKXzX8CaKmRHlythf6+qJU/bdGa2w53MFO7AMhGfHJ6ll0VX
 tlRUrp0L/V4oLavjBeCdHl0DmaS/F1GO2Z1mpnIiaWI8wsTGco8BU70XsLRtwneMbb3CQqvQEuk
 9gsTZMzzU3BZGRwR/KqeCn9CyMobM89ln9N+I/fPVBiqy/B3yQwgWJQLN6hNGD1ffm3EkFPI3+u
 8k4Nb46tsnOlVWfXZUV7IpuE32nQ/k6/jU7iZqOazzldt1tNaMQHAzieVXwsTdvojsCnJ4or9mm
 e6EI/qkLtQ7WBZx6PKLUOK3DTC7B9iVwG1P8ud3++AJ3ohvD
X-Developer-Key: i=ricardo@pardini.net; a=openpgp;
 fpr=AC18230CF6AFEACADC4888933B5E3FE39EC7EDE9
X-Endpoint-Received: by B4 Relay for ricardo@pardini.net/default with
 auth_id=588
X-Original-From: Ricardo Pardini <ricardo@pardini.net>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: ricardo@pardini.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds support for the Mekotronics R58X-Pro, an industrial
mini PC based on the Rockchip RK3588.

There is no public schematic; the DT is based on Armbian's and on the
vendor BSP DT.

dt-check-style --mode=strict is clean except where the existing
rockchip DTs differ (pinctrl-names first, no blank line before status)
and for names fixed by bindings.

GMAC0 gets RX CRC errors with rgmii-id under iperf3 load, so it uses
rgmii-rxid with tx_delay = <0x44>; GMAC1 uses rgmii-id.

The Type-C port is source only (the board is powered from a 12V barrel
jack). usbdp_phy0 has both orientation-switch and mode-switch, as
asked for in the cover letter of [2]. On its own, v7.4-rc3 brings up
USB 3.0 in either orientation at boot, but when the cable is re-plugged
the other way round, the SuperSpeed link does not come up until the
USBDP PHY is re-initialized. With Sebastian Reichel's pending DWC3 glue
[1] and USBDP [2] series applied, it works in both orientations on
hotplug. DP alt mode is not described, as I could not test it.

Tested on the board with v7.4-rc3: it boots from eMMC and NVMe, and
both GbE ports, USB 3.0 over Type-C, the HDMI and DP outputs,
headphone audio, the RTC, WiFi/BT, the LEDs, the keys, the GPU
(Panfrost) and the NPU (Mesa Teflon) work.

I used Claude for cleanups, ordering and naming, according to recent
series lore.

[1] https://lore.kernel.org/all/20261114-b4-rockchip-dwc3-rockchip-glue-v19-0-b79fb5f4b42a@collabora.com/
[2] https://lore.kernel.org/all/20261119-b4-rockchip-usbdp-cleanup-part3-v18-0-fb325e336494@collabora.com/

---
Ricardo Pardini (3):
      dt-bindings: vendor-prefixes: Add Mekotronics
      dt-bindings: arm: rockchip: Add Mekotronics R58X-Pro
      arm64: dts: rockchip: Add Mekotronics R58X-Pro

 .../devicetree/bindings/arm/rockchip.yaml          |    5 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 .../dts/rockchip/rk3588-mekotronics-r58x-pro.dts   | 1215 ++++++++++++++++++++
 4 files changed, 1223 insertions(+)
---
base-commit: 23c62304dde29abe92013d85910d03a77dada35d
change-id: 20261118-rk3588-mekotronics-r58x-pro-54cfda4bd8a4

Best regards,
--  
Ricardo Pardini <ricardo@pardini.net>



