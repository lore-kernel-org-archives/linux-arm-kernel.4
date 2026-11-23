Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52C6606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dMEizLOI;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=orQAYWqq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iwsAiO9OeRwcJqZpa6akbJuZXHFjd4eG1osiYUVbJJY=; b=dMEizLOIKnF3U/
	G8HlmoJQEZON3RcldquaMtX4VZBArNMY6gv+JBxSR8p4z0ShA5grVhguNnSaevz3F+LCx1SOZb4Xu
	7KG0RAynyIasGxt5EwLJpMi7munxvQgjU9V/qZ2ncwCbe9IgtaR5R/Qk9ch2NGffuBwRYnFDlK2a2
	A1KqIoyw7KIWQHeN0VHBRV4meHBxMWiixWaeKvqBO9++06/qzI7JDTGzOyM/r1Te0sKpxGtJGlczv
	j0Yduzplp2LjLc5EFm2FCqOwsi1MHM6q4dhLWgDeEeTRwmqHxDRiTVi41fh9AkfsLa3cpH4J+VbMA
	CD151TNMVW8l2DgwtOEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVrT-00000003wWg-3Zce;
	Mon, 23 Nov 2026 15:21:43 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVrK-00000003wQG-2JYs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:21:36 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso42048965e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 07:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447292; x=1796052092; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iwsAiO9OeRwcJqZpa6akbJuZXHFjd4eG1osiYUVbJJY=;
        b=orQAYWqqgWsUS+Fy6utrDIvLrcQ4xy5Cf2KLBzkOa9S8PfcIwnHPx/VUYQk8QFRyz0
         jKOIVsmi9onqJxQKch/m/yk3pFj1XKPAo7ZCZ7HvinbD3P/GmiRmCxcdl+9bmS0q4xE/
         +lm4eyAbwPfSzrLZUwQH0Kj27tHzHdFYXiX/pmjoPxUg2HDP+BAzRVFgA945d3zTrVuf
         zFzrtpL5+ncyPYCAqR8kHjIx3f2j3oc8B6lRN10SPaGmQgUCdKmt0B983Xq7Woo0+Xkg
         1aItc2LscBA8wc5MuBro4gUtpOXsHO77goA12xtOGrGTvjVjx3RuXzpLGtjO3Xa2/2BH
         qG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447292; x=1796052092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iwsAiO9OeRwcJqZpa6akbJuZXHFjd4eG1osiYUVbJJY=;
        b=adHR0UN2pLIqnlNQ5ILPjNEv7d9I1hn8ENpuSzJI5O8cpapzXtWWYuItFJ/jdzV+Mr
         6wl1TYG0B5f9BMxXzirowg2RDyk6EPtH4u85+GrTuhz8H6sL2AObb1nUNdMGDOL5PDGX
         u8yckQnpttD5dSpz0K1tX6u7gfWJZdFIHOduGwEL7qA1P+YieRj3vSHzazLV7tjaTyjH
         o5cacGePSGR0ZjFX5kUUT59DUwkZ5BbUXyl7PmZ2ZjJ7cmrYjOooV97kbZPQIhYr4txI
         DYiNnKkF1mvemVYyA0uJJSdlFsx8BeR9dkEUphBqQlgMy9m7nclXwkyoPGszpNhPrAa8
         gYzw==
X-Forwarded-Encrypted: i=1; AL+hErE6i8EcrkIeUa9IwI6E9MTSkEukgit8u9AjFUBf1Dxly/t2ND5E7/sa0Elikt+wbP8IfD7sI9PJOb8rQ/xcP4W4@lists.infradead.org
X-Gm-Message-State: APuU4Z9mgIzQgR7CtbHuyOnHK1SKLvntrH0DmWQ5tp/eTkkrHcDPcqZw
	LrBqsN9bYD/thYp5pRSykK3BxQKjNoxI08gmEqw45+mUZ2mHWKL7JuFFfeIQw6gyvpk=
X-Gm-Gg: AZFdTZe3I9cP3w6zf1Ird/VYaMLmLPr6cnRKRJiR2XyDH6O86feeyygeWNXRRdiX0ie
	ABiE5KZVxwbELLqIRb1r83+7iCC6TO0j9YiEkF2XZk0laars1KxuTGGew8qjuWEd7czUKncVnku
	+Y3yS8LyYcyz6C6EF6z1qFvjZCmOzCYyOy+EVrt9ZKw6L2I79Ak1rxs+viLH837xoWxgovbt0Tu
	rmOywWsIqp+zsuQH+vH/eNiWtBKdt6Z5QzA8D4HRrB5l2x7ghPK+fOha6g+rtIweyjTd2XICONe
	Dbat+Nv9brutShm+jUMXpJrXvQCtFMF6P7EvKA5T9FG8s2+lYh1orBh4FcfiS9OOBle+q9HeHmu
	pQraYuBsMJJkE6M8VBvypnTnV+FjxUUMhoxnH0Ge0/mGm8birthQHNzeo+45916AfarCgpiPA7b
	voNsJKi5KE7wcYaEXFWArYmwItCgDlXIN8S6/2BPIBedexQPTPRtZ3tdxdXJf6NvpGsDQM+90k8
	5DpJf8wvg+0ds6fria3UNKSt8FE2aTHySkXrcLce9Gepxbb8fM53vkCkX9k18lsekUnI1pu1Pmi
	/flB0lJnZAkeg090hGE39T8aWDkaOqEyLIq5U03otzMV1sQz7Wo=
X-Received: by 2002:a05:600c:1d09:b0:4bb:6b59:aac3 with SMTP id 5b1f17b1804b1-4bb88816050mr253067465e9.29.1795447292523;
        Mon, 23 Nov 2026 07:21:32 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm351526825e9.5.2026.11.23.07.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:32 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:25 +0100
Subject: [PATCH v3 03/10] firmware: arm_scmi: stop reading past
 PINCTRL_LIST_ASSOCIATIONS replies
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-3-d61f039be008@baylibre.com>
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
X-CRM114-CacheID: sfid-20261123_072134_604466_0E6914BE 
X-CRM114-Status: GOOD (  10.74  )
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

The transport cuts a reply larger than the receive buffer, but the iterator
still reads every identifier the reply announces. Return an error instead.

Fixes: 2145af01b9cb ("firmware: arm_scmi: Add basic support for SCMI v3.2 pincontrol protocol")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/firmware/arm_scmi/pinctrl.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index 18761ffbf893..b071d31b5c33 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -265,6 +265,9 @@ static int iter_pinctrl_assoc_update_state(struct scmi_iterator_state *st,
 	st->num_returned = RETURNED(r->flags);
 	st->num_remaining = REMAINING(r->flags);
 
+	if (st->rx_len < sizeof(*r) + sizeof(r->array[0]) * st->num_returned)
+		return -EINVAL;
+
 	return 0;
 }
 

-- 
2.56.1


