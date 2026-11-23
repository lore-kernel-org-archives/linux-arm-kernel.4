Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3185C606A692
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 23:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G0IEnhQZ;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20260707.gappssmtp.com header.i=@dabbelt-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qSxG0q8P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Unsubscribe-Post:
	List-Owner; bh=1b1ocgQtSvefIuPciX0StsHzdHu/105xpXIeUHjXub4=; b=G0IEnhQZeGYlLU
	J3jcRz/JIRX/LuF2Va9NqJAFEZPHvWNO4ZfWvuRjhkdfFHlqHr1hOh/xmN1YrownYjN+M4ODKjCCs
	EPTGxKHqn6yVlRf7zUbNPc33Noj0nzUDT0QaVaaIPD6CI1PQUtlH/8051EbERyqalpSs5Zhrh2MnC
	+ZPM7dpKN/308rJuDsdaQ9vnHoIIlFr3/zVULP1HqimYavMfFTFjM76EzFYZoSyit5x6CKblnNjj2
	fu+KAcwRFuIiE0wFQjdZS0G+6Yu0k63CLaOuelIPuTbr4XKjGK0L6VTvftM5W7m6yhTAL7fZ8vcJD
	GLDAmkiB8KI6tw2MInfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdB0-000000058Ce-3QI9;
	Mon, 23 Nov 2026 23:10:22 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdAj-0000000585t-2ncW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 23:10:07 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-380c28f9e35so5012828eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 15:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20260707.gappssmtp.com; s=20260707; t=1795475405; x=1796080205; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1b1ocgQtSvefIuPciX0StsHzdHu/105xpXIeUHjXub4=;
        b=qSxG0q8POS1BcfMYY8WNylWaR4GJO62Qyk+lYQZH0leTriQDiKT8jXm+RHeRNcY2Hi
         LjOx+MQaw1yx9eEitz64IZc63S5IT0MDa4Tvr8C6cELpb+x5UdUNlKD80QqMLkG6Obc8
         /a/jrai0lBcNomtzZVfgt6/ibFv4UlBKfn24wKRL2kb5RR37N5Y0jQJJEMWnmRUnLwiO
         jTKVHyRwrTo9mROxwpQXMGq/10RqdC3lIP7V3+Db8J6q/lz0VadIxgOiv6ytIMO6XFG+
         Dcs1tQSYq/ySsh+UA9jAPrNN1hNDQXifKOK5hZ6pp5j2GP0L+o34j6I1ChkABR25IPA3
         acCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475405; x=1796080205;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1b1ocgQtSvefIuPciX0StsHzdHu/105xpXIeUHjXub4=;
        b=f1h0h5Eyw9CJtIpKTJTS6tsCnV7kT2svU7xaEj9TUHzzxNZrXdVctNUvikiJjAXQ0D
         o7cSgc5Q85Rhn+le+ZGZQnkwMCDjtCgFtKxsDFAyXnNK5ORTy4hK/Tl+xhuoXyo5Ez1Y
         /LU9I7k15JWgGZWKqNTWQbpdLgqQmfRT/DKvcCgd92l9z1Y6d6GuydpwTvpjNHD0kHDF
         VjgvgpMZpr0mT5X/BJiNgkBFAaXlQJIvWPG76vOF3cFxwybLJw2v7S4qLTlFTjeAOo0x
         JNKcNaJcZK82dsddLVfYlq+0nc1C8hTqif7/6VCCmQfwWGMLB7YeQlZ88Hyq29Al8Eir
         ZyRA==
X-Forwarded-Encrypted: i=1; AL+hErFMYhNjcZZDD0dUTqB9riZs2o5Nz8D+CCi3gAa9Cbh9LU/GGSWinPJXdjtvDf6gakk+/CySYjXYlNRuqhKCM+Ru@lists.infradead.org
X-Gm-Message-State: APuU4Z90TzxVZHBiUhQx24hOcBe6UEnulj0sskaiVfO6pVR0x6HF4Y4w
	doo9Hc+o9H3KihRdGq6+c2MQUChQLvgpXkMuRnphoNt/vIbA3NmFqyoydN+4nBeQSZ4=
