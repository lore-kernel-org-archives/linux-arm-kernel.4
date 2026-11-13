Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9ED606A88E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mcjn5+cE;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=SzG68Slo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/KjHy3hpqhFDwucISqBEqrVFtd2/HO1l3B5+bpONlqw=; b=Mcjn5+cEe0ciya
	uawB1FZmlLNS4+aZmEynI1FSXCGQsqLSDS/mjI41bP8youlj1sXaJEI2ot+m/4Bwif7YwmxMBUfTX
	NFfbQb7FPXM7IpmJuc14DvvRg/jFHK8AryTrhEKQY7pDXoxEyT2fkvbOXekEh8p3ihsQgX0Dfl9D5
	sHEBP+7t0S1d+qJjA82lDTuGqaa+8mnbo9qdL7fVaN29C6Na1r/cPWR9eLL5OYQueTAlZEpc0BWtl
	5XaYPtL/QE/XaDYrvOVThm/PP/WxsO3gmGGRTmD6KGaAXB6oy0n3ohQZVHJtTyGaDDekyz1iQ4eTR
	Asc3YNLLZKLml7J21fLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp7D-0000000CTDH-1JNL;
	Fri, 13 Nov 2026 11:06:43 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp6l-0000000CT1q-2hUs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 11:06:16 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6b56c428212so1252161a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 03:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567974; x=1795172774; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/KjHy3hpqhFDwucISqBEqrVFtd2/HO1l3B5+bpONlqw=;
        b=SzG68SlojVieIgsOHkgnfTG72mL71zfFR1VwGBvTYMwGiZbZVOk5QaawonHNWZdfkN
         PEMv0tNVE0DueaAMeiREB/z90salcdrXut23v2Vxf9NYJt8H9wd57wOqMCQwvYXzu+1y
         /Rww5ZVuChjeT2LHrp7lmwYFhoVupAu3hh+ZlFmuRMYmXwrj3LXURBTwPqa+1p/lwTJ2
         5mLWTvSr45dWjTlkQQL3JdpDnXyTyYgiC3rLYlpMzpdjCC871EqJ7aCrIGGlDVgTrd/G
         QT9ONDgVubeKAHTJfVtMECU+algG9iK6TSSoh+I/FhHzbVmdT2SFZpkZSguPiwSyuS1y
         GKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567974; x=1795172774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/KjHy3hpqhFDwucISqBEqrVFtd2/HO1l3B5+bpONlqw=;
        b=oZMgo6LxmXTrr70j1mdOHRQEIs1eZHlk5nOMfoRAMWgaXz20f9ikJeqvVrAvC0uIdX
         at9stAtNMgha+CdKWETDkvCOHCknh+J+1TzwEG0C8LuOT9B7GWuDI0dVziIn2H5zJITS
         Pv9peWkEHLreM+zW0ls1yRLuQwf2lFskZ3V1D/ALO6VFtDPKRnCSsSQKIJ6WxJvPFcBi
         2Be8PX5Iwz/Gc0UyeGknpigcflWeK9wKMS1CSO8p85rE6OhQJTe877RRyIiRX/6I5OIk
         eDj674sHq2vb/u5VKlLmjvq7+vvUfLbeBmbs1vsINV5o5bWxjznS5sYLC6fJbWs6jPym
         ZIMg==
X-Forwarded-Encrypted: i=1; AL+hErHG/GPkzqcqrJF9dGH9/UakN9mfvGsX0rpw49qzq+xXduoMoMrdnz8w2rNuS2GICB0q5WUMCALizZNWaNKR4Dx3@lists.infradead.org
X-Gm-Message-State: APuU4Z+p82g4lBApnMR8lHYw27nBDrxGtHci0NwpE0G29Vy5MYA2cocJ
	vXx23A7CNyp2t0BTeccKy/5r41YwYCeeFwVrSEY9aBX5BHHMd/nEVEIA/f0KPaIOZpk=
