Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE4F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JnLuyhli;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zGVPylVz;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=z6OGt1MW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=d55epoljK1Tf/mPwC6cgkqeJkTdDg/qv/INdlRtkfDk=; b=JnLuyhlivqxh7p
	0vhco4ALzC9paOk1O56StzJWsFHUQRWzEHHwGlDoAbzIFVCtPI6JRH9Oj0avtnje2qem4Fwh26p7p
	NgHQr+t+rw/0m3npBcEhZJgX8kUkhCU/m6i1NWiDxa0TA4yIKrWbqi14Gd4a/Dhtv53UJi/3/FqWF
	34O3KQBT47h4rtT0enxK6Rjafi/TfQYZsKE2Mv4BNuLN4t/5sSt/MCf5zYBMh0+JXH3nMmAtJXICa
	skz+4GnFX2nIw7XcCVjExd/kaxsjXB7l1N/f+gxjaIf+YMPURAFhJzU8yHXqHYgCSy9ouc5NInPim
	sazQDy/woR9u99tbBtog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlTB-00000003wwd-0y3v;
	Tue, 10 Nov 2026 13:01:01 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlSl-00000003wgb-3914;
	Tue, 10 Nov 2026 13:00:37 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794315630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d55epoljK1Tf/mPwC6cgkqeJkTdDg/qv/INdlRtkfDk=;
	b=zGVPylVzmg5q7elFtgMELE6tAQr5tb9qf2SfLOxfJNtwKSU3uRbS4L45y0WZ36wvKHXRtZ
	Ja/BL25NP+zMjTJSVfDUDInD15gi9T6YTYxGJOPelr7j4ijrLwLrtPlmFo5O+MvBkuJmmn
	wzjIi+ZoiOjP0FnRCnk/c9MyIeESoELvbqkHgAC2PdUJm6ujInMYtfNa8/uDDOcTqbYnfW
	feUOUK53pmAAj0tMNZkXmY6JaodrQRPKBsApKC7ERb9welzZGhwnU6OlBcb1VedbHuCGKG
	B3axyIhhSXi0mhYE/Yw/8l5Q4kbcaqPyLHGlqa5lhW2fGDhJdYJyXnpVXVSWhg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794315630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d55epoljK1Tf/mPwC6cgkqeJkTdDg/qv/INdlRtkfDk=;
	b=z6OGt1MW6zT12nOegJT9PQOQ+8TLuRJjbk3hwjt5i59FUF2uLI1e0Fcqoil/4QDlRzpOov
	5GzHqMcDI6g1dbAg==
Date: Tue, 10 Nov 2026 14:00:15 +0100
Subject: [PATCH v6 5/5] arm: dts: broadcom: bcm2835: Add reboot modes to
 firmware node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-rpi-tryboot-v6-5-56f680ef4734@linutronix.de>
References: <20261110-rpi-tryboot-v6-0-56f680ef4734@linutronix.de>
In-Reply-To: <20261110-rpi-tryboot-v6-0-56f680ef4734@linutronix.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Eric Anholt <eric@anholt.net>, 
 Stefan Wahren <wahrenst@gmx.net>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794315627; l=821;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=iW92QJbYkT2c+9COJjq6j+FezNFEwORGgQahLMmFk7Y=;
 b=rjmILPQ+BvB0ULB1nhYzHaAzVULLTH7osXnkezMYNsFFZuir0AaXWNn7vvxACsa6knI7pevoJ
 spMGAEB1QMEACE2rNcToT1RHMxDgFVhdPJproHr85DM60ETUPs+hPYW
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_050035_946623_0EEDB116 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Raspberry Pi firmware driver allows the tryboot reboot mode. Add
this mode and normal boot mode to the node.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi b/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
index 46c91468f4c54..174b13b8facbb 100644
--- a/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi
@@ -5,6 +5,8 @@ firmware {
 		firmware: rpi-firmware {
 			compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
 			mboxes = <&mailbox>;
+			mode-normal = <0>;
+			mode-tryboot = <1>;
 
 			firmware_clocks: clocks {
 				compatible = "raspberrypi,firmware-clocks";

-- 
2.47.3


