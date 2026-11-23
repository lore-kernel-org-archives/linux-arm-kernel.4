Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0039606A680
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 23:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kDFrR9tN;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20260707.gappssmtp.com header.i=@dabbelt-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aDj9Ek/3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Unsubscribe-Post:
	List-Owner; bh=yJZxE8UsaiowVdwt1YcdicPZ3NQW6lymxuwD7Hxpfzg=; b=kDFrR9tN8HlMiJ
	uWhJTO6dATcijvtp6+X1QdkfsRvqbYM5hCrCw86X1P3ZuDNs17YQEC0O02v4tUMRxMT9tAtbXfvTm
	jn3a0G5u/pUVZ2wBW7JJIB0tNR9iX6S1YoQrqHqD2hgQEEu+l38uDWxctI6k5lBc/UPEW1n6HAycN
	Fv6q+mIzdekYRknL5DyNdN2X3blD1/XJtMglmRdAIRejX2vFF/VSD37bgTZH7FyxrQ8rt12fN6Do+
	gcRz7BwCSo1pBdowuDgDQy9m2CuWhwje9CYdhK4Dim6njfX17HeyBB880xIk3WCEAxBedsWLMOHh/
	/0269o4EPE95UQ2Ew64A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdAl-0000000587J-40Id;
	Mon, 23 Nov 2026 23:10:08 +0000
Received: from mail-dl1-x1229.google.com ([2607:f8b0:4864:20::1229])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdAi-0000000585C-2yH3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 23:10:06 +0000
Received: by mail-dl1-x1229.google.com with SMTP id a92af1059eb24-1ae58d17cd9so3731938c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 15:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20260707.gappssmtp.com; s=20260707; t=1795475403; x=1796080203; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yJZxE8UsaiowVdwt1YcdicPZ3NQW6lymxuwD7Hxpfzg=;
        b=aDj9Ek/3udp56j6OYz6lZpfdAYg6Uc2/zxei8xHyYFiWLeUX43dmNn+rzDObm0qyNe
         kuKZ0rytRbA9KreXX78WlemFTTfUvmDrnyBIubU8fz5MatB4iGn82Eh3aV9pIGs3VlzF
         pZkS2ZLggjWwF8DwzyDsjBAa+5VrskIvewSs0b06xgBEd3jT/fKzPYf3S9mcItiU6ImB
         KEAU9GRBY/rHGNdH8nDMs2cpy+AipjO7NvU/r3+JxiU/nvWcHiVqF4y2ew3ludbBbvt6
         qnX0dhS/XpGeQY8Kw1R9GMAJH5cx6vld46V/o/CHYT5UnV3F6uQAV1pX2MZSs/nMUnWN
         ZaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475403; x=1796080203;
        h=content-transfer-encoding:content-type:mime-version:message-id:to
         :from:cc:in-reply-to:subject:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yJZxE8UsaiowVdwt1YcdicPZ3NQW6lymxuwD7Hxpfzg=;
        b=w4faS06Nc21NBJ63L03yIcGnYXMvbCHRJmGlNudjdX1U2erXKKLXVGEOQvNaeMXucn
         ygkk+slLxjZa7JQETHKBgI9TtACiZKotqXMQBxfysi//AQ364tZamPPI8u7pcXKTkD1+
         NCHNI3CicREWWC5qKmR9dl6CqpH6FeP3/GpnxRX1ZY6Ye8nuyS+elnM6vtlm9Rt7zHLl
         f+O2HRWg4sVraim87uI/A7eVBClzONcuY8n8GYAxJWIsT3STkl3WeOyWJB+Pc69tlUez
         SplwaqVsbY+VOx2V8aleUPxz9cKXyu//yxrmZEP49YKAlZmpejDT4KaPomEHo5O+hp5H
         DD/Q==
X-Forwarded-Encrypted: i=1; AL+hErF+pevc+G3OJVR3RnDixUuoqBcoJ4P+atRovtCdsts3OxS4gCLFciVzQh+IeWR15eX+odGXGVNahgFvBK95GB9t@lists.infradead.org
X-Gm-Message-State: APuU4Z/KcZ3aSoV7tb9yq/eabjPdINeg8z6Ndh9Kgx/jHG4v8LVTNKzd
	HDe5x7Hw1idYhdK62Ao37dZOnNtCmRJ7Emzsty7XrjgxMxonZLL1R0wKXp8PwxXjIGgpTsRRNrR
	1HPHvAsk=
