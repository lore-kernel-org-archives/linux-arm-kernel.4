Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3807F606BFDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 13:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MrMYynFB;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MnLRvZP7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=SG1KLhu9vbPJolKGXXaQV+o4pMWgdOPqb2txYeFOXq4=; b=MrMYynFBP9mQyiMpwgHfjQ0uG1
	RyqTf0MnTotWuPFSiTHmN/iWc1wr5WDGe7iqGNyIe9As6iiilMl7grvLfoWPJL5/mhUW1v7kTHgF/
	7DvdeNlYw3Zu781dRLekWEnWz+qDEpsWyPOEDJGKo5LT9W/aFliaHzzOk7vE35NLv+evqaO8boWMJ
	hLaz+Hv8YVDk2pJxQCcUYfBDDuAHArHDJ6D2ELHHSsGw1oKLCTRGmqvBeooL+CXw6vLchkQeVVzuw
	jYEgpbSbK3KiBk+nGkWfNuKV/unkYGjhfu6SCRgQ0sog0T3xftRgDF8uFIoXlDiC6v1+l+2sM/d3M
	nJorqlsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlUZ-00000003xPC-49Tz;
	Tue, 10 Nov 2026 13:02:27 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlUW-00000003xOb-1LvB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 13:02:26 +0000
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-992f6d8cb51so412178241.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 05:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794315742; x=1794920542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SG1KLhu9vbPJolKGXXaQV+o4pMWgdOPqb2txYeFOXq4=;
        b=MnLRvZP7a8bHpWMWJ/wGWlXHXBkrogqzVe3jJ3PwmvJX5waHm0KShrh35/UGeICp4u
         h1txjGwk7AhEWOPfRbA86hho2Vb2y4gnWyR++HnoWGr/QYZPRjWx/wRK5w7j3ZqaJxW1
         tUWOTuwteEhDqjf/rIVOqE/E6P5LPs7EBNvtf8peHldZgmywjKyQNOj2r0A7lmczwqDW
         eZ4TQeo/pUyBZborVsvrRFoMzdhYVZvVkk2TLmhYWgvGtvMAvM+8LsM1rsmv4vbIltG7
         uNjLnKlIbUPc3BpdipcKKhB74xxII8Qafh9KQwigPuOZtg06nY5Z7Oyo/OYr+gR8bzro
         LWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315742; x=1794920542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SG1KLhu9vbPJolKGXXaQV+o4pMWgdOPqb2txYeFOXq4=;
        b=N/j3RpFBes5M5CBnf5ZHskHZSOP6vsVx4E0X50vx5WzFGQzMkROrBlM4LyKtMh2BzV
         NzrE49vU7emGED3YdShasI2vfnNHJKOYxMhYTDF6AD6Z/BesTVA2trTCc07oILX6tUbv
         E6eqVSZUHiS98NojWKO5zMUkPwJsXCAhNa6fHWPO/gavt8uEOffREBHpPgZunG25OoLP
         LkIM5a9vny7d2BFVZubX4+OwXuGwLer8/ZOVhU7xbvxwgciM9WnyG5weflI0Jl/5plWr
         K2FFmnN0t3DRvfaZ+wb9R9BMgb7vMWrJUgPvTgTOEB0xWrMPbgXnbRWqTaGZIXGC9psp
         +g8Q==
X-Forwarded-Encrypted: i=1; AL+hErHt9U0bX4h0nHaezY2+lBpLreh0MvIAKl0aFAypR54At5ezIu4dCFyZpp9o42+EPAJgip8AhbYU6rx6SDra6JDQ@lists.infradead.org
X-Gm-Message-State: APuU4Z8kanx8yXL7vxZJBoXouN9M8MLb5ncKBgkVPA+92ud+g/eMG0KP
	fX7N4/pgHrkfEGufDy4CzoZIHUALefInieEZpvEM0XsEuSUT7oc/Xgr8
X-Gm-Gg: AYBFou2ku2jXEXds8TOUElCxDH/dOU/TdXA6AO+UAQbWI+109gNVaGNCmTGXLipSFS3
	FVdraY5Zl6W/931dUTbIikY09HVKOyC4Usabs1821/x7umLiTZ2r0lo+KiHRkhVw1GSjvsUUuSF
	fxH3068ZZua1RTHGDDANzxmjk/DhN019IMZEdxQhHstgTFReKr6EqkcpaOK4FFDuDxRtY/TyMM0
	n/osgCNU5K0sjTCaGjzfVgSrA6SBoWqEZgixK3vmhewgEYow++j0XFaNNE1WZ3YeSHv5mkzL0vA
	/X+gsYhGPKWp4Rjfg9UBMWw8HP5kF+g0RCEiPEWyS9RwzoN/MybPh4HuUTQOCI/HSidRwNh5rv+
	y3OoD1CeULOsze5rHrRorsPbSVN9GxftePtrkbXxazGMWMWhTLytnAwPRAX1iSh/GW4mTKW081Y
	cm/7LlQOR7izzq81bY8tZRcol0s1AKCVH0uhbsPYi5fQ+Z5wkCfRzYyk/KxY2KZXh5VLHKxqcoR
	iix/wfoF7rROATKOVZ3ByKvMcz9Rr2kiat5+2xV0feG8QdN5GNCtR4EHKTczLKf2fqwdFKdpAt9
	CgJ4K8yFoVbKpOFpfxxCN4v9cl5dU8pp/vae9dV8oUGc9VQFD7YJiP7WRHHn9b6tkNHOvf40or0
	NkAP53Zd3CORe1c+/l8rfosd+nncqimzqHi14/gMUT+6z64365bNCZparbEvwAO1Dla5nSUxjWj
	o=
X-Received: by 2002:a05:6122:1d01:b0:5ec:c3ed:7d99 with SMTP id 71dfb90a1353d-5ee0d0a5264mr742890e0c.6.1794315734491;
        Tue, 10 Nov 2026 05:02:14 -0800 (PST)
Received: from MaquinaLab.. (189.27.147.77.dynamic.adsl.gvt.net.br. [189.27.147.77])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee0c5fd00esm1573509e0c.16.2026.11.10.05.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:02:12 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: sunxi: a733: do not switch the mux to read IRQ lines
Date: Tue, 10 Nov 2026 10:01:57 -0300
Message-ID: <20261110130157.112155-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_050224_370000_B0E9F1D7 
X-CRM114-Status: GOOD (  15.05  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The A733 description sets irq_read_needs_mux. When a GPIO used as an
interrupt is read, sunxi_pinctrl_gpio_get() then switches the pin to
input and back to SUN4I_FUNC_IRQ, which is function 6. The A733
interrupt function is 14, so after the first read the pin is left on
function 6 and its interrupt no longer fires.

On my board this breaks microSD card detection: the PF6
card-detect line is read at probe, and after that neither removal nor
insertion of the card is noticed.

The A733 data register reports the pin level while the pin is muxed
to the interrupt function, so the switch is not needed. The A523 and
D1 descriptions do not set this flag either. Drop it.

Fixes: 0535bfbfa97b ("pinctrl: sunxi: add support for the Allwinner A733")
Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
Tested on a Cubie A7Z with the pending A733 clock, PMIC and DT series
applied: before this change PF6 read back function 6 and card removal
and insertion were not seen; with it PF6 stays on function 14 and one
removal/insertion cycle was detected.

 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
index ca82f08a3a65..456d9170c2a2 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -23,7 +23,6 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 
 static struct sunxi_pinctrl_desc a733_pinctrl_data = {
 	.irq_banks = 10,
-	.irq_read_needs_mux = true,
 	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
 };
 
-- 
2.43.0


