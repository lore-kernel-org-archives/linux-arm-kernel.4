Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785E5606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 21:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kDDEGpsB;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+iUIe2s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Y9Q8/yXg7DQy7MuZky7I83q9VEq5cS/4AZd+tD6xMFo=; b=kDDEGpsBXB7D+b
	OfJ3EXJYszjGFKZhDV7DVQgnLBhmUV3O7jwh2gB2imEvA2+VBskFPpD1ClOYnCzN9uBhPNs0gpvtW
	jkjOGdWbcrW+Idd733wD4PyEHZUH2nKLI6IsPOFziWUV6ceME7lUZ685FCZ6SJDmqYnj9PVfuQmz2
	kxgDElhZiCtwh1DQ2B09gxrMz9Lmmfeaae9Koa4hQfdK7g188Kv9Z4ZmbC0JEQ1f6Bvhj/QsoM1N2
	H+iMiPmwI+W0M463JCCWDA0g1vptN8//R1naH8iliDRrWoG1G8TVYUoL+62u7GeG5Y+vpkjTclPfk
	Me3yi4VJULVyID7Kknmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyQe-00000007vNs-3GEq;
	Tue, 24 Nov 2026 21:51:56 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVyQU-00000007vK9-0Cxd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 21:51:48 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso27641575e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 13:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557104; x=1796161904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9Q8/yXg7DQy7MuZky7I83q9VEq5cS/4AZd+tD6xMFo=;
        b=v+iUIe2sc04PYn+yMLF5ANJ1R83Dq7dfGYDt761t84WCirXYfSEqZcrW6gFxA1wIB/
         W7y+6tJuYRddaSkNq43xYu7yHpuMHXlf6QmsVV1epguBe34jhtG+qbsYS+fil6yJjB2t
         Sn6Uni41ax8sx01OicL+Q7dgVvN0RXM4482WtA6uzWfqaXFAi5CO19uebHeZxcWzc/L3
         hOUKxx4wQasC36BsqBRZ2WUjJns7ZOx2kGWS3M6ww0yJtUkyST4ThTp6d2hCCddwkC5I
         xwUYjZnaVXHxxG4/ZsJpPPXbwWnbXC40Pc2xE5NP8j/Ds/LfGMEON2O2UnVuvmniDlP8
         qvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557104; x=1796161904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y9Q8/yXg7DQy7MuZky7I83q9VEq5cS/4AZd+tD6xMFo=;
        b=TxHvGOLb6DjxdxM6tXKjxl7R9QRRovb8IFVggVHL4LxXIWb6IYGy/M2MyhjH0c7doK
         a75oqH4I+0kYNL5iihocR7+Uh3CxIcerOGz2nlH9kiLo0QYgBRXDunip5wOaI+HKp2hZ
         6+gjB+eau7JlYi9CF+Er2Np3mtukgi5w7fAxrtCr+dtaKNKFPhLaLdRxPBertbK3L6jh
         HsQV/mzZfCWocawk+1ssQo7bTj+hHpf1EHKzYTACWUeExmwa3+ljO+hReE/zvjsIogqD
         fXVf6hfQ32AD5JnwUWXtQAkv3/EAmWfKzFqhRCoXQMMQO/5HmCI6ofjGPyw8lkYO44wi
         MkBA==
X-Forwarded-Encrypted: i=1; AL+hErGAs1ZWK3bKBYBmHLNBw/9Ix3xHves7VCjAqemz3iQRu2u4tonCpKY2tnwgkY52YuuPtZepkDasd6AKRWvWSmBb@lists.infradead.org
X-Gm-Message-State: APuU4Z8RgSW85x1JuO9SmIvQcE6bBFxfWrk8mNGP+Gq6xK64oUJbO3ZL
	xnLM2jGr4niwEbEqWTbYW2gr1fHWmClgs4C1VHwEx/7Q+8iYT14yTkb6
X-Gm-Gg: AZFdTZc0FQs/kx1BrHcGShg0g8qNqO8IjaQwsZ87518u3g/P7OjGOLxhwxUNtUigDMR
	Xp05yNOzC1JHCaahSJOIRl7DCBviuzEF5wRGiknVt6V0uiS4afSDNMCc5/dU6EBPHwFsuvFoKRf
	9piw27j45tuJ8T9UK7zSsGttJNuuwK8nukBdjuuPdfbwnqyWpJGNYYD5038bxTVxDOlrhTPFPw4
	ft/q1msiVEswmvxgisj6dk1xdM86JTrd8OYSLaeOeuoHGysG82sGGK5CiuOGZWOKb/f1ATG+CPO
	ECOhZvtZYPkH7RMU/GJ0OBhNlFlDEmyPN0Jdn6aedgRNKQcEpnSsdQtQtpkuZqWAYDzlNquOx02
	l4Z9hLBPvyt9W6q7oaTuy6DQzphD++qhHLoHB5mF6w5LZrkDUKfj4goDzLrRkwSwpzQ3oqxHpVS
	U5Hcjuc222RxuP2WKwJ67dCSohU/RtTnfPWnfaMl1SI/ZYukdNOnSReljZe0r1gW/coLcvM5YQt
	q03cbAKcezP2EBZwdIqdpqc2RwaaeP5Hps3NxTlZPL4XliJbrBZQe6eBux1ywjkChhuJAFX5jul
	scIsMyXyNMfgeE6Qt8EXqHpnW5pKnlmQvv9XJhbKPg==
