Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07B9606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 02:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J/0Fih20;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sDra+IHp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-Type
	:References:In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WvLKGjsnwQSscR6jQI0B1bkWyy4lcbv+rNW733JqcOI=; b=J/0Fih20uHWDI6FmdoD8owPD27
	OO5SK1oWVmkDV31s9VTPMAYJcASTY/L0L7Uy8DVWqt7wsqamEq2WD8gzOiIry2mZrRzVD8mipZFD5
	nGuVh3rojcEhSnTWYUMBtxBVTfAcdIn62UqlgQNC9JXn1jZGZIO8aKFFyKFHSUOAysVdYaFyBJlZP
	wFHIGtBfuGMrbgThr3zsi4Z8ty7vf63TK8ream9D3LcQs+/tfF6r/g5uK1cgL/Dpwr6GqguYD4HOM
	z0vKiasKESfklhhwpcHosiLuS5qwzul3vVhtn/mEtnx0bw/f1IGRMwvarwMiF/atC1gEdtKQvK86y
	kEuwVwHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlhQ-0000000Emi4-1JWd;
	Fri, 27 Nov 2026 02:28:32 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlhN-0000000Emh3-3uqU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 02:28:31 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2f037bc348dso60334005ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 18:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795746509; x=1796351309; darn=lists.infradead.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WvLKGjsnwQSscR6jQI0B1bkWyy4lcbv+rNW733JqcOI=;
        b=sDra+IHpyYpSDGnV6Mooszt//i8SnhvOHw6M8AHlGEHZd+1aqWpDSk1oqh96uNbNCx
         LC3QrBLwbt2uxKqubYdPXjuvPu5bmNZVCKxiwOSm5CV3QJa9Hdhy88I6MPn7er74N0w3
         qL5dLFg8yTXkKM41isX5IjpeNUwWXTQhOmA7XU1glCZJgv22wh94i+xeb41qSsTMuWdl
         P+7qZLSrHQM9GUHg2TzsvuZzMBo3MPsZULdUEJdLvmKZ4l0n9fynmJSqUiTImJ0jDy8s
         FHMaiDG8DapAx+MnbgXdr/fYIg8C5XWodQOjvbGCRtJI79aors5kQ42Adexgt8yZsfXt
         oi5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795746509; x=1796351309;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WvLKGjsnwQSscR6jQI0B1bkWyy4lcbv+rNW733JqcOI=;
        b=jr1JW0R1GvL4DeQLEI/lbsScDjfLCMVkdQaSJuEScSP57eJ8w9dXnK/hLUuu6aXSnF
         8YuxzYCge1Gy+10RrFoapSWEiRDSjJSwAqtFDrs0g7+p0XiObHFXYhgLdfX2Mwic2xGT
         QzXDHlE3fL6JlXYeGAFSxz0aN/rl8KQUT2/NGLd4q/CWKfpmKuHdeYow10WcyY3hQWss
         v9cLNKuciKK0uYmibgXz54yTlaY+4euMrYg/5zSDZaYPAAupWW/ZUc3IyDRxpq9NPG5B
         PR0yZlBqEAmwdxRp3I06SlncEs84bT0yJRj4WNGJA2z/xb4AJDaQlSh7dH1/BKX3/6j4
         sD6g==
X-Forwarded-Encrypted: i=1; AL+hErFov8a89EboIVUp5mwtovOHv2qevJGvBPRPFC0nvcwxruhyWED6gR8EdKbtdE2OBsf6TPx8/FrFkVfbmLzySHav@lists.infradead.org
X-Gm-Message-State: APuU4Z+driZO5e0IF2VaI1SxcvNy+yQ3lAFvwEUk4GPwrUoWCdKp0mW4
	IyMIOWQnqe61DFQVJokVFvuxnhx7uCbVC5PXOR2O3govAd4cbF9EDbRO
