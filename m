Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439A2606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 05:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t3jTSqXj;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IGC5foYk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=upBQHvhIXS9jA4rn/T2U6OyiZNi8Uwc76Ij6dQGz7TA=; b=t3jTSqXj5aG+MIwS/PXjR1b6dL
	eSbul2Vpm4OSfkNOscxAfnOUl3JvJCGYc/w1zYSDr8x+e/WrZO7Bt5yCMIB2VmnNo9HLWYkbR36fd
	RylnpR/Mh5ue70ByzKe44bBd32LMqyv8MjyVXxW5tOpRW+flk+EMokrvFLdL5KsFVFgWX1HDigiEA
	OnmPiHK2Ewa13LHv7z1DTWr1akxJ3iTuMpz4jFoYLBSRaUe8sRhbfJowC+JjdGZlExdreb01o8fIZ
	u/vyuASrQ7yLMwF0DdAy4zR1EY1HiPiH8o6LLLYg6s5xz0PPHfu2/43sy8EwSOaq2b2EWJC0ZbjJq
	EAge0GsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQeXb-00000002Xlp-1w1m;
	Tue, 10 Nov 2026 05:37:07 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQeXV-00000002XeW-03s6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 05:37:02 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so760838b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 21:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794289019; x=1794893819; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=upBQHvhIXS9jA4rn/T2U6OyiZNi8Uwc76Ij6dQGz7TA=;
        b=IGC5foYk8XA6rjqV7LQBkk32zL7IbRs+m7ozIsBFrcsLftpRd5pQ3ssiNL4LI5VBp7
         eMH6HjaLmpXy8ff5VOb+fplSnPuUVyvMRTHKCBmM2O2EIKXyng5wWgnJ5YItTXq9H4oe
         T85apaXPXxhF/Cc2PM+94ufLCXa368Gak/NQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289019; x=1794893819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=upBQHvhIXS9jA4rn/T2U6OyiZNi8Uwc76Ij6dQGz7TA=;
        b=sRPJ6fY9516Au91Ct7WC+FBVptHyY7EVX17KbdcX2yoLQ/C11cifpoh402qdDUjVwN
         Xym8pwXMVGJRRuZ/2FemSbsVwEyeCpKkOkx/mVKYgCsJ34Zm2iO0cMNeSYdyZmyS/GRd
         FEqWgph15ARA4ASCx4IzGCp6lLyzto4lNxXg0JJf30rLq5do12M1u3HxRAJMlUyMLdKX
         O92sXkSbXIHnVbQ9bcpbaTRBTDHS4d+9J1wvKgQB5A0dkVV1ikmSQtjdHoAglzPIHNzv
         H+xBn2tz0dOVn/n5YtY/KQMkXPLxdVNmWKdbbyKOwxzfbXEQpvkY1ywlhnAvpRFHEwjl
         YZQQ==
X-Forwarded-Encrypted: i=1; AL+hErGHdgyIvI+JyH2EBBxoIReF8uwTgx9QLP7+uluwExYwpqFPJLVh/2ST7hgvUg8SisMa96RDGcnJalkKTCeaoeqd@lists.infradead.org
X-Gm-Message-State: APuU4Z/tsFC73+8PdjilZrDE3t5/xrDpZ8qvsoZxAYR2IfjONDtz7Dv0
	ayi1ov+acU9Fh3yaGV+ZIvQ1dL5o7UyGZ9XQmB87weFNdGsMtHq2AOosndpvpHFfwQ==
