Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2539F606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 08:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=drORbs3z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OOnGsAGVoEs5x1m+oAWfOlWtzdwCIzVoBKrtW1ml1LQ=; b=drORbs3zrGSqBYLLQCvbCY/gRx
	XCRoLCk9e058umdca3RgAG9JB3bwShgEkhHOHb4G2wqeyhEkNBOQpfN4joVXnYnyvN2NDkJJxwc8C
	ZoCMs0zkVqhlwMBmurl9LOjOEd5ZHwuWrXvE9NkSNsLNTLjjbsr6UMTU38K6Q3x0bKVC9GAEsAkDs
	MqjjV36imsZuogHI4R3UbsatFvTe3yG97bqOqgclY/M2r4WFgfKBNUkdvDzyJ7+PN4ghA+NL1Ar/A
	/KkWCfF0/iUoiEf9WEc43Kv0WmwXve/hvTgUUyHKewX+tsQCWOVqnFa9ognmQF9EsCLjltVZNaH6r
	C32In/iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJyL-0000000EKwv-3JS4;
	Fri, 20 Nov 2026 08:27:55 +0000
Received: from mail-ua1-f53.google.com ([209.85.222.53])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUJxU-0000000EKom-38nt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 08:27:03 +0000
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-99e1b352df9so198509241.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 00:27:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163219; x=1795768019;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OOnGsAGVoEs5x1m+oAWfOlWtzdwCIzVoBKrtW1ml1LQ=;
        b=JhYB8UgYrYPv2LiEl8AiPeD9moI9+srVPi2feawxg+kt2HPx4yNI9UpAQVnNK/MCWE
         i33VWSH2C4aqR4t30wBicJ9/oMQ8JcHcvIjk3bt3jCYreMcb7doubNQARF88GaEqxvtp
         ZIXysRI41SAH1RHV/WWWAbNzTksxMwJdMvzKB9T6Ga+BCgC1FmCb531IqtqgvC9OQPBf
         sMfS7JbBPAD6pupWx5ztdZux1o7V7zq0OocLEmlC2+EBzKjWtKChm6K0d/4sLPOAUQ03
         +wfIOZ5JMTMhfUx0cZVOYd0wmSZv1gWaeFKRMxSRpebOOOqmOOIEK39TxRpVR3v5/t4i
         HMIQ==
X-Forwarded-Encrypted: i=1; AL+hErFgLcq4cryGLpGypfDBEkYgs83I7bmvCI1Mwg3vq5kDf1RBHA0tGNwVlNA1sU8PBmsbnPTpIr7GalCvZAnbwtpz@lists.infradead.org
X-Gm-Message-State: APuU4Z8FgBhkgK3NxiuceLhGfnJaxf0aLBcLesvTKjSiUMc7oVPq9bKs
	vFK2MQS4TTwD0OirBOTSIWfM6ZBeaWZQXCbMvM7lCLcEnALTgRzSQo4t9x7erW5x
X-Gm-Gg: AZFdTZcrHBzPyo5q2GGR83NUnYCykmyE7b5VIy6aXbh9VHgdxkp6j/OrijQj4Xlu8KX
	/kofJ2FdrjbrAWPkuCUMMgLOlgMVDizDJ6AQecMDYcs5ZMhfkq07hwUwziZxpgvwGSgY8Bwo5bc
	D861iX0qI3qidlwpN/m3QfFG8bBblen3x3o7pHI2YBTfHseowJeZ7taVHHL7wdLHXcmenA6Zbh6
	8AFqZnEOhWp/xKGcH1N5xpBEBRRUreIVQGUFBmZ6d28+n8uhYXL2Ada2Yz0kacah7EuYPjV7GAE
	52wxIxGukc9TTyrHY/2djuUEdKvAcJ126KQ/ZB1M6GbJjNgnmjfse8cuyxuGUDtLA2Y2pBmNndo
	LelImwAG5IlnEWhxauJCGpggptueVBiKHJueTqpnTwofMkgiPqLQhDq1bBkWD7uP+j4gsn/J4Fb
	obzZsuwhtIthJerTMskNqJa9cNl1Ojevf5NdA3Vxmc8x1RPR1jUqpIN/jnIgzRiDDnYxsD1G2/2
	F5mACOib4c46iJl4cFa52JbQdPQhOTlYDmhgZeghBwsVDIrAS7GW3rsApqurhX0Zkopb5BsJJRh
	35yifqSoKkDL7bg10CkREFjA9/ganUtbMNqSQiQl5Sh89jXpIAohnz5Z1zAp3evQaZ4=
