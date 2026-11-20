Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42E9606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 08:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xd/MNc6B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O29ozXrRa1nWnNxSLjjwsMRtxZK+i1ptmKe8i27enGA=; b=xd/MNc6B/t1KGSo4fWcFYnhlri
	4+U33Ez3E8akhMfFUoEayuX4ZR6moKX5+Vt5rDyCEOkRAKMwFCAEe2LB1Huay199WjnLTnTsWbdR6
	YNKamw8PkGbnjOqOmrnA9LAp2N1nacB37G8Z62licR/iDjvSiy3RcUkkr4iEWxTIz0L2kQH+CGVyt
	3Ue7B52fonCpbFNRF/YNKM2PK3vsWPC3/Cb9juPHPQ6sxyA14Sd0tQVVu9mZ4mrGHTK4mG8Yq1UGY
	PShRdl4wFmiVJh0l7SJG2mmJFBHZ33ws6E9kV4ozTbHw5PBvsSCj1C64NHtdBbSS2wDDcjrswPDyt
	dFSWfD+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKLg-0000000EOhp-213h;
	Fri, 20 Nov 2026 08:52:00 +0000
Received: from mail-vs1-f43.google.com ([209.85.217.43])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUKLc-0000000EOgr-0B99
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 08:51:58 +0000
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7d2db6408cfso427028137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 00:51:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164715; x=1795769515;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O29ozXrRa1nWnNxSLjjwsMRtxZK+i1ptmKe8i27enGA=;
        b=JEIaqaC9ywpQG7hs0oqa12CefrXBJfh6Jh4GtUeZSfcUBkZ4nXXtXE9mBHln3fFEYz
         3UEw/5T7L1E4bmZhDYKq1wjhLIAr3iSO+X1a2Ga7QPg7uFfKxmEKor1a4a18qY2VwKVO
         myJTfsjb9b9Go1DXOyjmitXT6B47XlHZo9aEqhKmqpclT6033t6K1aa1IZdRmOX8VlVE
         Lj0hKyS6QWBaQ9CkyBz4Z/PUPi2Ft74634aQHCa+B+4JfclRq46oK/JI9fTyv5LUvv2J
         XnCSw5RD661KzqwEDDZoK8kpAYFXaWmZvRiKRsQLlj92S+xyiF/8Vktq4dlS44d7kwPT
         RfNQ==
X-Forwarded-Encrypted: i=1; AL+hErFi/66MGL9K5sycVrl6C1rTpbOZFZogQjBiuX9NgMXLLtfpZAiXudTGhe9aIVsrIurHF6HRU0H5znlLOByuCzIH@lists.infradead.org
X-Gm-Message-State: APuU4Z+Mv/PRwF14lcE2daU/L/A5c7eeS2ijaIo65E3wa7aVG5j1XU+N
	+aHfR9PMzjSrJWHWQ++lZYlCECPibV4dH1Bi5W8B5T/6R9u6NSmLHc6tzfeY3d+q
X-Gm-Gg: AZFdTZeSOPXLMfWlbsOKuGciDVIgCc+J8c3kqcQcc/TVJq3wAEWtDopNxE33EaGXDsS
	1U6i0O0c8u7F5/KMicm+nds0d1/ywD33I67liiwhU4yX+JVKOnn8AfHeA8R3hwAu+iiCH0odejE
	wR3t/34CDLizCS56MtoEO6wes4aNQtFao2l/qEj24KDTImk6jX/u84phVmQmlnQqdbKCDedMk4R
	ZcVpD7P0CSh/rnkWRnw8yDIMbKSfVh+bSN4toOhUfoYdMbnJWtAmBrdjuhkI+oktNG2U32i975h
	5APOV+ADM5hp8lG50bYyuKoY8McMGwie9QmUq2iWNcgioEySITpQrF+xKPrM4lU2gnfUk0WFfTI
	RfmoVhShe2g9LCwAwhaSSxFzdVffi/ATkFPW0wvZIrEhszYIs/y/t8EyVnRIbfigVN22V5gRXED
	XW/L6eCQGvBQMVMKKbtovz3i+2/JFeMXTACPAlvOGkPr/G5AHffTEX92rFYeSl01FIe18wJ0Rfe
	Vb//3WuK6rEMa7bMy9jOfvvs9D+ZTu3Lnym4/OvW2sAt9/qhrawa17saWWwlFyEshFDrtrkX2Sq
	zrKn+0RG5vmo0bUdxX5xixU3AjPKvV0pOhDoKS0U8ULrEJMuJynmJP+KCwnftby0KVc=
