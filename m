Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA154606A325
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 05:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IGElhyok;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=W9Tlh83l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y4IpnFVFMm5fXSXAtzV8xsgRv9+hQP6OGl0+r2a9VT0=; b=IGElhyokk/3ses47jrexSh63MA
	PIpXxv/Jj3TLoM8jqNEd+6Dg6r0tEdlJDjdQAfFqgR6ddFVIBt6Iubljgk7nvRNYgwd4NpF/agkBH
	mPuMM5ShtQxv5CUy6TdD8+gAYs8zS2XGl3EJsVstn1l5LEo53GV7YEIkhwGFCsNSucpnN4/205NIQ
	MNFK2HDVMtrBxaYjzRlZN24VWE9ryULUCj2bLb6fhIWRHuhhwKJivMa0N5nVB/MDBFRuPBYFeKDuy
	rksJD4ozDusfy/ihFnuz1/gzL/6q/UGAnnnbyUIvCNxJF7EcNUFOtsY9rfP/dwgOv76O8j4f17E0N
	sayaUh2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQeaL-00000002Yzl-1qRU;
	Tue, 10 Nov 2026 05:39:57 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQeaJ-00000002YzD-1a7y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 05:39:56 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3b12cb3c37bso846027a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 21:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794289194; x=1794893994; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y4IpnFVFMm5fXSXAtzV8xsgRv9+hQP6OGl0+r2a9VT0=;
        b=W9Tlh83lk+oiyGe4rNcnpeYo7/bR7zfsO8N+81WqrzrIJry6c1/ErDYt1CygjDynNn
         bISxef4x/SVZqzf2SN7AF2dgWPljpZ/zeg42s8Ob/p2KSh7EiRMAONzCTVhIapj4cPDY
         GVt6EG+YqUt5hPkdv4or5JO3CBxCd5e+hO6zg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289194; x=1794893994;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y4IpnFVFMm5fXSXAtzV8xsgRv9+hQP6OGl0+r2a9VT0=;
        b=EyjahXAt7F9/N7Jj7pkEB3BL6aDf0XZC/LmWGROCbkt8+eTfCvXbAc4XZrUdzjVd61
         iyhGGZGUVoo76qCVmamEFxG6ocEufv57gnfpy6tWHrXEldRZOKAp5QQtWjjHu0QTVmQL
         FjxM4h+Pbog2q2Tf85jg7ESUWBfhbhzY004uRyWm+jXK6T/UwZXkUI74vUvSpFiEJ+wv
         F9836oMVEdTchGHSicJC+cyw0GxYK+8SZeRgwTpFsBDLdJA6+iF4rpLyPJ2t1AbhDrW4
         fD0WbX0F+9DXpKqnjYdrsX2/eS66Wj4WD+QKBBFSmAKRXWow5Na3XmfYFfP0vlA6684O
         0/bQ==
X-Forwarded-Encrypted: i=1; AL+hErFyxT7E8WuA1zjyEQ/fYGgQvXKH8U8QVcMTm4qfodmPc5IwPCgYGcLeKWJikuzv79f516WlLRBNNDMTCITAWo18@lists.infradead.org
X-Gm-Message-State: APuU4Z+cUbxe2r875ooV3UjdK4JvhnkS4LMvZonLTi/MwjL1iwxwbTa5
	G0j9mcDybHsRdG2zZOWVHfBGEe+tpcyJx3Oeldf0oMGAEXRc2P8JyzP8P1Svpi7Pxw==