X-Gm-Gg: AZFdTZfosVYjcIYZmlt5eefDiusabUJFtQS6XiTNogI7tlM0z8D9KzkMmq3XndV6bn4
	6PyC9JuAS+ESWo8BimbsrQJKwI9A7xwNEGfVjZ+E/2mUdwHNJBqsSW+1c4+zr6TnZfPVLBsOkTA
	Q701Sc6sJTVKfeEEPst7k+c8nfto8sPDNMCRphDlU8c+ycnN5f8/LKATLp1QpWlVOzhGa6xa7+y
	+Op1KgQHdF5+WmWTx7/tjDHAd2yJn+E6t8hJhrCy/f/ipr0f1HOiF7I945rtmE3UusqRdq/ObXz
	UNKjw67FyLHbdaXldUa/LYqPRhNY/Mcrz2cpnog0ii0xS4nmqe1mdQs0pWYAMSECT4Yg8FtGf/+
	tpKM3id+mgL4iehqnyKTHjHmGjm8FiFn1iVaY9YqCwBDpFrr/z8g+D2Mb9ilRtT6TVKawESU2vu
	d1b2e4/QN8jByq7LWgy2i6qeAUop8lDfWVJQHk/hWH5skuR7yooGpzDZYoUkOWsNwvnyDTm2e+m
	G5Tk2Udpxwj99Jsct4mDbgO9yPLrlwEi+IyYektHbGUJR5o1m3HujLVMi+Nk17RxkujSoFP6Kq0
	kjF8rGhPodeTa+O//JOlGJ0kiFf9wEFqIrqecQ0y6cENps7YnRN0aMSF1xrCrOdquQQjrXrOY6y
	FruG0A9c25qCy85p83/bU27j3YLw=
X-Received: by 2002:a05:7022:296:10b0:1b4:facd:5311 with SMTP id a92af1059eb24-1b5524972dbmr12954441c88.8.1795475404449;
        Mon, 23 Nov 2026 15:10:04 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm43512853c88.14.2026.11.23.15.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:10:04 -0800 (PST)
Date: Mon, 23 Nov 2026 15:10:04 -0800 (PST)
X-Google-Original-Date: Mon, 23 Nov 2026 15:09:28 PST (-0800)
Subject: Re: [PATCH v4 03/19] riscv: Make _text point to the start of the kernel image
In-Reply-To: <20261118182105.1633603-24-ardb+git@google.com>
CC: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
  Ard Biesheuvel <ardb@kernel.org>, jgg@nvidia.com, pjw@kernel.org, aou@eecs.berkeley.edu, chenhuacai@kernel.org,
  loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ardb+git@google.com
Message-ID: <mhng-FE6551A0-F38D-4B01-9727-CAB9CE10B667@Palmers-Mini.rwc.dabbelt.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_151005_712958_AB6C2945 
X-CRM114-Status: GOOD (  27.80  )
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

On Wed, 18 Nov 2026 10:21:09 PST (-0800), ardb+git@google.com wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> On RISC-V, _text currently refers to the start of the .text output
> section, which is placed after the image header (.head.text), and is
> therefore equal to _stext. On other architectures such as arm64, _text
> refers to the start of the image, and is used as such by generic code,
> e.g., to describe the kernel mapping in /proc/kcore and in the ELF
> headers of the vmcore, and by the EFI stub.
>
> Now that arch/riscv no longer uses _text to refer to the start of the
> kernel code, move it to the start of the image so that it is equal to
> _start, and the distinction between _text and _stext is the same as on
> other architectures.
>
> This also means that the image header is no longer omitted from the
> /proc/kcore and vmcore kernel text mappings. Other users of _text, such
> as kallsyms and ftrace, only use it as a reference point to calculate
> relative offsets, and are not affected by this change.
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/riscv/kernel/vmlinux.lds.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> index 1f4f8496941a..9849a3e4d102 100644
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -28,11 +28,11 @@ SECTIONS
>  	/* Beginning of code and text segment */
>  	. = LOAD_OFFSET;
>  	_start = .;
> +	_text = .;
>  	HEAD_TEXT_SECTION
>  	. = ALIGN(PAGE_SIZE);
>
>  	.text : {
> -		_text = .;
>  		_stext = .;
>  		TEXT_TEXT
>  		SCHED_TEXT

Reviewed-by: Palmer Dabbelt <palmer@dabbelt.com>
Acked-by: Palmer Dabbelt <palmer@dabbelt.com>