X-Gm-Gg: AZFdTZfbdAtshdnMj0xNyxGlBq9FdSHc8oXWkHHWdHLGTH21+BKWiGsThVOkAaUwb1v
	gnh2pL2FRyv+ToT5A6yUrcuGr8wzOcenvUhZV1Vac6lCq31bOd8hic0oKFYdYusOho2wpv8/e7P
	eOcKod9yJ5Zyc2VGyibIQ9uLqWI39I8sRWwiUodmAisuXgf/GK0HTLiJn/qQeKNdXuN/brtWbSi
	AvGa0TL2ssCsVj1z7MvhPPIpV0PSOkzJJ9wgn2lieEn7cAoSx/nqwyj1WOAvRJkckXiMu5TbHDO
	JxJAZJj8WVb4l9x5S+PBf+88p8+rO/HtS7I0cAs2IbxDSKakH/cKjNnDwkm0jEGtRLlMIhgPbUr
	yHshyvWT5NqE4/xRvvTUp+2JNBIt/MjPbpwmvDgeWGkHtVJI4Gjd9rr7Az6qc7w2SYqJLJlYqnt
	rxLb+UbZN0gv7WGRwx2zZJuC2fqLCMkWXW6BPJGONU+ffX6J8IspWmf4FuA1f7tbd5QM4ThMfn7
	dmKbqaRMWTi612YX/x9ikjkPeBfwKsitqpnHNSYhAtG5Vw97Blvl+wSMGXazofS8NUGXuoFtTxo
	ntJQTeam6T7kmfpeSXVxfYfUT8FiZRkFIRcBqcJbwPMw04hUjgutraZ6p11K9RQNBGlOO9cuxGA
	hcPFcZdAq0OtmtSrNwRTjzUX4cgs=
X-Received: by 2002:a05:7022:e0d:b0:1b5:b04:139 with SMTP id a92af1059eb24-1b55668c573mr18309442c88.0.1795475403196;
        Mon, 23 Nov 2026 15:10:03 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm30075627c88.15.2026.11.23.15.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:10:02 -0800 (PST)
Date: Mon, 23 Nov 2026 15:10:02 -0800 (PST)
X-Google-Original-Date: Mon, 23 Nov 2026 15:09:00 PST (-0800)
Subject: Re: [PATCH v4 02/19] riscv: Use _stext not _text to denote the start of kernel code
In-Reply-To: <20261118182105.1633603-23-ardb+git@google.com>
CC: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
  Ard Biesheuvel <ardb@kernel.org>, jgg@nvidia.com, pjw@kernel.org, aou@eecs.berkeley.edu, chenhuacai@kernel.org,
  loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ardb+git@google.com
Message-ID: <mhng-EF917BD5-807B-4931-A0E1-AE1732E69C0C@Palmers-Mini.rwc.dabbelt.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_151004_809361_1035F756 
X-CRM114-Status: GOOD (  26.43  )
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

On Wed, 18 Nov 2026 10:21:08 PST (-0800), ardb+git@google.com wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> On RISC-V, _text and _stext currently refer to the same location, i.e.,
> the start of the .text output section, which follows the image header
> (.head.text) emitted by HEAD_TEXT_SECTION. _start is the symbol that
> refers to the actual start of the image.
>
> On other architectures such as arm64, _text refers to the start of the
> image, and _stext to the start of the kernel code, and generic code
> (such as the EFI stub) may start relying on this distinction.
>
> So switch the only user of _text in arch/riscv, i.e., the "Kernel code"
> resource that is exposed via /proc/iomem (and from which the "Kernel
> image" resource inherits its start address), over to _stext. This is a
> no-op given that both symbols currently resolve to the same address, but
> it permits _text to be moved to the start of the image, making it an
> alias of _start.
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/riscv/kernel/setup.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index d79f99b86033..e6112d424fde 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -91,7 +91,7 @@ static int __init add_kernel_resources(void)
>  	 * child nodes.
>  	 */
>
> -	code_res.start = __pa_symbol(_text);
> +	code_res.start = __pa_symbol(_stext);
>  	code_res.end = __pa_symbol(_etext) - 1;
>  	code_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;

Reviewed-by: Palmer Dabbelt <palmer@dabbelt.com>
Acked-by: Palmer Dabbelt <palmer@dabbelt.com>

