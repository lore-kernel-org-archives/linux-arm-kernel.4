Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C59606A899
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V6z7ddbB;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nygkjgD7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pCZoU/KULySiNKg5bHmPXpUGGQnjpXel7S5fY/ZzmBY=; b=V6z7ddbB3rMcBS
	2GSwy5hHNHDwN2tU+xK+qfawkOeCwE40epVjoLv6caWjmAKJ0Vk6dNxCn0Mu/P8ZQHPOzElN4k+M/
	Gg531ysVSchvSP/KZ1kS9rDSLlekw4nAe/7shL3MGh7D5aWmm/XXy5W/2J/lwtTT1/FKsRU6bUxe8
	R4paG/JXnKtSo2ZF/Zpxlnw6R0zvP17gf/PDCoh0VzYBPSAebuXG0iDuYwjiDNCR2ID9aJP6UEEmh
	uExg/ExuiYJcYYns4nFR3Cbdc694ARYFp620ewNGHS4bW7RBUyjcbxKTDwpCPTKLpGxp5byg5gV9j
	aVhImT2zMUTh/iOnj+MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp7A-0000000CTAx-25SP;
	Fri, 13 Nov 2026 11:06:40 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp6h-0000000CSvS-28Yt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 11:06:13 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso4155125e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 03:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567969; x=1795172769; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pCZoU/KULySiNKg5bHmPXpUGGQnjpXel7S5fY/ZzmBY=;
        b=nygkjgD7t6aapAg4UoNjElpua4KywzHev8WFTwm05z7L+ad4KB3G1jwbleClXLl1lK
         GBd1/aj9HJCj6O5iyGvVSWPfwMadpM+wcAlDQYRQ63aUK9i4yJcmklXTtzcRYuMNnwmT
         QmdCBC4aUJw8VBO1kK7H9nubaMdHpn5FM5Gkt8P8ho1PlZkgiRpkw7fU/eilKFY0/uBV
         4CW/0W/Itn1CF2snizn5JXGWEYaGJPYgxzGIf878ezVOofkG1UX+twZ+vqtAXQqv1FBU
         n2JMLOGYh1Z8M1iRc7W7bME513p7v74TKVRyw785HyIUx9QP/tiWotV7Tknp8eXz2sOr
         /hiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567969; x=1795172769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pCZoU/KULySiNKg5bHmPXpUGGQnjpXel7S5fY/ZzmBY=;
        b=UzSvLNwwiy9q9FEaHWH3/cKGYl8Redq6MCJdMRKi1QKu3v7Qg3c6x3kgptMxAPikx+
         AWAjeMCXjv5luglnPOyBbaskFtfIOPoGBX07LhcXdpnByoaKOz0lIFSetYx1U30exovF
         vRxrCfJCr+5SJhKqonn8QhiniHg49qaEmi1g9q8A4vlo1QSbppieAi1HHFMDG4NJ6wcR
         6oHdkhSM5F5i78naJWBeWhk4NtPCr/O8+ozOSXoUI9INtpmt0/rzBFjyDd6w7reMPKje
         TotEPVhQQc9lm76gaczlynoCta23kNWCnuyU2gQHSE2ZvrUL5OTHGjWtH4MztPAAdAS2
         FVtw==
X-Forwarded-Encrypted: i=1; AL+hErHNhKry96FRQeaOUw+lL/mDYfp4pEq8ZRz5uyDMyn5XRMTAEcCZmHPGzEnt5zvtlQc+v/nafPcvQx4cNkaK4rGe@lists.infradead.org
X-Gm-Message-State: APuU4Z8SZGqO0sbdPtw4c4z/PhO6xDw1LhbdHwYzvXL+WS7cvr+aY+nb
	KbI4PwLl5kVrOLLFrwTXAlAb9w9vjDS1DW14KqL1ZJb4HlJ8TDp92QLm4Ev7pZruBy0=
X-Gm-Gg: AYBFou3Pc+ZJISVAX6jPEddmSWAxGdB5gkfJzOSdOm4gDnq9WTTwcW++Q3fBDfWMVTE
	duz0rv6N5Ns/3dYMHadPrYnm0O7frlE1E9dt00AVqOT8B6K7dn3fuMyogdRVD2WnqCrPxWhSNkw
	TqXkDfzen/Ie14s8Y1iDNVsIwHsDTHE6wix+hwdmocMDGq9Hm+AK1KhWk8VvcyGYIk43GK+t825
	o0eSGPLTfoz5OasydJgDMa68RyGu2A2kYJxWAFmQrOOJiDjiqhxfdxU7T4jDZjy5CvZxV46jsU/
	l96IuMDzhFmcHvVE97UpWQmdAEI+ohokLDSGvB4GCz1yxWoXQGM2WcDHz7x/f5soPZ56sWuKNIA
	Dh8OXRKKnWh6dB3iFIoB/MXZCtGHW11SXlP5CO8yM/aWKo3Rq5y2B2zretd3x4JNqRCWFRtgDpd
	Q/Io24ixAoY0sJZ1rW7+3BXBrLzaERMz+B2Ybn+Ds06nlkLfy0Z1q63pvJrD0AMgHgJZB9mgxAi
	H9sXSr4LzzLKclPOC7Oy8KRyfrd9VfTXbXORlCHJbnLsRw2IiTjUom5P6GHxayCFzyqhYkoK52B
	OT//ZoOixOuzbdSwQeJW6IW7kn9yOCPjHKSRLzgo8ElnTrHiQaU=
X-Received: by 2002:a05:600c:1913:b0:4a1:fbd2:f689 with SMTP id 5b1f17b1804b1-4bb55a44c62mr47473995e9.7.1794567969426;
        Fri, 13 Nov 2026 03:06:09 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55a68c65sm55915505e9.2.2026.11.13.03.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:08 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:34 +0100
Subject: [PATCH v2 08/11] pinctrl: scmi: mark the GPIO functions
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-8-faccb4685d88@baylibre.com>
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
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_030612_032372_4D4C87AD 
X-CRM114-Status: GOOD (  10.88  )
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

Register the functions flagged as GPIO with PINFUNCTION_FLAG_GPIO.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index af9c9575d4f0..43b9d67eb9e5 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -438,6 +438,7 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 {
 	unsigned int nr_funcs, nr_groups, i, j;
 	const unsigned int *group_ids;
+	struct pinfunction func;
 	bool pin_only, gpio;
 	const char *fname;
 	const char **gnames;
@@ -479,8 +480,12 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 				return ret;
 		}
 
-		ret = pinmux_generic_add_function(pmx->pctldev, fname, gnames,
-				  nr_groups, NULL);
+		if (gpio)
+			func = PINCTRL_GPIO_PINFUNCTION(fname, gnames, nr_groups);
+		else
+			func = PINCTRL_PINFUNCTION(fname, gnames, nr_groups);
+
+		ret = pinmux_generic_add_pinfunction(pmx->pctldev, &func, NULL);
 		if (ret < 0)
 			return ret;
 		if (ret != i) {

-- 
2.56.1


