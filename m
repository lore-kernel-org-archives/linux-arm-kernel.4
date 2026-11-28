Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C679606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 04:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lM/QSy2o;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D9PQ/Jq9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-Type
	:References:In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qhf6HHYFUlV0Ii1kQze/CtNGoi88xb50T2RCDKewG6I=; b=lM/QSy2o2wN0ovvkI8WILFVxfI
	sklfbmDwv6S6PbripZ2OG317ZQjKjApuZDGoCR8jXu5g010zPKGpnTFpE51t6qr9zJRalrNjmL0zu
	0Q7B0su1NIr5yyeEhhpu3P8P3Pe3sxjuzZ5T1tADLfju3HX1gNfSzPuPg0F3ddlfAvYYJYpa8R5f6
	zdVeyE859RZid+zh2puw5YtXEhWorSYh30J4HaAVg9DmvAi52756y8o8jrQSUlpXHe4Vg4MiQe9xp
	8hVqCynwMdMvFz+RqjK8oZgaDFIrU2fwlViTmw2+SZuMpoGiB4YZk+M5dgc4X6R1FDfF0+1HxpKZ5
	etkZ4bJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXA7d-00000000N6O-0Wn0;
	Sat, 28 Nov 2026 04:33:13 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXA7Z-00000000N5a-3v3c
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 04:33:11 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso3572262a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 20:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795840388; x=1796445188; darn=lists.infradead.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qhf6HHYFUlV0Ii1kQze/CtNGoi88xb50T2RCDKewG6I=;
        b=D9PQ/Jq97fX4uSU+v2R/mHfPeAyxKNhYK0nSLpWO11173oYxstsgMAegR6Vzk6AFic
         RCZ6rgPcNS2YuNfCa6cN7MnUucTuT+yyzl9VA5l9HckOVb4s1+BvmsIma+x9nnxqHGmL
         52jSfolOxNStksbdoVit6fml9SDn3M8Y1I+aGx5raqL4J58H7BcAxjVtXxfmNl6OQ5yA
         Aza0AIskZBAjsbKe6qetE3Qzy8AuJkNYltm9fVR6MV/IVQYdl4DdKXSO34v3Alg/S6PE
         hxvLIjQK7mhBHyVyNeu5AGB7pmYL8pM357hOCy4k5XbBP0EDoA5+YrgWew3F4I1liFL9
         +U0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795840388; x=1796445188;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qhf6HHYFUlV0Ii1kQze/CtNGoi88xb50T2RCDKewG6I=;
        b=2v+E/i5Jsfg/twqMzqAZQAawz7SD2rj6iZuujd8KgAcMKhuWnuohikM4aTweZ+WgWu
         Ngu7K+BQUJxygjs1n4c2mk2GcbYDAHhYAv5lZJ5sd1UNFFesdvmFxZnIktEu7R3Rnke2
         FqORUaEzDR1HehSl/cFb+SJ0n6P1xsJEJCOrj7oxlUMimshh+XrvDZF1b2hny/ayvfD6
         TdBpyibefobB+O4+qB/B1TaLSsHN1DxNX4KZz9elA/EIQForiaPA/XSRAxgTw9uZJG8J
         aWDesniwTmySQiOFs/3P3cHcRdOYpQbi3ObaORrmH/LlaCWYJdugmW4UvWpEcmu6jQKT
         UnPQ==
X-Forwarded-Encrypted: i=1; AL+hErHt2ZVynmdgrxv+WwnG75SxxlQuqIeyxy+v7rg6GAqDE/Pp3351Rx5o3deQWw0/VvYi/2cNWty666Sgcr7YlZBr@lists.infradead.org
X-Gm-Message-State: APuU4Z8hnKh69shS7QZUZupScypvFEokeq1JUo3Z484x3mGBbgsUvftF
	j6LoOOGFXNm6IEBtV1vRAZn9GPlDsO2xpEncYL7vxv08lvilealWwduh
