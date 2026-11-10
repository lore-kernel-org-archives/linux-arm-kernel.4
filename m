Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C8E60A261D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 10:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mSQ9h/py;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=edt3XDD9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=g5RQKUG5bh8bp1Y7KkAg3WudRjo1nNv/KFbkLN7VwaE=; b=mSQ9h/pyhuM35vgIIfe7+B054e
	EyQpChHKBzCbWhoD6sFUBOEQHaWpo3LRpuBhEtsW7OlPi9KJX3xGI9EiaV6BFzzX637aVZtinYB0v
	J68eTh17xTnlf5zbyuOg9IReDNFyhV40ZEqi3J99bsJF7mmGfdrHKvDhl/eC191ia9C2saq5VbfuN
	Zn9Gq+639M7TxeG1mP62BuNzm0PsMbNmbWto4rttvlxwAVOk9nuFQqOXYyZWGnM+EjH6AoM669yLT
	idn348cGKuzrSLKgjuYG0kMm7VncHMr8vMZfKdiAiI/ax4LD9Mq32Za2M7m7wS4uLKFN2Ufx47344
	s+C6/66A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjFv-00000003TYb-3oA8;
	Tue, 10 Nov 2026 10:39:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjFr-00000003TUb-0MVF;
	Tue, 10 Nov 2026 10:39:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 26A9A6387C;
	Tue, 10 Nov 2026 10:39:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794307145;
	b=GoIImfyIRoYg7sTzLx6OdruXOmsi5q1bwxY52A79qC7zq7OHrTSom86lC+T+JdmJ4Rh6
	 gAQRmbNRhZLaaoQ3sHARqvP31/LjBpzvLYp13SV/3tC+KMQPceHssjmuLJ55I1nHhVqHc
	 Yk2yqeaSZ2ctYe0YJ5nWO2ovkvZjOIi2TsBpFbhdkLEUahoqUi2oYFg7UXYBH6JZzLuZe
	 iJNMhO+SMLjdoqeljFYxLz+MNpeiNkfvqNUPeZfqB/IGX3BcGdMk2D/Y/1kECmkHz9tBe
	 YSVNp9hhpNtO/bRtQMArerPiCGp32e69SWFf6hKesmKtLe9Nqkt4fTk8pp69O0UD35w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794307145;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=g5RQKUG5bh8bp1Y7KkAg3WudRjo1nNv/KFbkLN7VwaE=;
	b=vDX8HmLCV8D+wMO7U1WzZKfuoVuYo1ARfbx8POfj5BFSoFzaX14Y3Yi6B0B4c+UmJfGp
	 izWyFwW5Y7AzKj4WCR4L7ROgIRgaYhgKvQd0NBSqGcd752RMxNO1YYEK9ZSeAxVh+oZnf
	 58iwH8j1W5Y8OmhQrzcuPXuhIUjrxZ3HOodo6n9i1+UIy3G/v9UQ92Jd7UXW0B+kAIfHZ
	 iNJcYfCD8Inz6h2JfA2UtfzX+26q4AMj9QMiY7+/8JUfYaJP1XFWQm+RlMO3O9WiPbOR3
	 Zkbdatz19yEy3bR8Guk1UM/GTcBBhJIVVgCrTeMO40Jb0qiZvNAWvZAMUYC2wB4U9Fg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D73591F008BC;
	Tue, 10 Nov 2026 10:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794307145;
	bh=g5RQKUG5bh8bp1Y7KkAg3WudRjo1nNv/KFbkLN7VwaE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=edt3XDD9mNaeibOSvdmf4xo+pLavm+3qXiIiXpqa+5Ihm/vdh83E07bml/KApz+Kh
	 LxsevU9KwRLea6mzmJrCU9Eq+Gvs5wka/I527E9/QECgvROZ27cPxODEZlqUQmWzSq
	 EBBWSEbhXE5mLDuAcLbxGK1Bc8egVwkHdKd/pAm0wZWa2OK4c6g7YorfnOEX0b8i0r
	 bnGdZeCeFyY8hDyF8J2G8/3yXmFK19a8HWsjzX3g4eDJUkgTYLGMfCjOH+G56tRmkY
	 KzTeYh/EDDRjjrKW0dUadgjuz8mmH/EEhSS+dpbUNN1Uldbt6GOJelaw3J6KNd3ayD
	 vLDmMb1kaIP/A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 64B6F48AFA;
	Tue, 10 Nov 2026 10:39:04 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 10:39:06 +0000
Subject: [PATCH 3/3] arm64: dts: rockchip: Mark the Orange Pi 5/5B Type-C
 port self-powered
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-tcpm-attach-reboot-v1-3-7657cc1e2dca@gmail.com>
References: <20261110-tcpm-attach-reboot-v1-0-7657cc1e2dca@gmail.com>
In-Reply-To: <20261110-tcpm-attach-reboot-v1-0-7657cc1e2dca@gmail.com>
To: Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794307143; l=1209;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=z+vxGhU01KVE5a3ZqBJ+uJfWrWfvjtfbECzmzBJv814=;
 b=xRGXBDxcq1rtQtvPBSmY6c9nPZGec9E/oqmuDrREyarhSKPghY6jUNc9pw5Z7FO5MVhqW8bgx
 x3+AsXJbZyeCCMfqsaVtE742F0t4NQQBol9+ZKjFUGtI6E1xkkfMeMb
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
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
Reply-To: aiyengar1990@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arun Iyengar <aiyengar1990@gmail.com>

The board is powered from its separate power-only USB-C input. The
FUSB302 port's VBUS comes from vcc5v0_sys through a load switch, so the
board never runs from this port's VBUS.

Without self-powered, tcpm keeps Rp on CC during PORT_RESET (error
recovery), because opening CC on a port-powered device would remove its
own supply. With self-powered, the port opens CC for tErrorRecovery
whenever it resets, including at boot. A partner left in a stale state
by a warm reboot then sees a real detach.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
index 6e081bc06cfe..b621fc8638c7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
@@ -117,6 +117,7 @@ usb_con: connector {
 				<PDO_FIXED(5000, 1000, PDO_FIXED_USB_COMM)>;
 			source-pdos =
 				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			self-powered;
 			try-power-role = "source";
 
 			ports {

-- 
2.55.0



