Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A657606A331
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 23:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mQCJ4GzN;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20260707.gappssmtp.com header.i=@dabbelt-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=arngu888
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Unsubscribe-Post:
	List-Owner; bh=omPzYJsyHFXBTWaYCXRuHKP+shwbFJ7ykCdiwHLxPZA=; b=mQCJ4GzNPYfp5m
	gtbQZQjpFaTZM0otWRb3iUCV7Ctqrve69rIQvORDUS9ReEunsAxtyKvjYENt36HXPh7oSiP0hBifD
	h+tRLkjULlFv+dhcJcGgQOa0ig45sLl4j2yVeUx94ZMKBhVOMpaR7PWcfN5/yPV0XW7FFThsCpE+N
	12pbZWz5O9KAm6C1M8YfhChN4037RdGd6JOA9tspesW9wdY6r1ieKo+98CUwjGZ1Qa9cyhPMkFZYU
	53HkmYWw45dHKyaZmvu48e9QRtdnfXfl6a0fxB1st3VKAwwcRtwDlc7Zr35/C9B47cRjtnuXrfNsY
	MLQqPWwShJ7NMnXeeIUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdBH-000000058Mt-04Nb;
	Mon, 23 Nov 2026 23:10:39 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdAl-00000005872-2MzX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 23:10:12 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-380c28f9e35so5012868eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 15:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20260707.gappssmtp.com; s=20260707; t=1795475406; x=1796080206; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=omPzYJsyHFXBTWaYCXRuHKP+shwbFJ7ykCdiwHLxPZA=;
        b=arngu888qdy+blQO89/oXe4WPD+OECuLIbbJf9koMw403mI1DHW9QrjucLol8eWAxn
         tErgmj0BFS/COXRTRdfVm5+F9/nnDxUvxAyaS9UsgMTJAq2xLi4u/rJh6xpncejh6IsM
         7+296Sv7nzxjIdHhz0pA9pNLGAbtmpROG9k/aJRvo/vojW0/OsJr3781mX3jY9NM3iJ1
         4L4mP1FvKcp8BR0padGEcYqi5vhmA1H4Ibh/v2ryqm6x0s9mjxL4mu+2z81RsmtHRJxy
         mdzh09u2knoDngwPyDI9HWa0DCrCHzXo9jLhVZ8ubjQ2QZFg8hYLwcvzCheVevs2oRGq
         ITVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475406; x=1796080206;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=omPzYJsyHFXBTWaYCXRuHKP+shwbFJ7ykCdiwHLxPZA=;
        b=A1LC+7pad/vRxvm1AEPcib3aEZTrJE1B2qbz+SOz52YB6pYEvtkm7tGXYgf5H6uNhe
         OuQBu//7IWp6btZCNEpfFfLjgRRh+UPjE+eBUxzJESkJSPo79FepmKVqNW3TC8I4t7va
         V/AZXgQBynoQ66imZqvbdSjiWvVKFixSLGMpkHcUxamsKJCJJvVcbr4gfIVp1QHBHeaF
         gjz1O/91yyp4HChCg+mtAt0Tjj2yWZzQQ9xk3ga3Pq4G/BDVKDyean03kL51xnTWfGDd
         Pa2Jth7tGwNqQprEOMa7KvWXqsL1vWCQAFK+UAaUVJfD/a5sNzkwF9eRTzhntRyZHEGz
         caqg==
X-Forwarded-Encrypted: i=1; AL+hErFS/1Pc8HiLLHG2H9jwmCNT1SdGlHP9IwX/JS11TnBWIbh06nRlbiT5HSgZ+Ns/M5x3JiGctRY6kiF+XyLO7LFg@lists.infradead.org
X-Gm-Message-State: APuU4Z8mdGMdYEgclnwrbxfZtqf5kRP7RUUyss1v62WnezDrBk2cJfZR
	m6JYX7U8CbDoymHLHwsKQRwqnMyT7mPzhkwwKc1ALdfLQg9k7TqjXjaQ7jyNWkx2lO4=
X-Gm-Gg: AZFdTZfbtt/qPvlJMmNaYKzGGr5WxyXFbwR3PdIrCJneyQsaAxsQTCQ0mWZavYKID2M
	p8gnMve2DlFpAT2GBGky8B3VVoau7J1ZERx+zVGeqg3VYdByaQNV5XbtenfOZ4lW+R+eMYWaSib
	tWaSJUL+ixaxAzGiQgKuDS4UXlSEUd6rINr3Y7hhYfF40k9lz+FgBDi99zZGtGK7W1IAJuGm1G0
	BtJAhWE4TCqb24nxX9uPXamJP/onHXhLrmThSuNLfp25BOfKeK9JWkjlUW6LmUuHwxjgygCwQgm
	RS1AFa2zo3M/z+3lvij1qGR51W8Ibu/lzPvs8fcDTBtNFxijNBM9dfK1AWxaQlo5Omu31duGbYw
	1cTMmjyycSVL932+J4jTDMeV6r2QXY0r23w+GpwbpgBqh0mUDBFKwgXD6zSHlQI09v+JDbhQpyl
	sc+z938M5QqJEIsu17xzVCtCYtTf4hLBfWASF4ujS08Z2JA5EnpOsniwXW/2eTzUxWtFu42PN4A
	wOLvn/PRu54kJ3DDug5o8oyXrJqROFvfEPstFzB0Sb4QCGSx/zDHAaHBvqX4dRbpqcSbpr80V7E
	W5TUJFJTqFr8pklUfxOGjDIg3E6BH9aUlut4QGCWyCvjsc1UiPpNWe1+NUbWOFpxWV/wdqCbVCA
	0s/VlT5uzmZyVrOkWn8z89Pjsjx4=