X-Gm-Gg: AZFdTZdIz9jcsVcKW/JpGEQw0tEYuaJDqBXvI6EOBOIBu/mErWXSAnNtfdr/3h2iTiY
	b+7PQju3THOh166BetdIvs0iOMcd9V2nIzjH9WjJ/N7nA12jjUZLxJ5OCb+ZQeDB8kHBoMrWzjq
	ar6DeQEss6bYz4RSQyz9SM7SzNrEi3TLEvDLmPVF28JHGujDEpryCRhx54tm9qWE5TJtU9XBjGT
	gJVr60PfdsWLuIzhArT+bFpvY1r2dPErE+t6wpxXqEGaBQ8ria2kjjgM7UZWRxxUMi60U8oOwgt
	FOq0GfcFzplPlTI3HrhGIr3oYvZWDCbQb7R2b8xXiJoXiYZOEGjpDjTu+d9u/JGfYjgtWP6mm33
	QSAVv8YuxfLHvXznZ+jyR8y1wjShDjV+1tl40deioNoRiOipzqKE027OcMkPFffgQYBxyyMIEHq
	jAqWMaebYGzIlA8grqLUBctHb+snmQQ7bZRTxgQPJjMjTABUcrG3mL3lqRHXomaeLPCw/ALwYXj
	U9oriIp+ONyGYxyCyS/U7JBrzgU3Q0jT6AWjTt6YcMKuvefVSAdnNOh0fzQW12Z58OVBjzdhrKk
	FnlFbKeZzd1Mh8aXGtWQpUo+A+kLsNMpa8uB3BTleBVELCeRniva+aipYeciJkfUYni+uvPIFCA
	=
X-Received: by 2002:a17:90b:2648:b0:3ab:189b:6980 with SMTP id 98e67ed59e1d1-3b41c952ebdmr24822169a91.39.1795840388460;
        Fri, 27 Nov 2026 20:33:08 -0800 (PST)
Received: from mac.lan (114-45-156-18.dynamic-ip.hinet.net. [114.45.156.18])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7d36bcsm17993882a91.3.2026.11.27.20.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 20:33:07 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 amergnat@baylibre.com, me@adomerle.pw, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] soc: mediatek: mtk-pmic-pwrap: Add MT6789 support
In-Reply-To: <czEp-CqZIp301roqRSqIALy9ubTnOg7uHv75zRifEAuhIS0f1zSU45eKzIC3fZfiUnaahQK6yVuQvthvHZOt267Mpt13X55ERh2A6HJRTic=@protonmail.com>
References: <20261127030009.10572-1-iasnezhkov@gmail.com>
 <20261127030009.10572-4-iasnezhkov@gmail.com> <czEp-CqZIp301roqRSqIALy9ubTnOg7uHv75zRifEAuhIS0f1zSU45eKzIC3fZfiUnaahQK6yVuQvthvHZOt267Mpt13X55ERh2A6HJRTic=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Nov 2026 12:33:01 +0800
Message-ID: <179584038151.67185.14057994923136112895@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_203310_039526_16FBC871 
X-CRM114-Status: UNSURE (   8.64  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Hi Roman,

On Fri, 27 Nov 2026 18:12:33 +0000, Roman Vivchar wrote:
> I don't see INT_FLG and INT_CLR in the 5.10 kernel [1]. Where did you
> find them?

They come from the MediaTek PMIF bank 3 interrupt register layout that
MT6789 shares with MT6833/MT6853/MT8195:

- In mainline drivers/spmi/spmi-mtk-pmif.c (mt8195_regs[]) and
  drivers/soc/mediatek/mtk-pmic-wrap.c (mt8195_regs[]), every PMIF
  offset matches MT6789 (INIT_DONE=0x0, TIMER_EN=0x3E4,
  WACS2=0x880..0x8A8, bank 3 IRQ enable=0x450), and bank 3's status
  and clear registers sit at +0x8 / +0xC:
    PMIF_IRQ_EVENT_EN_3 / PWRAP_INT1_EN  = 0x450
    PMIF_IRQ_FLAG_3     / PWRAP_INT1_FLG = 0x458
    PMIF_IRQ_CLR_3      / PWRAP_INT1_CLR = 0x45C
- The same 5.10 tree you linked also has this exact layout in
  drivers/spmi/spmi-mtk-pmif-core.c (mt6833_regs[] lines 167-169 and
  mt6xxx_regs[] lines 119-121, where mt6833_regs[] in mtk-pmic-wrap.c
  is identical to mt6789_regs[]).

Omitting PWRAP_INT_FLG and PWRAP_INT_CLR in the 5.10 BSP's mt6789_regs[]
leaves both entries zero-initialized (offset 0x0 = PWRAP_INIT_DONE2), so
if any interrupt enabled by PWRAP_INT_EN (0x450, mask 0x180000) fires,
pwrap_interrupt() reads/writes 0x0 instead of clearing bank 3 and leaves
the level-high IRQ asserted.

> Also, the series doesn't apply on next-20261125. It might be due to
> recent mt6572 changes. Please rebase.

Confirmed: the conflicts are from the mt6572 commits and the
dev_err_probe() conversion in pwrap_probe() on linux-next. I will rebase
the series onto linux-next, carry your Reviewed-by on patch 1/3, and
send v5.

Thanks for reviewing!

Best regards,
Ilia