X-Gm-Gg: AZFdTZdw4bz/5twrXr4R6KvSfV1a5Wif+4N89t5Wazok4hL5rPB9Z3edHnTqaT0rgrq
	Hoh8uhmFIs+qX7ilm1Z3ustZUydCUn9KDGWdk7TjBajt37zQESEb1EgeakiGM2ApQFc8HrdfU8F
	xTolQ/8+CezDYxVoEcNyoeJJPYZJJwtb4PD00H/MQU4iSot/w/yTr80Q7ejkErWy5EwdT0YVZh+
	Z59zxVIS9cYRSZX6j9jSAW4JiMBwydYWMQfQpCxH4wdbKEcSEl56zC8PO5w91A9vxwpcpvILmJ3
	4BIDUriYwPyJlAaa2CgXBW3haBteHp7xoNZGmzgvrYNE3nKJUt0AUBYh+W2I8xJckIiryNBWgVN
	yEkC9hC2WMeZv9fXweHPtCh3/Sqx0l1ynDonn4gWY4DtWPRWjmM+bkuPwgUyn6W8r9RTu3SBzHR
	k5GnPgj0vqbJAdJhvrYOfQeD0bMs+7cYdP2j/q781/RADPXmrxHALS8m2gAKSnZNv69kXw0qgol
	YwTJ+zxAytP7g1QhA6xzJU1iJg6T8ihDMU8T/4HXg/lgRu3KZNQzDQXvgsaV7Lmdl6WNXZDHggD
	SfSdKl2lbHmaGf+dCE+ebqTbgKG0cXfc2gqaKvIVt+JxcyJH8iX1NWRGqlQqgpSxJBD1P057274
	=
X-Received: by 2002:a17:902:ea01:b0:2e9:8ef0:cf6c with SMTP id d9443c01a7336-2f03f1ed55dmr230265165ad.26.1795746508987;
        Thu, 26 Nov 2026 18:28:28 -0800 (PST)
Received: from mac.lan (114-45-165-38.dynamic-ip.hinet.net. [114.45.165.38])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84027sm111030145ad.7.2026.11.26.18.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:28:28 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-iio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] iio: adc: mt6359: fix MT6358 VBAT impedance
 resistance ratio
In-Reply-To: <RyeVHYGoYxuKtlQ0QPskoF7emL4yakkPeBUW--rPVYqvaAM4Q5Pm1GACcF4t-1DjyxPPOMNyfAiMnTxVqugYC2MBKxUBhRiDDjtcPNK4Z7Q=@protonmail.com>
References: <20261126031013.27701-1-iasnezhkov@gmail.com>
 <20261126031013.27701-4-iasnezhkov@gmail.com> <RyeVHYGoYxuKtlQ0QPskoF7emL4yakkPeBUW--rPVYqvaAM4Q5Pm1GACcF4t-1DjyxPPOMNyfAiMnTxVqugYC2MBKxUBhRiDDjtcPNK4Z7Q=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 10:28:24 +0800
Message-ID: <179574650424.5055.6452827952792020438@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_182829_978418_5068DEE6 
X-CRM114-Status: UNSURE (   7.49  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 2.2 (++)
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
X-Spam-Status: No, score=-1.9 required=3.0 tests=BAYES_00,CTE_8BIT_MISMATCH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Hi Roman,

Thanks for checking on MT6358. On our MT6366 board with the vendor
mt635x_auxadc driver, IMP reads the same raw value as BATADC (26737) and
converts at 3/1, so the divider itself is 3/1 — but comparing mainline
mt6359-auxadc.c against vendor mt635x_auxadc.c shows two differences that
likely explain the timeout you saw:

1. mt6359_auxadc_probe() unconditionally calls mt6359_auxadc_reset()
   (pulsing PMIC_HK_TOP_RST_CON0 0x0f90 with 0x9), whereas the vendor
   driver does not reset AUXADC at probe and relies on bootloader setup.
2. After pulsing HK_TOP_RST_CON0 (0x9 -> 0), the vendor reset table
   (mt6358_rst_setting) also sets AUXADC_RQST0 |= 0x80 and
   AUXADC_RQST1 |= 0x40, which mainline mt6359_auxadc_reset() omits; the
   reset may also clear bootloader-initialized IMP0/IMP1 configuration
   bits while mt6358_start_imp_conv() only sets DCM_CON (0x1260 |= 0x3)
   and IMP1 (0x120a |= BIT(15)).

Since I do not have a mainline MT6358 regmap dump before/after that reset
to verify the root cause directly, I will drop patch 3/3 from v3 and send
only the Tested-by/Reviewed-by RQST0 fix.

Best regards,
Ilia

