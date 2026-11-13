Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C402606A8A3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Cp+gK6+G;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nPtoUsNu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CI3m2IUBy4AJO/fxu7FDLRUHIb948rmd18iopbbst+c=; b=Cp+gK6+GPoTYpf
	VW6/TKt3fNLgdncEFnGgYyRuR1ZR5wTVgEkGpGtPxWMVu3XTCKO6Ul0lYnvzuHjvCnjL0I6P3zc0h
	1D6y8OtBx6JDEpkSwabEpvXRaVh0ihlnThD1DsJF/xsgxzdQmXWzXQ9k9j21Bfj2tXImCoDEDoyQX
	6q+bR9/63Ro1GE/NLOy63EyFq2Ljg/oOD2v7PvLQv91S0umgXDPWwbDGR2d+cb5j6Ge5cYnEjvgYG
	Dnla83rUUe52rQbL+P3VEtTD8jAgYkaczOoRKXMgmGPkVTfBLKDsTUN4rrbcs6YYqqesna7yqwhWE
	wwhPS7Cz/wu+3lnZ9siA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp7A-0000000CTBX-3Eyu;
	Fri, 13 Nov 2026 11:06:40 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp6i-0000000CSwj-2aEg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 11:06:13 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48e3b22e971so333191f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 03:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567971; x=1795172771; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CI3m2IUBy4AJO/fxu7FDLRUHIb948rmd18iopbbst+c=;
        b=nPtoUsNupO15EpsRPJvrWa4AuQr91N5zeK+vZzee8DZyMYrdcSMjN23iKFCSxBuicL
         On43vJXiZU5uLFcdZTobZv+7LPTIMsmE8TPU5LbiLHWTSRz/SVuE3+20eWMwyLvUA2Td
         Rc213eIheooUPfWlUymnmIeMRaANMOZ863q1MrCGgtRmSYAeR/+30bEcj4AuiKTdZJvw
         oCu01YmvaahexE534O6Pw5kRIvEu2/s+Mypo4/2ca8QHuGAPnz7pO5xIkuwGpHTFrL3g
         mqsxRYYWWt6n6SoiKJIIKQM0NELRl9R1C4204X0p4l0XFzc2gv5s841PzA98SwBg0WNW
         yDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567971; x=1795172771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CI3m2IUBy4AJO/fxu7FDLRUHIb948rmd18iopbbst+c=;
        b=qc8Q15U0iUjhbjQla2yL3eBgRKf0gNp2VyVycIYfxbP0ByfX4k5Bnvb0sKYJniiyZb
         qwU2tCPKPwUo3WNpARw1uJN8M2BqE9351y/fI2engjAuapUa/WZsULrIsScTcG05fw8t
         ehtUC2GY/1lHazm0YHEOwjAavByC0PBdgn89elCsZKYsqPxj+t/FI0/Q0hKalwO5x/t8
         C8YNtCPUySFMZVkHcIWrPkbZEQVnqhP9UAeakL0QoK4RbV2pwoBRzvbWunt1tI2bqRLq
         yK9wtDl1GhrQmwQUNEtk0Eo5MXoQ2gTIxzOzRVOT8ij63fdRleeaCMylviFl8MF+fN4t
         HxkA==
X-Forwarded-Encrypted: i=1; AL+hErGf+t9uPo7tysTRIlYFJJj/uZs17q91Wzq40VCFbKpa9P27XLcFnYQrTSZmZ2AUR06fbDk7RKek20kE10Q5kxQ+@lists.infradead.org
X-Gm-Message-State: APuU4Z9kap6QC72ZIyVDueL4N/Y6L3mqkGjZm1SGC9gNFNBpGVXrskKy
	Eg15Wmbg9BOjWW0irdPzcWU2RMPmVqVXKouhplcfA4vUVCOI9yGYLiPc/f5+q4K/sSyjM70T/QD
	DV1hl
X-Gm-Gg: AYBFou2Sp3DPnMU+wtO59fN+vIj4aKV/8QbRXgknIYv9BGZmIyh3EFkRt8OG6ARYGR5
	MvrIEn9oSaJRT0SqxkNbqqS1a3jO71fxF5w9YPvcpNqqIsRDrzO9gTpolOt4O+uhh8RcMSK3qR0
	//FnfsYKPHnWSXrgVDLXLfU3dp4ITLvv0lP0nJSo1tkjzQeeNUdC1gduM6Uus5BVyYXXoFXkz11
	WAmWgf3EegTHb/luU1jqQMgjVItGHPCq4wHP4u2DJfFyqc2/VHmNsc5TYwZksJ55FxZFSRNLgYQ
	EPKOSu4oiDmq4U4nHNbz3bOCtFURwisjEp5YL7j5lCaAHhXbg/3writvcp5sjgjyMXgEwerR+jS
	UZK8KsIKGhHVGcY7pLvMi2qjHcInTkw6/QZfnMhVySlft1qdT6+GDm0Rlf0i+H4/n94tD7zK0+X
	O9N23o43KvqB8o7g5CRuyn8Zxh06xD4ZnwiUX80wsXhv6clJcYTYego4W6KJ67TGn3KfS5WjayO
	k6tU4kuqdr+pI8XHgGTL0GDhMpEnXLROBXQ21KLdSxK4UdlTc0UO7/O5jABg+vP340DDdPufi5b
	sAic9X3Faw1rbJp9tCfQ/jlC10w9ZOjqL+rpJtz6Jwfy1JxLXuM=
X-Received: by 2002:a05:6000:3c5:b0:48e:3fc:e393 with SMTP id ffacd0b85a97d-49c6fc9e60emr4495337f8f.6.1794567970746;
        Fri, 13 Nov 2026 03:06:10 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e31sm3987770f8f.19.2026.11.13.03.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:10 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:35 +0100
Subject: [PATCH v2 09/11] pinctrl: scmi: report whether a function is GPIO
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-9-faccb4685d88@baylibre.com>
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
X-CRM114-CacheID: sfid-20261113_030612_739039_6CCD3D3C 
X-CRM114-Status: UNSURE (   9.57  )
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
index 43b9d67eb9e5..6d51025013ec 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -80,6 +80,7 @@ static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
 	.get_functions_count = pinmux_generic_get_function_count,
 	.get_function_name = pinmux_generic_get_function_name,
 	.get_function_groups = pinmux_generic_get_function_groups,
+	.function_is_gpio = pinmux_generic_function_is_gpio,
 	.set_mux = pinctrl_scmi_func_set_mux,
 };
 

-- 
2.56.1


