Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C335F606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JTPvcK59;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LssN3d4q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=M/NBo049vkahD6DDx4SDzPe/iIjbhwkc74fZEa7Rvok=; b=JTPvcK59dCp61P
	gQHxoifGDk0HTCmJ3ShLZj19j8CNY7ObNB1ukRgcH0NSMNtOrSY6aww6fwNi7tHXRgWx8B0sgNN+4
	qaO34jk9YV5weoNfbLzPXKkHKyvrbSP5Z+mDZl9RDeF3vlBtPouDPm7B1OI0yguMX8X8ZQ4W7GRkI
	2vorLMpnlS2i5ovHM0h5afGZJfOOQsloNpdsquNa+Il5b11QQPGRYxdpUWP9Xzpz7wI2GlJD8Z4qd
	FkcbPafadNvVwulEYHl5rs9Fn/rvTsySRyCjA0FlW4m3qSIPWyJrTc9U6sc7QI85OXwI/65fGQSck
	Pl8UZNIdCFruKZiaMK5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVrU-00000003wXY-0lWz;
	Mon, 23 Nov 2026 15:21:44 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVrN-00000003wRU-1Xut
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:21:38 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so33472895e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 07:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447295; x=1796052095; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/NBo049vkahD6DDx4SDzPe/iIjbhwkc74fZEa7Rvok=;
        b=LssN3d4qSDsV+1Xu6NALUSyTpxy2phZ9I4yuZ7nVcQgkp4qbeARQ2LoNWGrWm6eye1
         4aWL2V/VOgW79xMJEUvhDmw5DYjZm2OJgOhaEzooQKR4AKcnx4hUJtbnVYhumEk4SsV8
         RNTWjO5iscEVe6d6aKqG4X9OsuFpIJgyROIjwGH0jUiFu2qUA2MEXKW3ldb2Ty38FXxz
         qzrIjrSw5P/bcA/DYhmsTFwKnZEIwfnMlm8JdCQLFlgMYmSOrhccJrayGBgmhdq7zZSy
         Bq6MYmfgLWw5xIXiGmAuovhLFumMfRFxcTZID81Wvtdi2C5iVeLhcCpLaOvGYjt79c7Q
         P3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447295; x=1796052095;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/NBo049vkahD6DDx4SDzPe/iIjbhwkc74fZEa7Rvok=;
        b=vZ5mnfmopTnntQhY83m1yFy2k1geOFnKo/NUL7XPz1hGxXYgeXnaMcM4qYzhBXsYJy
         OJcpSDT51CCBOyWkWE4Pb33J71JEjsLitWR9ziRHk0dlfbghM8aSJRyaa4/19sAWCTmc
         E6tI7ycmnXNrhx9ExG3k6ZDViLtA82vGxiU3mNElLDpZCoLKMpOfzXw9G/T2sZLvmHEa
         xl+zbmZ1HdV0zhhuVbHzHQcV1wPvPDjKMphCgkjFVpURoqJxhCR4sKuf3pTqLtjBRzDS
         8YqkkHY34D8ZKVcKXv/4MpRo8aJ090ZNYa47X6acyGN4ADSLrJhDQNiIA+k75Ov2faWr
         NyEA==
X-Forwarded-Encrypted: i=1; AL+hErHnFCYBAy+jgjxAFWvK2dmhPHioHZ7KLoOyhwG3c7L84Xdf7wq1t33eWyT291NKc9dY9DlBUOyqThG+ZICPurym@lists.infradead.org
X-Gm-Message-State: APuU4Z/Uc+0bYcY0F//XwKPX020N9CgyGvfs02OLXfmvu9SiWtuz4xLM
	NlbxSejXpGNj878LvCNdicUnjUEGuCUuwhenL3jptuFIJrPijGdQ9UZt2pVvVYGsStT4lMcAv2J
	IQyMlEF8=
X-Gm-Gg: AZFdTZdipvOrL8NLGpPc2i12cyZWc0xeluhGQ1wHpmy0BttkL05nDiBRpSJRqyID0O1
	7+OV8XBUxH6tk8920sp0SRUbsUnpuwZAgQsRXMAg690BhEaIOUzWF9H0ry2hF8PwqNnTlvEhBaW
	rBLm9oc035xiBWlnsXbDbBKjN+wkPWvciRAGP1NzCAknk/6isf0jPv098ZE2NGkww4e2XS5tqFz
	YIACuXMGatgfvviU8mwnh4SpaHIOfOo90OxHb3K9sdBaVGdQYpg1xv2S5b3yeXxULWlCyfjyeql
	kM0dmji60WNWWQwavisxtgOskrzMsQifBRysJ31YEuTREEQnkqg3+OjpHqTDQ66KR0aC8bRkYUK
	uHnBDIkCz+nrwM3tXeUQezNvgebtQENgKkzWwm9jdtfd2c7BOzV7isO6xwU4NpBsMNdAtKwqd4q
	AB29aCtc+E1ZToJsBstLXv2QjbBa4ciPA8TCbR714nLrNBWTc5atRo5xPSNhVNshQmvVsPB+jXX
	Z7/VEOafdXJqDk5fvg00Bib6kpxdDPmm+ZDQjGgsWWA2uSnhtONUKyuAipn5fSAL2flD0b9wFIu
	tPe4jn9VsdoO4ZDWQ3VEZ2INqUrQTFoPNPramYa4l7+BTWk620A=
X-Received: by 2002:a05:600c:848d:b0:4bb:6687:5386 with SMTP id 5b1f17b1804b1-4bb8880c7f1mr260733355e9.19.1795447295376;
        Mon, 23 Nov 2026 07:21:35 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm22128006f8f.56.2026.11.23.07.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:35 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:27 +0100
Subject: [PATCH v3 05/10] pinctrl: scmi: give no groups to pin-only
 functions
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-5-d61f039be008@baylibre.com>
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
X-CRM114-CacheID: sfid-20261123_072137_422405_076DFC5B 
X-CRM114-Status: GOOD (  11.57  )
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

For a pin-only function PINCTRL_LIST_ASSOCIATIONS returns pins, but the
driver registered them as groups. Register pin-only functions without
groups.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 23287c3add35..80c6e83a3a2a 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -444,6 +444,7 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 {
 	unsigned int nr_funcs, nr_groups, i, j;
 	const unsigned int *group_ids;
+	bool pin_only, gpio;
 	const char *fname;
 	const char **gnames;
 	int ret;
@@ -456,13 +457,19 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 		if (ret)
 			return ret;
 
+		ret = pinctrl_ops->function_flags_get(pmx->ph, i, &pin_only, &gpio);
+		if (ret)
+			return ret;
+
 		ret = pinctrl_ops->function_groups_get(pmx->ph, i,
 						       &nr_groups,
 						       &group_ids);
 		if (ret)
 			return ret;
 
-		if (!nr_groups)
+		if (pin_only)
+			nr_groups = 0;
+		else if (!nr_groups)
 			dev_warn(pmx->dev,
 				 "Function %s contains no groups\n",
 				 fname);

-- 
2.56.1