X-Gm-Gg: AYBFou22mqM4YpP/T52XMVEniO+LI8xZnI/fv0YHOx5LrtIjY8FtqepgxSaTNpanKWb
	KYi5xdWXmwE1fB1cDJKSScvnGPfuo+Gy/MqeLWUzzpm623iVjzYhLcD3sA1U8s5Wvfj/EAL7XC6
	WvbH7Y7iYq5HmJ5UYkJ9neCkaDHUw840FxAyraQFYpPIbCYeEc33KfSIyT4Pm2b2kpNmqDfQnJa
	GSfInN5db43GpTkojEi4RHE1liXfq4EaAXB/bwC8LoaF1I0Yyi5Ja5z+lNGSxMwEP+LkSgG+xSs
	BAxr/pcPJekc95Qc4lTWe1FpkeCAwaX9d81bf5pcooEfwfjVBQQDJo8s1b6XYMjSsweYuc7IKBH
	TwC6RvrmXZChgJP23J0J15hXb3hRv6x1YcXBXPNh9cnuvLIQKrBJekQnv6hmeQ+cms8BgTSIG6V
	6wlshUtgHYzERY/M/2QFHiWv/7sGSosk28VQjEfh/exMM2Rtb3ybuRCUr60WNUv9b94NiIqku3p
	pe4rpB5dG2SCJo44H97s0BWcZGIWQ8mTq5oPyFiThR2yPyUKO7xve/+aoBPZRNb8KtIxkjfwmI1
	FguTdxFc7HvN5sDERV7ZOfO9xdU4N5CxvDRIy5cXFjosvjGhhE7f
X-Received: by 2002:a05:6402:1e94:b0:6b4:201f:17b6 with SMTP id 4fb4d7f45d1cf-6b7c088fdedmr1865175a12.6.1794567973645;
        Fri, 13 Nov 2026 03:06:13 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608c5debsm4495767f8f.42.2026.11.13.03.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:13 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:37 +0100
Subject: [PATCH v2 11/11] pinctrl: scmi: select the GPIO function on GPIO
 requests
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-11-faccb4685d88@baylibre.com>
References: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
In-Reply-To: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_030615_708945_EF58F2AE 
X-CRM114-Status: GOOD (  14.29  )
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

On a GPIO request, select the GPIO function of the pin, on the pin for a
pin-only function or on its single-pin group. Without a GPIO function the
mux is left as it is.

Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 61 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 6d51025013ec..89be533354c0 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -74,6 +74,66 @@ static int pinctrl_scmi_free(struct pinctrl_dev *pctldev, unsigned int offset)
 	return pinctrl_ops->pin_free(pmx->ph, offset);
 }
 
+static int pinctrl_scmi_gpio_mux_set(struct scmi_pinctrl *pmx, unsigned int pin)
+{
+	unsigned int nr_functions, nr_elems, nr_pins;
+	const unsigned int *elems, *pins;
+	bool pin_only, gpio;
+	int ret;
+
+	nr_functions = pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);
+	for (unsigned int func = 0; func < nr_functions; func++) {
+		ret = pinctrl_ops->function_flags_get(pmx->ph, func, &pin_only, &gpio);
+		if (ret)
+			return ret;
+
+		if (!gpio)
+			continue;
+
+		ret = pinctrl_ops->function_groups_get(pmx->ph, func, &nr_elems, &elems);
+		if (ret)
+			return ret;
+
+		for (unsigned int i = 0; i < nr_elems; i++) {
+			if (pin_only) {
+				if (elems[i] != pin)
+					continue;
+
+				return pinctrl_ops->pin_mux_set(pmx->ph, func, pin);
+			}
+
+			ret = pinctrl_ops->group_pins_get(pmx->ph, elems[i], &pins, &nr_pins);
+			if (ret)
+				return ret;
+
+			if (nr_pins == 1 && pins[0] == pin)
+				return pinctrl_ops->mux_set(pmx->ph, func, elems[i]);
+		}
+	}
+
+	dev_dbg(pmx->dev, "No GPIO function for pin %u, mux left unchanged\n", pin);
+
+	return 0;
+}
+
+static int pinctrl_scmi_gpio_request_enable(struct pinctrl_dev *pctldev,
+					    struct pinctrl_gpio_range *range,
+					    unsigned int offset)
+{
+	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
+	int ret;
+
+	ret = pinctrl_ops->pin_request(pmx->ph, offset);
+	if (ret)
+		return ret;
+
+	ret = pinctrl_scmi_gpio_mux_set(pmx, offset);
+	if (ret)
+		pinctrl_ops->pin_free(pmx->ph, offset);
+
+	return ret;
+}
+
 static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.request = pinctrl_scmi_request,
 	.free = pinctrl_scmi_free,
@@ -82,6 +142,7 @@ static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.get_function_groups = pinmux_generic_get_function_groups,
 	.function_is_gpio = pinmux_generic_function_is_gpio,
 	.set_mux = pinctrl_scmi_func_set_mux,
+	.gpio_request_enable = pinctrl_scmi_gpio_request_enable,
 };
 
 static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,

-- 
2.56.1


