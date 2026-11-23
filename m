Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501FB606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2wcYkcuB;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ka2kTtw0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kJxGN8j5p+C8+Eg72heXebT/KYzEG6NwxGdULWQFRpM=; b=2wcYkcuBn2148x
	iSnX0ck8NZsXrzbZyTvgM4PbLFxcWrawIU7hcBwJK0ZOQ+1riCylT37BB7J8DW/m0+zckyAV7lsNu
	LQLwJkDRLcXcjlU/r+WRG5gy9EcHvvskBUQJ/fy1gEHHa5W/AVtd6fFEHA7ci8ej/VhvhBBuY21n/
	UP0xHJnV3TsDf3xFaVwTaJk3pgGJoIX1WN3PrSwFP0fDFnSFPdYhVhWh3e0nm1Govdz+gzSOMr0dd
	xKyU5JAeZc4sUBwse9PdPXyQ7YhpFeBISej67kEN1gH4rvhTkzzEbXPB6U3PMjpFHzgi0KWQiIked
	hr06+OmkeDzI+g/TAARA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVrU-00000003wYP-21mI;
	Mon, 23 Nov 2026 15:21:44 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVrP-00000003wSi-0SMI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:21:40 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so32003345e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 07:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447297; x=1796052097; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kJxGN8j5p+C8+Eg72heXebT/KYzEG6NwxGdULWQFRpM=;
        b=ka2kTtw0+uVt1KjtKHSyKWIk2V0WPlWa9Qntexo945xnD90KqaAZFhQnvkkanuefYR
         C1rRnJFUN3jgD2t51QEnra0Lo4JhTYAWuSWQEW1Gzk8L/a8hzf1/+7BktoSh7rBv4N0X
         fTzFguy9a1ib8IsF/G+XayZGB9jUEAGwD1hy/u4XKZIkEMAt7q4hNIRkV34CNPq5A5zU
         5s04n56KeH1HfAHmI/3WhZdhzkk5txWK/I007Jb9U3U2xGidLrZJo0fjvMOY+pLeDD7V
         9hi3XS7LnICiMNsUs/AwxSUOBCwQtNn50F8uLpt13St0J6S9UECX71/TIC2I2b8boLC5
         jM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447297; x=1796052097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kJxGN8j5p+C8+Eg72heXebT/KYzEG6NwxGdULWQFRpM=;
        b=J0WWy9vOb3Fu/BylK4tO69C9dmQdyGAsq4TsIIaRaAfyGKDvrUQlhYlN5hZLUxELo4
         4XQPer8w+QJQcdMWpwQ1jQmle8KK0JB2lXCFQR111JjXp1CGJiB9IbevLzm/ySC9noeb
         2O6Ua0jWeWlWdioSFaGJmyVBc09z2njcYceWeFZNZqLxjdsxrNXLzMmSiLddhZ116TvM
         Ijuj/SKGuGG9maHint9+WjauFlsIMkSqlyFdAdrl3mEuiM+k7rf5KUYcUwVUX1pBFNZl
         +CfYLSroeoPubYymcbCpFxc5c14dBWSd1QvLn5tDvR0ZblJS10kEmlG5cLiuVHrjBjRK
         Rh0Q==
X-Forwarded-Encrypted: i=1; AL+hErFGLj1QiBalAFMpcRIY2ONFMQHSn1Q9cBwfTM+hmxswZrSKVAh7X7IiwMo22Ll97TgQ3ahIQfv2rdz7HUhz2AVU@lists.infradead.org
X-Gm-Message-State: APuU4Z89268ZDqlJqmB6GyDBO3TEzmoFtijZVZ7fiz7N535qhXF1WXNV
	SFBumOOj9f6YCirYvfNbB5ChEzXt8EPfB/vPOkQseycRfUFNfXEZtZivbJgnnJCxEFA=
X-Gm-Gg: AZFdTZfKmpLaDwexVJ/SyXjmCwk2SyWvkh8IF5hIBBvYuJe4jSBietU+X9zirdjjRFN
	gCSr6FE407BMHXvecTZgGOkKYzk1/KHJuLy4fpmp6djgkv8d5q6wFub1Y2i4dbOry4aeF4exjM0
	XsQ9PXp9p7VOjodl7+pbJNakMk/9wnyTtXVJWgXmfFCdI6wUnWX8BikZ9ZOLyMlmWehmBwYQXpu
	/nhw7AGyTZLCwpBbbbMS2nYg5RkXI3huJrCVfAJNgQ94s1D7ziyPrbzpX8cxkvdsKvt2rb/ntx6
	D5d94bNsDqAtuurFdg/ASihcH6wrLYOiF1X26m6MX7ONbRg26J+M7OgwmpcwziG+BlgOxbyMe46
	YfbVJ1sXMTxJNaWKvNOSUgdt0dWMd03bY/K3Wc5w22WcCBTEk2T+tE5ILXdnbYq1D2eELfDLzw7
	Ihxu+odfJ8a9V3ZFooxNISWv3CRt28xlvo6Rp3Gx0OruOD2vW1zAZkLkn7HSfF6Xeq6bHWM/r3T
	52CY1ySQ7jnzu6bgKGyGp9/Bx3T8YvDOpy8x4FYm/u42op1tYmTSdMSZYIq/x0lAfkkWUx7WsJY
	6+zw7AWIX+IQ3g/iQURt9Eoq53qjkPIXp82uw3LM/ENyAcCAom4=
X-Received: by 2002:a05:600c:6749:b0:4bb:8508:7fb3 with SMTP id 5b1f17b1804b1-4bb8881c3b3mr226405515e9.11.1795447297388;
        Mon, 23 Nov 2026 07:21:37 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm666128495e9.4.2026.11.23.07.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:37 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:29 +0100
Subject: [PATCH v3 07/10] pinctrl: scmi: mark the GPIO functions
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-7-d61f039be008@baylibre.com>
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
X-CRM114-CacheID: sfid-20261123_072139_171749_D06C84C8 
X-CRM114-Status: GOOD (  11.12  )
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
index dc3282126d54..3965f920851b 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -444,6 +444,7 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 {
 	unsigned int nr_funcs, nr_groups, i, j;
 	const unsigned int *group_ids;
+	struct pinfunction func;
 	bool pin_only, gpio;
 	const char *fname;
 	const char **gnames;
@@ -485,8 +486,12 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
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