X-Gm-Gg: AYBFou1aTO1vUWb6b76ffOHGFh/kKZVxSPMBuJx4CHqinnOxgOf0MxkEstGn5c5jAHA
	juJ4KZay0+c9T5alyAVOWAfdkgkxMzLxHTsBU390KT63cHLDGA+dQQv4Pvtoliyy5UpdjUQozFH
	n704Wmp6aDxaRcGFGFzhs9VQFMQJ3sQzVE4/1/iqa1zn44bpO4syFWE7kIvyDWH7447hZNYwxrm
	4ibjDpxKRtoRGmml/giZzoFNkTbvXLX7ZEJylCvHVKzpT2nUNQD0W9e5vtB9GrxpSTzyyp1eRof
	UO5LcpIQ+fRnl7I++R5AOtmPBAeNXT757F+6jOpAPSQalxmEV7YnQfH73cU3ldLClxUBzPfrVdy
	G/TwNnWbJpXsXoPjlPH57CRuhr2DfutvRbTXBMlz48hk3kU2oA5knt5vWsot33zVjANDY0XTMB2
	RA3khHbMTcpgKfHX70cnZTLQOsATJW/GKI67titWlu9R7nq/bYvxPgKV3SJ3HwpsYc6jqkyZLeJ
	386dwPbW168MSU4afQ3f6dvjZR1RI3zPjV+AvcrtyHnlDAxfYDCNeDcv+KZdpNmd68fq/9g3vS9
	Z7sHXIyzeEoKXVhPhm7JFttvwjMPCIz4DgZ+ZecA2SV+oVF5qUa/zb6tHk5hXmQJwxM+yQ==
X-Received: by 2002:a05:6a00:1492:b0:89f:5c84:46ec with SMTP id d2e1a72fcca58-8ba89661da0mr1558178b3a.40.1794289019108;
        Mon, 09 Nov 2026 21:36:59 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:e137:9384:7cd8:6e40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab8dccc7sm405355b3a.52.2026.11.09.21.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:36:58 -0800 (PST)
Date: Tue, 10 Nov 2026 14:36:48 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Russell King <linux@armlinux.org.uk>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jens Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-block@vger.kernel.org, Yann Collet <yann.collet.73@gmail.com>, 
	Nick Terrell <terrelln@meta.com>, Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Eric Biggers <ebiggers@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Laight <david.laight.linux@gmail.com>, 
	Sungguk <sungguk.na@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-erofs@lists.ozlabs.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 10/15] lib/lz4: switch the compressor to the vendored
 sources
Message-ID: <avKs4_S7r6EiUVgC@google.com>
References: <20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
 <CGME20261106144305eucas1p17b3b27d403dc7d13b85cdd9a4bea83b9@eucas1p1.samsung.com>
 <20261106-lz4-vendor-upstream-v2-10-ee04c3f0d7dc@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-lz4-vendor-upstream-v2-10-ee04c3f0d7dc@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_213701_095349_6820D641 
X-CRM114-Status: GOOD (  15.82  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On (26/11/06 15:42), Michal Wilczynski wrote:
[..]
> diff --git a/drivers/block/zram/backend_lz4.c b/drivers/block/zram/backend_lz4.c
> index 1e4ad31d39a63f45b3bddd3d8a467d8d7d095beb..50265e3ce256490994cb6dae32a45da376e408e0 100644
> --- a/drivers/block/zram/backend_lz4.c
> +++ b/drivers/block/zram/backend_lz4.c
> @@ -42,7 +42,7 @@ static int lz4_setup_params(struct zcomp_params *params)
>  	if (!params->dict || !params->dict_sz)
>  		return 0;
>  
> -	dict_stream = kzalloc_obj(*dict_stream);
> +	dict_stream = kzalloc(LZ4_MEM_COMPRESS, GFP_KERNEL);
>  	if (!dict_stream)
>  		return -ENOMEM;
>  
> @@ -88,7 +88,7 @@ static int lz4_create(struct zcomp_params *params, struct zcomp_ctx *ctx)
>  		if (!zctx->dstrm)
>  			goto error;
>  
> -		zctx->cstrm = kzalloc_obj(*zctx->cstrm);
> +		zctx->cstrm = kzalloc(LZ4_MEM_COMPRESS, GFP_KERNEL);
>  		if (!zctx->cstrm)
>  			goto error;
>  	}
> @@ -112,7 +112,7 @@ static int lz4_compress(struct zcomp_params *params, struct zcomp_ctx *ctx,
>  					zctx->mem);
>  	} else {
>  		/* Cstrm needs to be reset */
> -		memcpy(zctx->cstrm, params->drv_data, sizeof(*zctx->cstrm));
> +		memcpy(zctx->cstrm, params->drv_data, LZ4_MEM_COMPRESS);
>  		ret = LZ4_compress_fast_continue(zctx->cstrm, req->src,
>  						 req->dst, req->src_len,
>  						 req->dst_len, params->level);

The zram code here is outdated, it has been reworked quite a bit
(patches are in linux-next and Andrew's trees).

