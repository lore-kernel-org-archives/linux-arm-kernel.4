Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F47606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ep/eg6Rq;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YOey4jai
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sXcv808duzGd4FV90CzaztYzyLP3Z0BMAbpChwP6x5Y=; b=ep/eg6RqrKNy1j
	ghpOZjIh01N7xmn/0dslqjjbvzZSZE5uKfcKL6nHEPzQtyLXY9cJkfPO8DJ2AfCsnfLK2h59wtLuR
	dNMzNP3wMmf6vKrHcPZZyLp84Kx8UcgMDIRsRZ9hqt0PRfYQfl3dcUO4AAWoLuJzL8xGifYPC2q3b
	82VC7UR5s9DsJ/d4mhOhU/TlVxYYHhLB4cRhsRLHsLQO1yL03SVhwwtl44CS8lgy+hfPQmpg52qGo
	yMZLEYSiTV6qjCZxrtpeBP25eeHHWn9+VluxElUxVEny5NJptLMP+JBIltD9MyEIVu1EuckuBrPSS
	btZjcTPy1C5KwS+WFlNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVrU-00000003wYy-2yWp;
	Mon, 23 Nov 2026 15:21:44 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVrP-00000003wTI-3FFx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:21:41 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso18738915e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 07:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447298; x=1796052098; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sXcv808duzGd4FV90CzaztYzyLP3Z0BMAbpChwP6x5Y=;
        b=YOey4jaiU8UXHvACLwCCSfEJkgU+QlOgWfSgyRApP3W5pZelLh+topVFtcQd5/7Yfe
         W01h4bRQ0CbQp1ykz8dNqnVDxYTQiK12ilIzIxl+CJRWuZtPaSkkBCLHblvsjqMS/9bU
         W7ZOUIrpGRIfOvmda6zJOPFjWaxqM44pm5lwcmRh0PwHtZUEYVIwFWROcIVvdwQC66VW
         inByxQK8UlVMxp0sK3vHStt6vvfUBtS7gl9Kj1u5pBtzrPyLj6+Xl0X+OaAgHi204cwJ
         skuGzGn0vmsFiZ92zhQo0D9Tco5LpfGiQsnksdCy6a1X/BpA8tSzBnt6B0csVMtw+Sr9
         FE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447298; x=1796052098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXcv808duzGd4FV90CzaztYzyLP3Z0BMAbpChwP6x5Y=;
        b=gqleZOnqY3WwuqDoKkUPfuNURzCSf80uo9k2gZLcbN1TD1QmZlELtF7ClmAL2x583I
         +fYL7IHrsoVttaXINPDm98E+vc/mfHJ6dXb+mNW2zvcRD8GtQa3emnccp6jo0/RCcCdR
         4uAfZpv/6fsyngb20vn+Rk87G9qYgPskla79O0I3N4Dg25ircj/MeDvogXtOFIVuyhkI
         o7hKGsEVWN2J91F85Ejp0VvX/UClcNsWWq41cs+zF/yIeJtmENUgIkUpBIWX/tCHLrWi
         qv9tHS6A0gdO2tHO+8lDZdy+xoXOu6+jpKH7aserNrpPoXtouDQkFBqYXHFUoC41JZLp
         tNBg==
X-Forwarded-Encrypted: i=1; AL+hErHtiyqYZRZ1xKUFioVA6mG03FG0xd9+NbsCOAGQJ9Zvb0rP7deZvvgX5pbpBeZGm+ggShrdj/toUEEiHccYofHr@lists.infradead.org
X-Gm-Message-State: APuU4Z8oPPfg67pPGw+362aMrNoG+CbIRpJvSTNn9UBFeVO+GTdaxGIN
	dpFJu03rpETkjC2nI02vjaSEhu73KmB6bX5iGWqKV7e2t6PZvRPf2e0tuaVH4KNwKDE=
X-Gm-Gg: AZFdTZeMFfLcxn1qAPb/ctMouOxMjlZsOSWcVzgiygy8NyF3A45slTF0HHvWclhpXZs
	Sz2ubfYOsogq9w1SoOQ1l3wuvrK9o0Qh9Bh6jLe9tMmaE1YU9UxIJMYkK7ERsdz1RWasWgLDFxp
	0GnlAOewb47l/thsmidCZ1DG4RyTNbn3UerSbJbzpRSyq5MpDQvTHxvEBKOpDU5KRPcEXz9oRRP
	qB8HAYKNY2UR5KT6mWxCKV3aTDz0mjR888CdKDxCxUbFvnpEORzcNlfPhDvdAT+PLfcKT95rTsN
	BpbgAT/8wBAg9N3hbxKpEBvQ3u8LHEqfFiQwbNYVSvGy2mn1VZmUU8L7B8vxqNtFBI5iyiiVVPU
	p2vSKzClQ9uFLxSYaAYoW2PnzqDby/gdQ/zHs/TRAS7BFD4J9Oxpj7QHAutz/x7vWOBRFPWFgsj
	Hs+xmgbbxfA73rH726QD52G0Q0HGd5EgHSNiVccwJDrtcBGr2qeGGWjS01xhqb6lLkxi07Tkgrq
	noqi+q5nYjoDG9AeDf6RegERmUFY+W1f0Z6LNtHBaVqJewS3OBEzMLayaQoMtfvNnad4sllCCxO
	gO02NwH8y0xAsWwO0QetSszyydOR2nFh9dSjq28Yty/Ha74JtKw=
X-Received: by 2002:a05:600c:4755:b0:4bb:7033:de79 with SMTP id 5b1f17b1804b1-4bb8881dd02mr249201805e9.35.1795447298146;
        Mon, 23 Nov 2026 07:21:38 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm513780865e9.11.2026.11.23.07.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:37 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:30 +0100
Subject: [PATCH v3 08/10] pinctrl: scmi: report whether a function is GPIO
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-8-d61f039be008@baylibre.com>
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_072139_850662_65742932 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use pinmux_generic_function_is_gpio() for the function_is_gpio
operation.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 3965f920851b..ed563514898a 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -81,6 +81,7 @@ static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.get_functions_count = pinmux_generic_get_function_count,
 	.get_function_name = pinmux_generic_get_function_name,
 	.get_function_groups = pinmux_generic_get_function_groups,
+	.function_is_gpio = pinmux_generic_function_is_gpio,
 	.set_mux = pinctrl_scmi_func_set_mux,
 };
 

-- 
2.56.1


