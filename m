Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514FE606A8B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x3yD6NLV;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dPQZ/jOl;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=P/l20lKr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=S3e2DLc/EFtAmhQSbf1IYEBcV1UrLcWSeCvbdOXz2tM=; b=x3yD6NLVwq1zQJ
	TT1rvw1J2x9Ba3T1E8eyp6Lj/as5z6xTEkJt2dRYWHN1bXL6WLhf4MqlguE9c4qwOn4gtFKy5yrEg
	rE2f7hZCn7cWwWdqXnZMF9krP+/FRoXZ/5TAekQTDNp+i9zx8dshObBwIGq/RPn5dvoXD9ry38lGs
	iXihyFalYHHFdsj683fOYy0i1i4pB5hsUUrhXCyWX9aBRa2WKKcirkmWDlzLQLfXcIO6hwlBXusFk
	v0DFgaPlDwzvXfQXJAXnu97ICAghqlxuldLjiGcf+lURRcKC/jSZd7xsV03QWXb5NTdhz88rPKqob
	f0N5JsL/gWBgHIAKT+6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQonz-00000004YFR-0kVP;
	Tue, 10 Nov 2026 16:34:43 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQonY-00000004XtV-1FwL;
	Tue, 10 Nov 2026 16:34:18 +0000
From: Gregor Herburger <gregor.herburger@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794328454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S3e2DLc/EFtAmhQSbf1IYEBcV1UrLcWSeCvbdOXz2tM=;
	b=dPQZ/jOlDJW3uiWmm/UVeaX0pGXpTCsuP76T/M/TBDJDnNXpMTSonLbluNeHTNVaATUKtM
	r6ShX7IrVZzTB1T971aAmWYVaeMS1LLNMHMZ4ahTV8mFtmol+3NNj1oXuNpJJlSqI1adsH
	wswK4AXz79kv64KBv8Te5DBzTk3CMmkJVyZCx04cuoZ7T1SJjHB5yfv386EQ3tB/shmU3c
	VDaz6BKgi+/WmZASLlP+6q43Y2XtqYZ/7izH89RTmfZeTHWajLhG0UuDNakPcZqiOJHjN/
	B+Sn2rLvZSLJB7bUICSXKlwsqOcTMeWaYy4m5FRAeiqsp2lm0P8KYJACe1Is/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794328454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S3e2DLc/EFtAmhQSbf1IYEBcV1UrLcWSeCvbdOXz2tM=;
	b=P/l20lKrtQLnvxFFN1y20agVA9zPwrpdFzVeWmoa3JQMFsITSKmv+tQ0ncxaGv9HcOqRqu
	rb42cc2KenjkvfAg==
Date: Tue, 10 Nov 2026 17:34:08 +0100
Subject: [PATCH v8 09/12] arm64: defconfig: Enable the raspberrypi otp
 driver as module
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-rpi-otp-driver-v8-9-797e0577d414@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794328449; l=987;
 i=gregor.herburger@linutronix.de; s=20260226; h=from:subject:message-id;
 bh=6YL5o+FkfRNe3jisn0G42FaZ58Ui5doUPUkjSlQYsNY=;
 b=u9JLUg2o0uL0aebjjbMEF3vtqfLcdiYqHl2mlCpO1lxK3oEbV5tseq8NZ/poVFJVmXgqW76Lu
 dzycJzw29RnAf9NL+iadVJIJt65b3HnQJ49U9UH82p3qYrOyieARHva
X-Developer-Key: i=gregor.herburger@linutronix.de; a=ed25519;
 pk=u72Lv7+/lS5CC1hmSrb17lv/6CK7HBh4Lvz77PHA5LM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_083416_915799_F2B255DC 
X-CRM114-Status: UNSURE (   8.80  )
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
present on all Raspberry Pi boards and the private OTP registers present
on the Raspberry Pi 5.

Enabling this in the generic arm64 defconfig allows standard upstream
kernels to use these registers on Raspberry Pi 3, 4 and 5 out of the
box.

Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21c..023def2297331 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1740,6 +1740,7 @@ CONFIG_NVMEM_SPMI_SDAM=m
 CONFIG_NVMEM_SUNXI_SID=y
 CONFIG_NVMEM_UNIPHIER_EFUSE=y
 CONFIG_NVMEM_ZYNQMP=m
+CONFIG_NVMEM_RASPBERRYPI_OTP=m
 CONFIG_FPGA=y
 CONFIG_FPGA_MGR_ALTERA_CVP=m
 CONFIG_FPGA_MGR_STRATIX10_SOC=m

-- 
2.47.3


