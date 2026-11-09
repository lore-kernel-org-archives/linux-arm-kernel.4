Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A18A606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 03:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HnLo8du2;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VZkhMefT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zzUsqoWWp/37aI1KkAkv33nSCnrwJtj8I9U8iTKFJOg=; b=HnLo8du2+vZNMW
	gB3ZNBOyxEnNBP75UAaUjegGcVECDFKlUzhrHtI5xYd2D2vBqJ22pfI2oBJTO0a2S5hjqc7hPqusP
	clKUSXgb80I0Ct4HumTfq5/qvyjPuc2bErHqeDPefYHx/B7T/trbg8xh2l1PNgT6XWelAjdWHLqaM
	hyCQvqsUxDB8o/dcW4pHgVw81wy73Ivvx4DFKTC4pmflXFP1GEzN4eBD1q9NnuqeianY20rPNYmjK
	DSybWL9GZ1z2ggAdotcQSDmjg6+OFGntRUPG3FkwSpkVzYzgKhhfPFXCM42EtJH5I7aUjxbxHAv0g
	YyHQFZiLGwApcdUG6lHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGVX-0000000HHMd-0gAa;
	Mon, 09 Nov 2026 03:57:23 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQGVT-0000000HHLf-48sA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 03:57:21 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so436002c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 19:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794196637; x=1794801437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zzUsqoWWp/37aI1KkAkv33nSCnrwJtj8I9U8iTKFJOg=;
        b=VZkhMefTAlOEDcAkfHmKo5ZHJKVgfxlLqjdbX/ihBxUFBTNoF9NrC4yqG5IGiM5FMO
         c3eo0aBFwlpEsPEoseoyHYz5p2CFDPsNkzqpAcdtWekmCXPdYMFRCPLBMAzP/s382sqJ
         aQNgYnLDN9Xso+uB0C4oZNyAx0h400c7zgrhIWjQgePUdDSJm39UBC/iikQ2i8bg0aF3
         0YmpqVmVdDqOPRGEH52EYUkfFgbesU+2bzJ1gfemiak3rMiAQ+kzFlwzZnnjUvcvlrCU
         P1qOVS5/1bEXZc0WdyP8zIwySVAjMpUi89SZ3RSHJhx3Gol37TU/HBUcMKlxCeAbAEQo
         GgLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794196637; x=1794801437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zzUsqoWWp/37aI1KkAkv33nSCnrwJtj8I9U8iTKFJOg=;
        b=AV6mr+aLEaqTAw+mvw/zKbyLaMQViYip8RDMet0wAt6mpPRyRv2/NmI5dUmh3DvDKs
         /qX6oIEiiMqXCWuxEZcJkfEvjoBCn/l8l6WDrkpw9/LpfOd0pxpc8ebVC0SO7uqxsuhj
         6eIWR/GzbqMiH1T/fDsQF93MZW7pSPPBJL3+peX82FPcNiEZxX3Dr4yRtEksOOKPvF3m
         8a1ga4BhARIf+0qnO0XVGtR0ZJZVpm4FHJ2K2Ul8ywQcqTolrdNLGMmBUcT9IOjcZUjB
         FV4SJx+tnZs5BBznApUj6iGx6ov2o+10E4QcB34/qVF5Igp7aAQ7QcYWeJ3+ZJcem269
         Cllw==
X-Forwarded-Encrypted: i=1; AL+hErFyiTee7x7OojLMjYDTUuDt3OLB+rV6RNDvmwKRBUbKpv5+hRiRpk95mc5zVzfNDtSysBJDTm0+Th1DKDGjH3Ra@lists.infradead.org
X-Gm-Message-State: APuU4Z9OMPLVbsAH8/hSECuEUKASZYYLm937+UcPqmI065uf5i3kr3dF
	RkKnkL9pVTYG46HGyuw8Vc9ifef6G7VgRKhNMG92RrXngF1UsL+Wqgcv
X-Gm-Gg: AYBFou2mpta5lYU4wLiiIprpobVTuH6KGhSgBJ5fWGW9c77Gmh9A9+O1j33K96qmIPR
	NcLboyXDMqqmrkOJClran7EKJZ2supaZ3eH+/fNTyltnBJTK+mfJIgE7Rqx+UbFKm7NMDg32Ww4
	uY0Nmh7WietccylR9FuKtNOWNH1HyVKdSZdQ+QdTbMqwmU7lbEDxzwpiYp4y/d6GMIWeD21rP63
	4/W/DbVRyzdkf7IPUigpdXT1ohzBS/6/UqqdGAXEbFjbDG5tk8IXw9cX7SYsK09XGahmhWqG0KK
	9xNFlFTwhQbKwd9TTpzltR9fb42ZXEB9h7gx1VwfCeqqKa+lPO+6gQVmRyPLSpv7X1bxO+N+efH
	GwuJTvoQUNMBBf6m5x1Zn0eJKYs6HYoLMkYQ9cuxqSi7CqApPO6+u0QSH/mIG2G8Zqgk1TC/ek8
	NNo6oerp+aZdcE1LB8WI9Fj/V2gUKLsXA5tiZ/Tm0z/ngfMA25UeMX1N2r85b4Hn0NTptGXGu+l
	DlWUKNVWvrP9BicHTDt+GIQHSB+p09tLQPPt1zijVqt9Bcl8OxU4R3fQ6ghpvUAN3aM6WCKXCsc
	uA6xt21cm/IdWZI7Ygp92eDihFyz7EMBk6TecGrph9HIqQ==
X-Received: by 2002:a05:7022:1709:b0:184:992:c9ec with SMTP id a92af1059eb24-1b39fecbba5mr4108971c88.38.1794196635837;
        Sun, 08 Nov 2026 19:57:15 -0800 (PST)
Received: from debian.prasanth ([103.183.205.43])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37560d95dsm8720109c88.11.2026.11.08.19.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 19:57:15 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: andrew@codeconstruct.com.au,
	linusw@kernel.org
Cc: joel@jms.id.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v2] pinctrl: aspeed: Use managed pinctrl registration
Date: Mon,  9 Nov 2026 09:26:33 +0530
Message-ID: <20261109035633.93522-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107012236.28069-1-prasanth.padarthi10@gmail.com>
References: <20261107012236.28069-1-prasanth.padarthi10@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_195720_031261_285E7F96 
X-CRM114-Status: GOOD (  12.92  )
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

The shared Aspeed probe helper registers its controller with
pinctrl_register(), but does not unregister it on device unbind.
The registration can therefore outlive device-managed data.

Use devm_pinctrl_register() to ensure the controller is unregistered
during device teardown.

Fixes: 4d3d0e4272d8 ("pinctrl: Add core support for Aspeed SoCs")
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
Changes in v2:
- Add Fixes trailer.
- Add Reviewed-by trailer from Andrew Jeffery.

 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 7e0ebf11af16..eb5f404af8c2 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -461,7 +461,7 @@ int aspeed_pinctrl_probe(struct platform_device *pdev,
 
 	pdata->pinmux.maps[ASPEED_IP_SCU] = pdata->scu;
 
-	pctl = pinctrl_register(pdesc, &pdev->dev, pdata);
+	pctl = devm_pinctrl_register(&pdev->dev, pdesc, pdata);
 
 	if (IS_ERR(pctl)) {
 		dev_err(&pdev->dev, "Failed to register pinctrl\n");

