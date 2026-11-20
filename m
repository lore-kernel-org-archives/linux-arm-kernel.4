Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F372C606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 11:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jP4x0FOz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R24ohYu5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5sTfjmvRmInRg9bzSas7Pj5tLY1aYw/Q3j6D0qSG5DA=; b=jP4x0FOzP1vid7vWuKGRdSLhro
	MJSlhqgVQg238t9VM3EA2r4HcOjeCsRu50pjx6UxjF3sXbMz27afgxca0aBxNdZAhcQWcCdze82W+
	DzUFiOYOJdjIDyf0zybM1A0FMCz2LnYmHhrJOf/pLext/aQkTgjpQ2Y9JwJveG45TRKE43bL/Vy0H
	x/rVkBFCIfc/u11vSdHkvTioUVSKdcfTB0/3kuOcw0apBL8OU9G344huXoZk+/MY6bXqpdpDleOcD
	3212Qlbibg4OCD6IFU68ss1+mvKOJnKXpwC7C3LwKYLPwj2fVAFOdmVHO85S7TXwyVyfOJSPb6ch1
	0POVmGsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMzJ-0000000Eq10-1mY1;
	Fri, 20 Nov 2026 11:41:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUMzD-0000000Epx2-0Pne
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 11:41:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C3456265B;
	Fri, 20 Nov 2026 11:40:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795174857;
	b=fUGt+OKQRNKz/1th9wppEZt1u8YXemp90wMSR9TauROKSI9EWd19ntEayufc3xRf0wkY
	 niFaACZZlBSUUSrUYdNqf3F3odmywYpf0pobgsF6PotoQjRfT75orYLfWeiY1MHb0XpzX
	 2Cr3Wx69TveAvWzUDkZl0G72T7i/M9k6tnrvGgZZQfkFnvvDjmS8W4b+zuqHjLbAUX8al
	 9eBAvoWOcn1TnD/XAi2FRn+IgJV0psCwaPEqijmNF9tnotAXv8aVUd0z4pCfucTMO2V6/
	 9t524WrG3VJPGMmLoctGyhrtEZ/hBW+CBwF+VCyP5APO+5PKX7PLALxvlsDPpW07f1A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795174857;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=5sTfjmvRmInRg9bzSas7Pj5tLY1aYw/Q3j6D0qSG5DA=;
	b=o41U0kZrcYis4PmfFam5gh0uK1m+Of+zV8EMIQhpL3DVVKPYuDLMXCb2mrPeWotGtg3j
	 RrMKELRUMSj3IevzY9tDjUgy5BrYJdb3s9UlkCkgvUkC/7mfS0bhN7HZWQO3kic0A+VxS
	 Q8wB8iCgBigBH3JKu1IJjVOHxtNK6g7cR4a8U0Juh8uQY3j+gaZ6o3/xf9Wd99ISNY/Gy
	 7k1x4pczKWcKQ2VMiaS65kITtjdZTdSmGq79yCexqBFGk+W5p2SacfkxwHGJ2nh8TphxM
	 PAL9l96Bi3OKJHSv2bqniBekwBgzKdPhaLXkdXkM0CsopcjmZuCVUOjVvlxoKcbv3tw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 352CB1F000D8;
	Fri, 20 Nov 2026 11:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795174857;
	bh=5sTfjmvRmInRg9bzSas7Pj5tLY1aYw/Q3j6D0qSG5DA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=R24ohYu5kb/29/Mjxeu6qbnW+AxltB3RBuDFqYc9cz9O+2PUIVz+CW8SfGWTA7I7p
	 3Wvp0HRdKK2OnxhUZBSS6yM8MPtMHQByDGg8vqUsjuOGdkqR/h19QTHdNoilLCCckA
	 xMGl9f94+TSatX/2i/T9/i+zzOoULO0PIt+N9DUF5750Ga18xe6l6/cuOvGUz6vE30
	 VKdt/DWsqNxI3g4V5LX6wujxEW0uR7EOLyPd9ZVACsJtbd/U718LYKEgB8CCDVdGqn
	 /0VoLij2eP/LfcNMdBywNI9flmQELRS1sBD9/sAH8JHc7598UXhxIpEBvtuvwS8XnV
	 Ni3sY3SyswH9Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C039E4986F;
	Fri, 20 Nov 2026 11:40:46 +0000 (UTC)
From: Ivan Pfarher via B4 Relay <devnull+ipfarher.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 12:40:47 +0100
Subject: [PATCH 3/4] arm64: dts: allwinner: h5: orangepi-zero-plus2: Fix
 USB peripheral mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-orangepi-zero-plus2-fixes-v1-3-ecd792189f27@gmail.com>
References: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com>
In-Reply-To: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Ivan Pfarher <ipfarher@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795174845; l=2079;
 i=ipfarher@gmail.com; s=20261120; h=from:subject:message-id;
 bh=xNp8GjP59av7t0jD0DKAR+qLGNBv0iVBKlMlHOJX/bQ=;
 b=LYdIeAg0Z6D9hFAlocH2PSZCyaBHHy6WLerO7QNpZyL8gPTX5MGhRlVA/p/PhMwtgBawPihCa
 rdmDDcSs/jAA4Ylcsg0pIyPD2nV8r7aCpwj4HNwPn8qfRJX8icDs9kq
X-Developer-Key: i=ipfarher@gmail.com; a=ed25519;
 pk=3DMYyz/xl+KRAx2TNGJpheG+5QUm7lqHhKXFqVu2TmY=
X-Endpoint-Received: by B4 Relay for ipfarher@gmail.com/20261120 with
 auth_id=1582
X-Original-From: Ivan Pfarher <ipfarher@gmail.com>
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
Reply-To: ipfarher@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ivan Pfarher <ipfarher@gmail.com>

The micro USB port is set to dr_mode = "peripheral" because it cannot
supply VBUS, but EHCI0/OHCI0, which share USB PHY 0 with the MUSB
controller, are enabled too.

When they register, usb_add_hcd() asks the shared PHY for host mode
(since commit e671765e521c ("usb: core: Try generic PHY_MODE_USB_HOST
if usb_phy_roothub_set_mode fails")), and phy-sun4i-usb switches PHY 0
to host ("Changing dr_mode to 1"). MUSB then stays in a_wait_vrise, the
UDC stays "not attached", and a gadget never shows up on the host.

The port cannot work as a host on this board anyway, so drop EHCI0 and
OHCI0.

Tested on an Orange Pi Zero Plus2 (H5) running Linux 6.6.160 with this
change applied: g_cdc enumerates on the PC (CDC ECM + ACM), the UDC
state is "configured" and MUSB is in b_peripheral. Build-tested only
against current mainline.

The H3 version of the board (sun8i-h3-orangepi-zero-plus2.dts) has the
same setup from the same commit but is not changed here, as it could
not be tested.

This problem was investigated, and the patch drafted, in an interactive
session with an AI coding assistant (Claude by Anthropic). The submitter
reviewed the change and ran the tests described above.

Fixes: 43aad09c7928 ("ARM: dts: orange-pi-zero-plus2: enable USB OTG port")
Signed-off-by: Ivan Pfarher <ipfarher@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
index 5697251b9..892723b46 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-zero-plus2.dts
@@ -66,10 +66,6 @@
 	status = "okay";
 };
 
-&ehci0 {
-	status = "okay";
-};
-
 &hdmi {
 	status = "okay";
 };
@@ -115,10 +111,6 @@
 	status = "okay";
 };
 
-&ohci0 {
-	status = "okay";
-};
-
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pa_pins>;

-- 
2.43.0