X-Received: by 2002:a05:600c:5303:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4bb88785d2fmr318267825e9.0.1795557103878;
        Tue, 24 Nov 2026 13:51:43 -0800 (PST)
Received: from debian ([185.57.100.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm29194685f8f.0.2026.11.24.13.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:51:43 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH RESEND v3 1/3] pinctrl: sunxi: dt: number the IRQ banks from the first one that has IRQs
Date: Tue, 24 Nov 2026 21:50:46 +0000
Message-ID: <20261124215048.42074-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124215048.42074-1-pmazzini@gmail.com>
References: <20261124215048.42074-1-pmazzini@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_135146_289496_FC1C125E 
X-CRM114-Status: GOOD (  18.91  )
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

prepare_function_table() numbers the IRQ banks from PA, even when PA
has none. The static drivers number only the banks that have IRQs, and
use irq_bank_map when the IRQ registers do not start at bank 0.

Do the same here, and give the A523 and A733, whose IRQ registers
start at PB, the map they need. Apply the map to the A733 register
layout too, which so far ignored it. This also fixes PK on both, which
was numbered 10 and written past the end of irq_array.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c | 2 +-
 drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c | 5 ++++-
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c    | 8 +++-----
 drivers/pinctrl/sunxi/pinctrl-sunxi.h       | 7 ++++---
 4 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
index 001bd42afa3e..f71a229926f5 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c
@@ -17,7 +17,7 @@ static const u8 a523_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
 	{  0, 15, 17, 24, 16,  7, 15, 20, 17, 28, 24 };
 
-static const unsigned int a523_irq_bank_map[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
+static const unsigned int a523_irq_bank_map[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
 
 static const u8 a523_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
index ca82f08a3a65..3ebe926a1bc6 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
@@ -21,8 +21,11 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =
 /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
 	{  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
 
+static const unsigned int a733_irq_bank_map[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
+
 static struct sunxi_pinctrl_desc a733_pinctrl_data = {
-	.irq_banks = 10,
+	.irq_banks = ARRAY_SIZE(a733_irq_bank_map),
+	.irq_bank_map = a733_irq_bank_map,
 	.irq_read_needs_mux = true,
 	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL,
 };
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
index 8bcd566593ae..1577897a0299 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -209,7 +209,7 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 	 * The extra functions will be filled in later.
 	 */
 	irq_bank = 0;
-	last_bank = 0;
+	last_bank = -1;
 	for (i = 0; i < npins; i++) {
 		struct sunxi_desc_pin *pin = &pins[i];
 		int bank = (pin->pin.number - pin_base) / PINS_PER_BANK;
@@ -222,16 +222,14 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 		func[1].muxval = 1;
 
 		if (irq_mux) {
-			if (bank > last_bank)
+			if (last_bank >= 0 && bank > last_bank)
 				irq_bank++;
 			func[lastfunc].muxval = irq_mux;
 			func[lastfunc].irqbank = irq_bank;
 			func[lastfunc].irqnum = pin->pin.number % PINS_PER_BANK;
 			func[lastfunc].name = "irq";
-		}
-
-		if (bank > last_bank)
 			last_bank = bank;
+		}
 
 		pin->functions = func;
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
index 7c2f29e75519..09ebf67767c0 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
@@ -257,12 +257,13 @@ static inline u32 sunxi_irq_hw_bank_num(const struct sunxi_pinctrl_desc *desc,
 
 static inline u32 sunxi_irq_base_reg(const struct sunxi_pinctrl *pctl, u16 bank)
 {
+	u32 hw_bank = sunxi_irq_hw_bank_num(pctl->desc, bank);
+
 	if (pctl->flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
-		return pctl->bank_offset + bank * pctl->bank_mem_size +
+		return pctl->bank_offset + hw_bank * pctl->bank_mem_size +
 		       A733_IRQ_REGS_OFFSET;
 
-	return IRQ_REGS_OFFSET +
-	       sunxi_irq_hw_bank_num(pctl->desc, bank) * IRQ_MEM_SIZE;
+	return IRQ_REGS_OFFSET + hw_bank * IRQ_MEM_SIZE;
 }
 
 static inline u32 sunxi_irq_cfg_reg(const struct sunxi_pinctrl *pctl,
-- 
2.52.1


