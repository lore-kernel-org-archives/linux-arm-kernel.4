Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C370E606A885
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 19:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kBGkLGIT;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GcwWN+wM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vksi6xdBiN572U8/PprSF6T1ZcI65MaLXrT+W5UPb/M=; b=kBGkLGITQThWV7
	S1rUFehXRWh3lCKprm4MJWDbUlyxTtDkfsietNWxM+TnF3hKotPqEkvImzu84eSANf0GTDYr0asKh
	dmC7V72VCYhU+eUU0T0eiyGi3KwDXW29OT7PNWI23EYFSlUZQRL8w8QVVVWMZjQfKqp9YVB0YzoHZ
	0CXykdx9C8P6FSTIq/fe/CmFHDRBHhq84/OdlC5KQc7R1a75gx6k99jwq3Ozepag3/v/DG2UxCvIQ
	ly2/VUfkQKfTDCHDiPczgj8c3WOgH9Pd3wZbuR6VWO5IlfVpwFA9f3jdbfeOeLj1JDEt3e2gLTHug
	77+qMAFNJZzzF6LVGbNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwd0-0000000E5nc-3mnO;
	Fri, 13 Nov 2026 19:08:02 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwct-0000000E5dY-0S2P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 19:07:56 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c4d58c50743so237599366b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 11:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596873; x=1795201673; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vksi6xdBiN572U8/PprSF6T1ZcI65MaLXrT+W5UPb/M=;
        b=GcwWN+wMJ+4olOq7CX7RZpp2Gp1dsUE1iR1sJlKzo/oTf8MG1lizdAlvjat7eDhYre
         kTLcTFgyYJ4XqrZrnw+WX7vouyvrFXNXszMCc0M9hI53jclittz3K5mDxVK9Ws7n5ggO
         HqwhR06TWahdXEBTd6QD7BQZ+TCAIH9DVB1nfoKpYspFebbESJCuwVJwjLoqIn+gDQCb
         SrV+SBiS+ybGPPqp5+r+kJE86RhaX+Ukt5R8c6GtvutGblp6LcuYmZsDs1h2homw8ToL
         VR+uCv6pa2k2FgkjeuYzBjFDZmfrnZNvlk+yTXdbPQ5SBeK2I6blYloNGqNpz8ODjeHa
         bV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596873; x=1795201673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vksi6xdBiN572U8/PprSF6T1ZcI65MaLXrT+W5UPb/M=;
        b=cDKDGSgvWtxrnPzMK6qPvX/CEas7YkLuRy6fh/yjqzDsr2Djqnm1T9ZRDSgLNVwUsd
         6e/5FvNaA9QqqZIV/cPwB3g3IWEbURsOdlWizHP2DtWDbdO5AmgjCrJJTUuEf+Lm8vpB
         2eh0KatrnGucBlDqH1zpM1HxRjyi7u8sR2y4mjOrGZJ5zzPJ9BGkRx9J+kFrAIV8o182
         0f08yaTruPEypt5eVCCfTvu0ptXRGSaiwoqKkHQ6UD6WJHbUA4uX1CXIT4nyR5efd+cs
         zXKf9t/BMB+D0gmygLZaPv+ovk+kcm0V7NiGcYcGRPMkncUl/4S4usGXOQ7VfuYZJM29
         5FiA==
X-Forwarded-Encrypted: i=1; AL+hErHOfh69FSZ5+AsQI2U/YKjH3ydSETdZFg8ztrWtSSXEwAyFkrZ8XSbhAor6kmXx8hvbK4u/5wbpRyP13FY4KYBy@lists.infradead.org
X-Gm-Message-State: APuU4Z9hrQHu+DixaAtsoVGWU8nx+/8eB6F4VuNIdK7vg0CbnbR8kask
	lsd/1tdS2MWQCtRsl71ZS26RA9yHxkzRjIZbrANrsX+rNumOy0IwFpPB
X-Gm-Gg: AYBFou1ZHK2xhRm0L8L4JTCjSOGpZ9vyI2dqf+tVMJT4BhTk+eQP77mz/UKY+xOnIUe
	ed2b/m6vEcQVqLrbMQqbzYJCrsBPFs2jACsXp4+7QHVqdjfMiF0TTvSAupaA44xbhjYG4wxyb6B
	DNY1H1QlT0DhMKsXhVfIbT0UcZ6zfD+VNC5SqlSQ2wnNXgFdGxo6lIitkjBBFsjXwhl2xmwIcZh
	fzOoE6Ik1kD+1hLfZrMGzPe88a/g1+MTJdPGG1uSu/V0G94F312kOY5J3e0FA8ydN4tZnXBZzIt
	f7R6irmsP0F+YGqah5raTyzUL3qnocTsY+XqAAedMRC1JYLE/0o0vw/zKZ+4dOQt+l869nPMeAt
	CpIvkFNaUi7SN58AGoH2Z2hA5AZ1uaGK821xrpOe4U/TKolDPFTpOxDDzHtTGv+xj5NI4SiVu9d
	NV3h2fhUmGEX8MpMSmfciuHn9uQTDGVdJxmDaBvVt7owr3M/FWE9MgwzRFBDTRD0U62IcAw9nox
	wpwKHPQVXtngFslp0f4lHsWDp1KhXxcje1CxCv1RPLW7Ci1+Xzp1DTU2FAMDZwwa5sd+Lhi812M
	G+yXvjwGczGS6rqalCdrpRsSD4W/GOvBfTD/V8ngmhaESqTdgz7v5N/tLK3aMu8guQ==
X-Received: by 2002:a17:906:9fcd:b0:c50:9149:48e4 with SMTP id a640c23a62f3a-c50963db437mr297220766b.11.1794596872956;
        Fri, 13 Nov 2026 11:07:52 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:07:52 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:05:00 +0300
Subject: [PATCH v2 4/9] watchdog: mediatek: Add support for MT6895
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-initial-mt6895-v2-4-4ab0aa9fa391@gmail.com>
References: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
In-Reply-To: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_110755_203642_CF7ACB8F 
X-CRM114-Status: GOOD (  13.70  )
X-Spam-Score: -1.9 (-)
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the compatible for the watchdog of the MediaTek MT6895 (Dimensity
8000/8100) SoC. Its watchdog registers are the same as on the other
supported SoCs.

The TOPRGU reset layout of MT6895 is not known yet, so the entry has no
match data and no reset controller is registered.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index a210fe1569e4..d8755979021b 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -607,6 +607,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt6589-wdt", .data = &mt6589_data },
 	{ .compatible = "mediatek,mt6735-wdt", .data = &mt6735_data },
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
+	{ .compatible = "mediatek,mt6895-wdt" },
 	{ .compatible = "mediatek,mt7629-wdt", .data = &mt7629_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
 	{ .compatible = "mediatek,mt7988-wdt", .data = &mt7988_data },

-- 
2.56.0