X-Received: by 2002:a05:7022:4181:b0:14a:a6dc:9cbf with SMTP id a92af1059eb24-1b5568abf0bmr18844780c88.4.1795475406085;
        Mon, 23 Nov 2026 15:10:06 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm33422877c88.6.2026.11.23.15.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:10:05 -0800 (PST)
Date: Mon, 23 Nov 2026 15:10:05 -0800 (PST)
X-Google-Original-Date: Mon, 23 Nov 2026 15:09:50 PST (-0800)
Subject: Re: [PATCH v4 04/19] efi/riscv: Rename __init_text_end to __inittext_end like other archs
In-Reply-To: <20261118182105.1633603-25-ardb+git@google.com>
CC: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
  Ard Biesheuvel <ardb@kernel.org>, jgg@nvidia.com, pjw@kernel.org, aou@eecs.berkeley.edu, chenhuacai@kernel.org,
  loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ardb+git@google.com
Message-ID: <mhng-D54B7D56-AACE-456E-AF40-670E83DF8B47@Palmers-Mini.rwc.dabbelt.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_151008_410099_D4A3EAD9 
X-CRM114-Status: GOOD (  20.00  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 18 Nov 2026 10:21:10 PST (-0800), ardb+git@google.com wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Align RISC-V with arm64, LoongArch and x86, and drop the underscore
> between 'init' and 'text' in the section markers. This allows the value
> to be captured by generic EFI stub code that can be shared between all
> those architectures.
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/riscv/include/asm/sections.h         | 2 +-
>  arch/riscv/kernel/image-vars.h            | 2 +-
>  arch/riscv/kernel/vmlinux.lds.S           | 4 ++--
>  drivers/firmware/efi/libstub/riscv-stub.c | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/include/asm/sections.h b/arch/riscv/include/asm/sections.h
> index a393d5035c54..4a882a28f414 100644
> --- a/arch/riscv/include/asm/sections.h
> +++ b/arch/riscv/include/asm/sections.h
> @@ -11,7 +11,7 @@
>  extern char _start[];
>  extern char _start_kernel[];
>  extern char __init_data_begin[], __init_data_end[];
> -extern char __init_text_begin[], __init_text_end[];
> +extern char __inittext_begin[], __inittext_end[];
>  extern char __alt_start[], __alt_end[];
>  extern char __exittext_begin[], __exittext_end[];
>
> diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
> index 7b44b94f1283..bf703eba3fa5 100644
> --- a/arch/riscv/kernel/image-vars.h
> +++ b/arch/riscv/kernel/image-vars.h
> @@ -27,7 +27,7 @@ __efistub__start		= _start;
>  __efistub__start_kernel		= _start_kernel;
>  __efistub__end			= _end;
>  __efistub__edata		= _edata;
> -__efistub___init_text_end	= __init_text_end;
> +__efistub___inittext_end	= __inittext_end;
>  #if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
>  __efistub_sysfb_primary_display	= sysfb_primary_display;
>  #endif
> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> index 9849a3e4d102..0ec1b4b55e41 100644
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -46,7 +46,7 @@ SECTIONS
>
>  	. = ALIGN(SECTION_ALIGN);
>  	__init_begin = .;
> -	__init_text_begin = .;
> +	__inittext_begin = .;
>  	.init.text : AT(ADDR(.init.text) - LOAD_OFFSET) ALIGN(SECTION_ALIGN) { \
>  		_sinittext = .;						\
>  		INIT_TEXT						\
> @@ -72,12 +72,12 @@ SECTIONS
>  	}
>  	__exittext_end = .;
>
> -	__init_text_end = .;
>  	. = ALIGN(SECTION_ALIGN);
>  #ifdef CONFIG_EFI
>  	. = ALIGN(PECOFF_SECTION_ALIGNMENT);
>  	__pecoff_text_end = .;
>  #endif
> +	__inittext_end = .;
>  	/* Start of init data section */
>  	__init_data_begin = .;
>  	INIT_DATA_SECTION(16)
> diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
> index 725b634c5179..5cbc50a814e1 100644
> --- a/drivers/firmware/efi/libstub/riscv-stub.c
> +++ b/drivers/firmware/efi/libstub/riscv-stub.c
> @@ -34,7 +34,7 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
>  	efi_status_t status;
>
>  	kernel_size = _edata - _start;
> -	kernel_codesize = __init_text_end - _start;
> +	kernel_codesize = __inittext_end - _start;
>  	kernel_memsize = kernel_size + (_end - _edata);
>  	*image_addr = (unsigned long)_start;
>  	*reserve_size = kernel_memsize;

Reviewed-by: Palmer Dabbelt <palmer@dabbelt.com>
Acked-by: Palmer Dabbelt <palmer@dabbelt.com>