X-Received: by 2002:a05:6102:374d:b0:7cc:971a:61ee with SMTP id ada2fe7eead31-7d7393ff678mr1062777137.10.1795164714696;
        Fri, 20 Nov 2026 00:51:54 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6e0686b1sm2395731241.10.2026.11.20.00.51.54
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 00:51:54 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-99e1babd683so309638241.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 00:51:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFlv+dl1vip0MADpzUGRcZzZnqrR1rNmd552rlLPyLnRifpKpS4FRWFFnCVkO9rxHL/EB6wwKksbBeCVtCn1ip7@lists.infradead.org
X-Received: by 2002:a05:6102:1a1a:b0:7d2:b348:6355 with SMTP id
 ada2fe7eead31-7d7395e01bbmr694434137.23.1795164714287; Fri, 20 Nov 2026
 00:51:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdUov1u3kXzBX3ZM8rRkBdLq_M8LwQ2VtxSEOH9w68Rr2g@mail.gmail.com>
 <20261120084335.3492524-1-rabenda.cn@gmail.com>
In-Reply-To: <20261120084335.3492524-1-rabenda.cn@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 09:51:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUrCkbjJW3Ld1nFbfj_Dfa4YwhUoK5g7rAn89yz=bYy4g@mail.gmail.com>
X-Gm-Features: Aa3M54r6LC9IQldUg86oiQcyOqnhN_8FdF1As7xILWU1aB_YhbizNGLY-xXfwEM
Message-ID: <CAMuHMdUrCkbjJW3Ld1nFbfj_Dfa4YwhUoK5g7rAn89yz=bYy4g@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Drop the ARM architecture dependency
To: Han Gao <rabenda.cn@gmail.com>
Cc: gaohan@iscas.ac.cn, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Michal Simek <michal.simek@amd.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_005157_437100_9963B572 
X-CRM114-Status: GOOD (  32.16  )
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

On Fri, 20 Nov 2026 at 09:43, Han Gao <rabenda.cn@gmail.com> wrote:
> On Fri, 20 Nov 2026 09:26:47 +0100 Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, 6 Nov 2026 at 20:40, Han Gao via B4 Relay
> > <devnull+gaohan.iscas.ac.cn@kernel.org> wrote:
> > > From: Han Gao <gaohan@iscas.ac.cn>
> > >
> > > The SCMI core and the mailbox and shared memory transports only use
> > > generic kernel interfaces. Transports that need architecture support,
> > > such as SMC, already carry their own dependencies.
> > >
> > > Drop the ARM and ARM64 dependency so that other architectures can use
> > > SCMI. Depend on HAS_IOMEM instead, for devm_ioremap().
> > >
> > > Suggested-by: Michal Simek <michal.simek@amd.com>
> > > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> >
> > Thanks for your patch, which is now commit fe87ede443a15969 ("firmware:
> > arm: scmi: Drop the ARM architecture dependency") in scmi/for-linux-next.
> >
> > > ---
> > > This was patch 1 of the Zhihe A210 SoC series [1]. As Michal asked, it
> > > now goes on its own through the SCMI tree.
> > >
> > > Since [1], it depends on HAS_IOMEM: Sashiko found that UML, which has
> > > no HAS_IOMEM, failed to link devm_ioremap().
> > >
> > > Build tested on x86_64 without OF, i386, loongarch64, ppc64le, riscv64
> > > and arm64. On UML, SCMI can no longer be selected.
> > >
> > > [1] https://patch.msgid.link/20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn
> >
> > > --- a/drivers/firmware/arm_scmi/Kconfig
> > > +++ b/drivers/firmware/arm_scmi/Kconfig
> > > @@ -3,7 +3,7 @@ menu "ARM System Control and Management Interface Protocol"
> > >
> > >  config ARM_SCMI_PROTOCOL
> > >         tristate "ARM System Control and Management Interface (SCMI) Message Protocol"
> > > -       depends on ARM || ARM64 || COMPILE_TEST
> > > +       depends on HAS_IOMEM || COMPILE_TEST
> >
> > Please extend the dependencies to RISCV (from the link above, I assume
> > you are targeting riscv?) instead.  There is no point in showing this
> > option on architectures that have no users of SCMI; one already has
> > too many relevant symbols to configure.
> > People who want to build test on x86_64 without OF, i386, loongarch64,
> > ppc64le, ... can just enable COMPILE_TEST.
>
> Following Michal's suggestion[1], I'm dropping ARM/ARM64.
>
> [1] https://lore.kernel.org/all/3d38c4a5-1a12-4af1-ac2e-413a457ce4c5@amd.com/

Yes, I read that.

For reference, other firmware interfaces are also not exposed to the
whole world:

$ git grep -w ARCH_SUPPORTS_ACPI
arch/arm64/Kconfig:     select ARCH_SUPPORTS_ACPI
arch/loongarch/Kconfig: select ARCH_SUPPORTS_ACPI
arch/riscv/Kconfig:     select ARCH_SUPPORTS_ACPI if 64BIT
arch/x86/Kconfig:       select ARCH_SUPPORTS_ACPI
drivers/acpi/Kconfig:config ARCH_SUPPORTS_ACPI
drivers/acpi/Kconfig:   depends on ARCH_SUPPORTS_ACPI
$ git grep -w "config EFI"
arch/arm/Kconfig:config EFI
arch/arm64/Kconfig:config EFI
arch/loongarch/Kconfig:config EFI
arch/riscv/Kconfig:config EFI
arch/x86/Kconfig:config EFI

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

