Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F19606A7C0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oR+0l61d;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rfNxH6kJ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=0I0wkFkZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=p6UbBy761wweiUYQTU+IpjGwUVBHJzkK1GkVOhJL9cI=; b=oR+0l61dIwCinC
	/AqGHmiXpniDz2UHEhIzRxAqYL61h7QV5P3uikOcaxloGE34TLGkDcwoaIi1pcDL0mig4fwLI7vIS
	3ilqqtYBS3BvMPjmcqshb1DAMFmi3+1w2Iixw43xUaeLH6MVvyhB+CJ/JSVvx0eu7vbgZKHtHuzkk
	87tSLu7ms6gy0Pmza7lpFjgkvBpFPcETa1Xd73HKf6q+b2mrulIS9Fj/uC+r2dbz3tN44eL7Hx5he
	y13YGU9UogWV1daQlhaJN1ZKpdyNzzQevzc4iW6XbGQeM6Eucff9XgWR0XKhe16QSQ9VDZTmFaJj4
	hCyQ3625rZA4fWthtgJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlSw-00000003wln-3VQm;
	Tue, 10 Nov 2026 13:00:46 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlSj-00000003wfA-1Gs0;
	Tue, 10 Nov 2026 13:00:35 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794315629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p6UbBy761wweiUYQTU+IpjGwUVBHJzkK1GkVOhJL9cI=;
	b=rfNxH6kJkBbvr2WS9T157PE/oXjsLBf/DCbzT/TSRVo5z+MAR9Y76R10oJGSCxep4gGZT8
	KrYYPs3XqMwPi9r1OKc+PB9RnFN22/ZtQYgJ4rpS4Y26WzC6bkZRXGYcHATM0l0PjsyMKk
	bRRMg7JVXMYPcNCCytoqIiPyTyXmXeZNOIkZ5fEwLBqqac8YOQMlKUgAl2Q8u2yK8nEVJc
	qftJxzntxRMu0G2pCLHY7rG2KDH1d/Ttt/SrrCZ/rvmZe6P6poU715efCunzNuuf79vFqd
	Ii2G0g3v/pK1Tln6+L/ryNlUqSvCJskZg8QojDEzOnMGraV0DRyuyCG9yNUsKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794315629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p6UbBy761wweiUYQTU+IpjGwUVBHJzkK1GkVOhJL9cI=;
	b=0I0wkFkZoqzebhrJkmx1nSMT8DBLee4HijR1s/ABK7yZ0MwlkyeCcILWgkqrhm1IAF5rSB
	WnD9MZgxEM7OpUBQ==
Date: Tue, 10 Nov 2026 14:00:14 +0100
Subject: [PATCH v6 4/5] arm64: dts: broadcom: bcm2712: Add reboot modes to
 firmware node
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-rpi-tryboot-v6-4-56f680ef4734@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794315627; l=866;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=7it9CxaaYRxnG5e8FXqsp8qolf2qXEVZ57PjmKQ7nCY=;
 b=Ih7q07Nzug8gnjy5R3ydeB0lsBjPIHqkGeBSwzaJjpdbAB6P+TXjBAdW/apIE5srewlYEg7us
 Wk3t4xnFUONBxghOJ+S2bX03VNRcUh+5jYE3FjOLrRSUt5sVtcJzQpe
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_050033_487586_D8EE3961 
X-CRM114-Status: UNSURE (   8.96  )
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
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
index e5030da60f9e7..d81498fd57dbd 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
@@ -50,6 +50,8 @@ firmware: rpi-firmware {
 			compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
 
 			mboxes = <&mailbox>;
+			mode-normal = <0>;
+			mode-tryboot = <1>;
 
 			firmware_clocks: clocks {
 				compatible = "raspberrypi,firmware-clocks";

-- 
2.47.3