X-Gm-Gg: AYBFou2DfrqKwZyK7VSiioixdv5+GAg8rIewiax7gt+1ZjuElC0u1/HPINdXZLtCcHY
	uauv19iyXIpezyjH7MTljKXD0mCiK5Yzt1QR456yeeT1pabIS1yYufLZrh7syQITGccq+vZoQCd
	MTNzNbOzmw+h020WElYKAjT+l8qatciR/8c6bpgF8XfVr3XoQIt7GgyXQQ+oM6wvqSdmrNe9EmI
	KJcTrQIREmWAoDZRW/HbOdDTHLEtQCEXJMJR80NVkS4MBz77iniF/m1Rk/yYgTMgKwfz/PGBlWd
	uFCWLANPcvqqm1tMdrhrSnDyy+I28Jt1UdNwro5wI7uILSYFUW63AvulbTqrH7BDLrGzRxvSf40
	dgNigBB77hTxqzMxq8lasSWNUqex0rkDomTibjtKyzQaZ8GAGgab4FBgQeQ/c7oEqHWbIjptqDp
	Lay14TyOHR4birMRnNoIcL63oR8/8tN6D5bRDUHruR/hrXJGzyaynrxXx2ta24Swab1mQiUmHDr
	IEUj5N/KGMySu4fL8h6gyMsh4EKSX9LQc/thYgjnf3cDhppcflGyLpoHcMuaxZjPX9w0Gsz/cMs
	jqeMFoQV7YEz45rqvGo0gEYXKzWHllcDYPr3dssGQlJABSDP2KHoZnwpTVkoZqzXhO0qI2IJnAG
	kM6kvZGehjKCArmo=
X-Received: by 2002:a17:90b:380f:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3b166d02addmr1882552a91.34.1794289194303;
        Mon, 09 Nov 2026 21:39:54 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:e137:9384:7cd8:6e40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b168ff86e7sm1041404a91.2.2026.11.09.21.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:39:53 -0800 (PST)
Date: Tue, 10 Nov 2026 14:39:43 +0900
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
Subject: Re: [PATCH v2 13/15] lib/lz4: switch the decompressor to the
 vendored sources
Message-ID: <avKtyCOOmK3AH0xy@google.com>
References: <20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
 <CGME20261106144310eucas1p1d60fe5c2e0170c49f38a3142bb1d8f94@eucas1p1.samsung.com>
 <20261106-lz4-vendor-upstream-v2-13-ee04c3f0d7dc@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-lz4-vendor-upstream-v2-13-ee04c3f0d7dc@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_213955_438991_B12FE2B0 
X-CRM114-Status: GOOD (  14.17  )
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
> index 50265e3ce256490994cb6dae32a45da376e408e0..b9b8a5f678c155442fa3fd2c1984e45182e6fc38 100644
> --- a/drivers/block/zram/backend_lz4.c
> +++ b/drivers/block/zram/backend_lz4.c
> @@ -84,7 +84,7 @@ static int lz4_create(struct zcomp_params *params, struct zcomp_ctx *ctx)
>  		if (!zctx->mem)
>  			goto error;
>  	} else {
> -		zctx->dstrm = kzalloc_obj(*zctx->dstrm);
> +		zctx->dstrm = kzalloc(LZ4_MEM_DECOMPRESS, GFP_KERNEL);
>  		if (!zctx->dstrm)
>  			goto error;
>  
> diff --git a/drivers/block/zram/backend_lz4hc.c b/drivers/block/zram/backend_lz4hc.c
> index e7ee3740219852f079d1e0866da6b213a3f3a583..1e09c93016264259c149e2913b2819571b56fab6 100644
> --- a/drivers/block/zram/backend_lz4hc.c
> +++ b/drivers/block/zram/backend_lz4hc.c
> @@ -65,7 +65,7 @@ static int lz4hc_create(struct zcomp_params *params, struct zcomp_ctx *ctx)
>  		if (!zctx->mem)
>  			goto error;
>  	} else {
> -		zctx->dstrm = kzalloc_obj(*zctx->dstrm);
> +		zctx->dstrm = kzalloc(LZ4_MEM_DECOMPRESS, GFP_KERNEL);
>  		if (!zctx->dstrm)
>  			goto error;

Ditto, outdated zram code.

My ask would be to not squash zram changes with lz4 changes, when (iff)
possible.

