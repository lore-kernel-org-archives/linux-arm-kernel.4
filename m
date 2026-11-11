Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF32606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 07:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ogU0gEkl;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Lzjuxlb5;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=JxEmz1Y8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=R1+ETXdhcqBpyFYbvVGAz7S2di16t6DiUwgkIA1sLsc=; b=ogU0gEklnLqes/
	zYBtMcjx0+QfELLcrwiOnjtD7p4PGPOuzN6e/zYmliPUTZfPXDSBKrfGg4LQqQFFPiFzPUd4VjsMW
	BumKZCSRaSL/X7QDM4MSnOeOmi7UHlOFfLHR23O3dXqF8jAJi6vgdVrihSKRBHXaLKKbJqkots+T9
	57cXWOtZs7lpKkDd/wkxq0yeKvhq/nX/2hNTiil9d2so7oWoONq/aVIlCCdhrgbFkdEi+kkCOHHXi
	eb+oLN8X5s7JD8bSS0KJlx0RjyRNFO4ii7dRT+leVpnvWKWVZvAa+yZLBZRjLKeOLRUvr8kepYer3
	xVEBRBpQPRDttY0rbgsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2h1-00000005tFf-23MG;
	Wed, 11 Nov 2026 07:24:27 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR2gF-00000005sej-2yLe;
	Wed, 11 Nov 2026 07:23:43 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794381816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R1+ETXdhcqBpyFYbvVGAz7S2di16t6DiUwgkIA1sLsc=;
	b=Lzjuxlb579LNYmFyV6OOiDgdDFuLYlcUkZtQzqaiF9YpwRLSf+gqzFUmfD6YxNzdnYAeuv
	/u4mhV3yosc1iYPzegqeF7OGC9uZgoOv+SVE9ClIPNuzY85/6vEpD3XGaKMA1gjDwdc5zT
	Ry1F0Dvx91EiJHZjitBp6gdcuUAsTYV917RarKMNbEdtI+LM2ohnKhXBjLYwB6IAzEYfJX
	Bc1+8n22H0e7W3tYtGSwOBoikKHrYbjNn68tSZIZ2ErHtSZepIRQ4oa6b4k/WoDKfPVuz+
	hZhxEieW87EfU2/4AII5XjyGNqo7wdu2ASdc60SrBHM5oy/RZH3H/18RiK1AgA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794381816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R1+ETXdhcqBpyFYbvVGAz7S2di16t6DiUwgkIA1sLsc=;
	b=JxEmz1Y8bJBPD6QVAeotaWObnSEPLtphbEahonquN4vmPLIxKttGxazHWbC2z1JVbzF+cj
	awhg1zWgXZ36RKCQ==
Date: Wed, 11 Nov 2026 08:23:32 +0100
Subject: [PATCH v9 10/12] ARM: bcm2835_defconfig: Enable the raspberrypi
 otp driver as module
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-rpi-otp-driver-v9-10-0a7292a7a5b4@linutronix.de>
References: <20261111-rpi-otp-driver-v9-0-0a7292a7a5b4@linutronix.de>
In-Reply-To: <20261111-rpi-otp-driver-v9-0-0a7292a7a5b4@linutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, 
 Gregor Herburger <gregor.herburger@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794381812; l=912;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=bOKNOICxqCYZrMWjJOkFJLVvOcoLV2kUC4VhPSN+7gY=;
 b=GacTRK73e/c9T9JmHHoL+BalmLS6g0MWGIy0btLoMGCx/v6FBPhjZHiueYRgYAdqxoIQx71PW
 C++96QBFdW2COewDgMJnHumLQtrft7ocSj7mm7T9aq2JfejL5wVAJa/
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_232339_920696_23DD93BF 
X-CRM114-Status: UNSURE (   9.20  )
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

Enable the newly added Raspberry Pi OTP driver as module to allow access
to the otp registers. This driver provides access to the OTP registers
present on all Raspberry Pi boards.

Enabling this in the bcm2835 defconfig allows standard upstream kernels
to use these registers out of the box.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm/configs/bcm2835_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/bcm2835_defconfig b/arch/arm/configs/bcm2835_defconfig
index b469ecc36cf58..8a1c492db870c 100644
--- a/arch/arm/configs/bcm2835_defconfig
+++ b/arch/arm/configs/bcm2835_defconfig
@@ -150,6 +150,8 @@ CONFIG_BCM2835_MBOX=y
 CONFIG_RASPBERRYPI_POWER=y
 CONFIG_PWM=y
 CONFIG_PWM_BCM2835=y
+CONFIG_NVMEM=y
+CONFIG_NVMEM_RASPBERRYPI_OTP=m
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT2_FS_POSIX_ACL=y

-- 
2.47.3


