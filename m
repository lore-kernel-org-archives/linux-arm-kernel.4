Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F23606A223
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Dvi0FNfW;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=D0jxqckK;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=nctSQOq7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=L5OI5FX7JL+kgNYLtItHyl+SG6enyYh3fOM8vlFTvoY=; b=Dvi0FNfWxhjuXQ
	nAt9WT4iG6WgJqp6YgXDhRIynydF9jmht38vyCXqeTXH3qOegj2j4ZnMc6Vayax+Hiy6wGB4iOFou
	3rL0wFKqGUpAOQokYFFQtvkgeHOGNztJWpF2719xrYYTmvkolWnMD+8Z/U0hyib2sJD6FXtkxRDWc
	xgakpUfGBwRmEkBeGQER3rgrvgL3K60A96Za7aXDdtGhhcfqZeWH+Me2tBwSaB3UhujpQv9Ywqz6D
	qcxxDc/EhvY3H+rCD7Ca0bczkgFDAzlUX7OhGyAJrNpvmRi1lyNcYMU1zf2v3RTYB4Q2MZEUZSO92
	mZG+/JZ4h1mifA2Ch0PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQooJ-00000004YZT-3jWL;
	Tue, 10 Nov 2026 16:35:03 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQonZ-00000004Xu0-0MXS;
	Tue, 10 Nov 2026 16:34:19 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794328455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L5OI5FX7JL+kgNYLtItHyl+SG6enyYh3fOM8vlFTvoY=;
	b=D0jxqckKK6Xk8R6hFho6o3ukNf2TUCRtXNtZPkLnKnnkta8oMv/gYZVbgZMjvpMjcgBGQg
	aw6EINY/4YIcXrCuNpjH1lY8poCK7On8A5KsW8rVmvNRPvmQQFXiM383UxIq97FyUTGRda
	5iAH3Vi0ohgAsIrZl/UtPsdvXroXd1NMqv4U0f8Z1B/QtfNtpDwYhMDW9jbbv4PW2RHB6Q
	9d5menNIwgnS15dSywGEuj4OMX5ha90p7730PIrrpCNL0xZFhdPJVi0cGAk27UfEdRznv6
	ia4/v1kAkecBp4IKPaJVCjrq9kLs5rdb6hK/lHoE2rZKy9NRHeOHhCR/m14jNQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794328455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L5OI5FX7JL+kgNYLtItHyl+SG6enyYh3fOM8vlFTvoY=;
	b=nctSQOq7y6pW8i+2azc6S2Ra3wI+JYWrSup+tTJOAnWhXA2AbZTQYSiWgiIyET6kYkMlbD
	Ehhu7MqQn4k+vvCQ==
Date: Tue, 10 Nov 2026 17:34:10 +0100
Subject: [PATCH v8 11/12] ARM: multi_v7_defconfig: Enable the raspberrypi
 otp driver as module
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-rpi-otp-driver-v8-11-797e0577d414@linutronix.de>
References: <20261110-rpi-otp-driver-v8-0-797e0577d414@linutronix.de>
In-Reply-To: <20261110-rpi-otp-driver-v8-0-797e0577d414@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794328449; l=921;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=nV4q/fY0ggdL9jLjY9jN7SpLOC/gVRnDvW9cn+372lk=;
 b=sNChvnfgs3UBEWxu3bTAj95LK9Eaj+c0VksXtEtrWUZ3aXq6QKuXvpywXAnR2hAiAFN6IqMvQ
 k4YEigxkBXcCIMsv9dfkur4p1Ig98fTS1Rrdxrylw+orREd8GaM9gmu
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_083417_325480_5E8E5FC3 
X-CRM114-Status: UNSURE (   9.12  )
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

Enabling this in the multi_v7_defconfg allows standard upstream kernels
to use these registers out of the box.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 069d5a49f01cb..e9720a22a7c44 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1262,6 +1262,7 @@ CONFIG_NVMEM_ROCKCHIP_EFUSE=m
 CONFIG_NVMEM_STM32_ROMEM=m
 CONFIG_NVMEM_SUNXI_SID=y
 CONFIG_NVMEM_VF610_OCOTP=y
+CONFIG_NVMEM_RASPBERRYPI_OTP=m
 CONFIG_FSI=m
 CONFIG_FSI_MASTER_GPIO=m
 CONFIG_FSI_MASTER_HUB=m

-- 
2.47.3


