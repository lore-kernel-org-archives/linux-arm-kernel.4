Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73C0606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PhrbKDiH;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Vhg+/FKp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=82cpJHaTF2XahHyniK0CnRQ00nLg09WJnkzOKC3qftk=; b=PhrbKDiHqh2p4e
	FW2L8LqqtmN9HiLD8sXctwtqFuxd1jr5X4Alrp8r5qEmIcV+2HlqM+D7PjiTwRMomtHxJbPrPaluY
	CW7N4JR0dYKVUKsOBQcVieJCs7VK6hwBFbD0fRbusz/QkZlq61vTWFwob2F61KjbPbi/w5fa7vrQV
	1PY7yprIIjxikuPrjpL8/qx8NCNK3iF7BGFYXNmC24AzTP4uLTOzMoNA8qEatr2lUzFj3RMHTTH5z
	sNvLagWb3bn1tc5DljdkD6wDw1XGy1RTD2yN6QaQqLx6PlFvxkXQLvouCyxDITPb7vzhjB91vHIkx
	ggWKVKBGsAKVhfJ75nOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVrX-00000003wcD-0Y4i;
	Mon, 23 Nov 2026 15:21:47 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVrR-00000003wUb-2jPF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:21:42 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-498f5fa5103so2025783f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 07:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447300; x=1796052100; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=82cpJHaTF2XahHyniK0CnRQ00nLg09WJnkzOKC3qftk=;
        b=Vhg+/FKpFxMwdNjOSjGCGhL4jyKF1rQQsBUgb9vCT78T0T6+PtfF2jegboCRp4bs/r
         xVhZUkNIqDiY/jtjsxevmJWZEc2AJz8wWHOr6svanmaRVFuZLbutyuSetU6J2iH6hkYe
         XlsFIfXnRewiE3qO+cFt0F7lPt7isPIRPDt6Qfnb5yTVUt8FzXGfSytnRllkZNmU4UqR
         hkkxP75cStDd83mBVmzrlfSF64DBOFIrdlt3GhfNyGHbpUbHmaQBCXRh+W3j9b0+mXOl
         ODNy4+NxaQqSF+zTrzjGM1cMC8VgduyDEFJD5QW2sCe3GPgxCse2Gj3mekOk792nVYz+
         lDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447300; x=1796052100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=82cpJHaTF2XahHyniK0CnRQ00nLg09WJnkzOKC3qftk=;
        b=V957HDK9bAljyZ1D+GSEgMuZQqfJLfOPz7I5wscyZXu0oWxF+oXEQaaOxWf5b9erGr
         VMB3Blms0FLXI8orxjSoD8DxwvjhEp8wOKyZUjcVrxbKMe8F8N/0q6pdoBT9gywgTybf
         dw4S3f/SEZOiw2rhVDVYMbHd1+x9LUBg+NnW/xE3DcZ5VfgfoxFJvPQvc8tU4iWkBU4f
         GmKicymAecY0/3WF2y1mI1tdC37dmoxca81jrcUdHxOyQdcAF8BPz4soaalG4S3BRUb2
         Qk6BPfuJT0L8v/pCMJtQwc6N98iWtIjAwfTzvXAbm4L4Ybz9K8+CnRNQIncx8cnOwPmu
         xs6A==
X-Forwarded-Encrypted: i=1; AL+hErF4bHPk0n0c01169FHSxW28ky7/vxBvX+wLN3/hYRyJkAFeBJyg1gt+yuwahyeqeo8fiQnt/TzSLjUMQHxkcM79@lists.infradead.org
X-Gm-Message-State: APuU4Z+NwIfX9cL4Nr33+hRfchanl2q/b65XAMAl1Ku6208wq0fbpolS
	XdGTuQ3tb6qaLBQ3P7n8LYW/8/XFO8deKJatM9K3yBmmJeUt6hTqYecdUDD3qJ+BPok=
X-Gm-Gg: AZFdTZcKBGpd61HSc01moARkBpph3xJ/zIdFuWCCo3drcA4YqY4DmjzIrQ6CKXCc6gj
	U/V2jGc31ugQL+WH94aDCBR4h0fjIez+AeyK638NO9ujqv07VSszEhHWC5thgzOG7g+sZRka62w
	436xLH+nxhWd+SmuejtKHdvTQGbOs0CVGomZVz9yF90QSk3Vdob484CPtmxb1ktzyPrgzNWb9+W
	MAhUfU0MmYx84PqoJSfCJRW7AjUkyE8brF4ViEKpinVzNgsIzVAOyU8FQowKMYFWygfr0ZJrEEq
	8bjhuXloZcIvQmrQUy0UpJccEV1LPDc5iBaqk/H6RVJNBCJfVNFRIaKUXVn2rZ4g2TbkwAdpHw9
	dcyOlcxDdQYkbjrpFFOnvYoco4cHMVuroFCIlRT48r/Xpuc/oHrCSzvPIY00sUWN4Dh9hb0G6PM
	HjUX4zSBfrRLkTjUWQpqV/isUHYYPFP2NaX+Kucpn8GHdmjI1z86EMmUj3M390HyixDRjjeYRBf
	QcgOcMsNid37AAsCktkPVaXMh9Aebr0tS0WLbYr45DvPATAj6hsJuRnJoGkVMfhZU1GUFePepGN
	K2KdBq5Fho0wphe/W5jJWY7IVZwYXMr37MWr3BDRm2FtBLYaVBw=
X-Received: by 2002:adf:e183:0:b0:4a7:790c:4a56 with SMTP id ffacd0b85a97d-4abb5cc17dcmr21011491f8f.33.1795447299625;
        Mon, 23 Nov 2026 07:21:39 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b3415763f7sm4832434f8f.9.2026.11.23.07.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:39 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:32 +0100
Subject: [PATCH v3 10/10] pinctrl: scmi: select the GPIO function on GPIO
 requests
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-10-d61f039be008@baylibre.com>
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
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_072141_712288_5789DFBA 
X-CRM114-Status: GOOD (  14.45  )
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
index ed563514898a..a8285b5f307d 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -75,6 +75,66 @@ static int pinctrl_scmi_free(struct pinctrl_dev *pctldev, unsigned int offset)
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
@@ -83,6 +143,7 @@ static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.get_function_groups = pinmux_generic_get_function_groups,
 	.function_is_gpio = pinmux_generic_function_is_gpio,
 	.set_mux = pinctrl_scmi_func_set_mux,
+	.gpio_request_enable = pinctrl_scmi_gpio_request_enable,
 };
 
 static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,

-- 
2.56.1


