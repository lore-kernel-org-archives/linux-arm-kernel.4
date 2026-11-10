Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA5760A3801
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TF9octG4;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=n8tkX2iy;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=e3E+zm1g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=R1+ETXdhcqBpyFYbvVGAz7S2di16t6DiUwgkIA1sLsc=; b=TF9octG4nm/ujC
	oSK5HRlF7JtoCHP0wxg2wbTH0LjKClNgBCzr9HtO04ePlXB1W9IiNRST5Z0fytAKq3QOGzMhSHZTC
	x8vjuOPjnswYn0ypst0hpHlsSz+nIHxYDHAt0g0+vZpP0SNcApjBqWPXIrLu3/EHU/kkoO18v9AYL
	AGP+nH9XSSYpAgrDVzeB90K4tnAO/Qfx+UwBDw7kQvTwKFdaPoQubyZwVvCB+rsu8NzQoHHq/Er5Y
	SVunQqMniYZVjQSbufGI1bih8Yuj/ufGnr5zW40zK5VjoDjhpuBxFnR2k+GYbIFJIRatBz06qKYu3
	oPgiOXAfnjbU8AYDgrUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoeZ-00000004WGW-0vGh;
	Tue, 10 Nov 2026 16:24:59 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoe0-00000004Vnq-0zIi;
	Tue, 10 Nov 2026 16:24:27 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794327862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R1+ETXdhcqBpyFYbvVGAz7S2di16t6DiUwgkIA1sLsc=;
	b=n8tkX2iyYSyeM3L/MEv8MXyX1nQ9SZj5X2NObcRCdkyJmd5z3BDXMcgifaCITmZiOmQHbp
	wVoArt7GQo/fXIBlO9jbFb9xwLQmOqODCNEWa/g0QNCT8ZtjdHjNAldaJEZv6IgqnbitH6
	lqHhwMRmGA0kR+Yzq6FO8X8wFc0u4wkf+CnORq3f05I+uwOrllHqjN/SHJK9r1nXNLtB55
	YgEg8FpZzEibAfg88TrwJlNyTlc4Vde52Ljkb9AImLPGM21tRNvb6lqZv/pJlqVvuQBNzH
	h/0KjoNaol5vZ8UC5bxm3ECs0HVEI1K5w9OCoBsIPnOYVgzDLBcMhfDtNy2oxQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794327862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R1+ETXdhcqBpyFYbvVGAz7S2di16t6DiUwgkIA1sLsc=;
	b=e3E+zm1g9UwbIscvvFag7v0UvpTQWoVlyWV018dFcNycG/rXu8soJhiChKk96srMVxgoCt
	VIaj80xiL+nvQbBw==
Date: Tue, 10 Nov 2026 17:24:10 +0100
Subject: [PATCH v7 09/11] ARM: bcm2835_defconfig: Enable the raspberrypi
 otp driver as module
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-rpi-otp-driver-v7-9-2345d0ee65f0@linutronix.de>
References: <20261110-rpi-otp-driver-v7-0-2345d0ee65f0@linutronix.de>
In-Reply-To: <20261110-rpi-otp-driver-v7-0-2345d0ee65f0@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794327856; l=912;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=bOKNOICxqCYZrMWjJOkFJLVvOcoLV2kUC4VhPSN+7gY=;
 b=lbJJNSAE86j5ftCfcY3QmYysFU+YUjigm/P3RIDOgQg8rHqoZt0j4eX881fuU7KZK0qLGGLTm
 otH8Iu3IptxCiOetRwZNJWQJvs6EQjopLuzHpV/NzFxw0fxXIX+qAB/
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_082424_474488_CEC5D43B 
X-CRM114-Status: UNSURE (   9.27  )
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