X-Received: by 2002:a05:6102:1a1a:b0:7bd:732e:c615 with SMTP id ada2fe7eead31-7d7395f7d16mr596273137.26.1795163219284;
        Fri, 20 Nov 2026 00:26:59 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7d784b3sm2284120137.2.2026.11.20.00.26.58
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 00:26:58 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-99e0d9b3438so175531241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 00:26:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGXLzYkV+mYLcxxAcN7eXh0zKKnjA+5CcSGWqwfRqrKXcULq784+WGUXOHdnsbfbAvxlu6iSc8MHAnXBok7H9G3@lists.infradead.org
X-Received: by 2002:a67:e706:0:b0:7d2:7c63:5a08 with SMTP id
 ada2fe7eead31-7d739630203mr799846137.32.1795163218370; Fri, 20 Nov 2026
 00:26:58 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261107-arm-scmi-arch-dep-v1-1-514872e8ede4@iscas.ac.cn>
In-Reply-To: <20261107-arm-scmi-arch-dep-v1-1-514872e8ede4@iscas.ac.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 09:26:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUov1u3kXzBX3ZM8rRkBdLq_M8LwQ2VtxSEOH9w68Rr2g@mail.gmail.com>
X-Gm-Features: Aa3M54qI8mmq8jn4s299XQgo_FeZArEGNoWUlwaxQmcii1kzPDH4mMAcGfofjbE
Message-ID: <CAMuHMdUov1u3kXzBX3ZM8rRkBdLq_M8LwQ2VtxSEOH9w68Rr2g@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Drop the ARM architecture dependency
To: gaohan@iscas.ac.cn
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Michal Simek <michal.simek@amd.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Han Gao <rabenda.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_002701_585370_69E2318F 
X-CRM114-Status: GOOD (  25.40  )
X-Spam-Score: -0.7 (/)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Han,

On Fri, 6 Nov 2026 at 20:40, Han Gao via B4 Relay
<devnull+gaohan.iscas.ac.cn@kernel.org> wrote:
> From: Han Gao <gaohan@iscas.ac.cn>
>
> The SCMI core and the mailbox and shared memory transports only use
> generic kernel interfaces. Transports that need architecture support,
> such as SMC, already carry their own dependencies.
>
> Drop the ARM and ARM64 dependency so that other architectures can use
> SCMI. Depend on HAS_IOMEM instead, for devm_ioremap().
>
> Suggested-by: Michal Simek <michal.simek@amd.com>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Thanks for your patch, which is now commit fe87ede443a15969 ("firmware:
arm: scmi: Drop the ARM architecture dependency") in scmi/for-linux-next.

> ---
> This was patch 1 of the Zhihe A210 SoC series [1]. As Michal asked, it
> now goes on its own through the SCMI tree.
>
> Since [1], it depends on HAS_IOMEM: Sashiko found that UML, which has
> no HAS_IOMEM, failed to link devm_ioremap().
>
> Build tested on x86_64 without OF, i386, loongarch64, ppc64le, riscv64
> and arm64. On UML, SCMI can no longer be selected.
>
> [1] https://patch.msgid.link/20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn

> --- a/drivers/firmware/arm_scmi/Kconfig
> +++ b/drivers/firmware/arm_scmi/Kconfig
> @@ -3,7 +3,7 @@ menu "ARM System Control and Management Interface Protocol"
>
>  config ARM_SCMI_PROTOCOL
>         tristate "ARM System Control and Management Interface (SCMI) Message Protocol"
> -       depends on ARM || ARM64 || COMPILE_TEST
> +       depends on HAS_IOMEM || COMPILE_TEST

Please extend the dependencies to RISCV (from the link above, I assume
you are targeting riscv?) instead.  There is no point in showing this
option on architectures that have no users of SCMI; one already has
too many relevant symbols to configure.
People who want to build test on x86_64 without OF, i386, loongarch64,
ppc64le, ... can just enable COMPILE_TEST.

>         help
>           ARM System Control and Management Interface (SCMI) protocol is a
>           set of operating system-independent software interfaces that are

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

