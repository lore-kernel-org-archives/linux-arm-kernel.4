Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9470606A880
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 11:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LjK4UNwu;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=AvhYjNqW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ipHsKGzdySUFK43kUSa1EUse/xjwdqGzCAkyYU+4IsQ=; b=LjK4UNwufTLNP2
	Gmn+HqNH7RCSV5UxS90FQ7LZZXq+zVf9sDAUF6u0Kksmkvf8kQQrSW3KLpoyY/FBudlunO2jTGWKB
	qmc/hlEV1Yyp6Wzt8gDOo/MhmThF8+FHs22I3JcoVENdADa5QKlnQGrHsBQ7cokrViLl91P5M5kTo
	hw6CsFT0GoFDILyzzjzckEP8+ubEf/3YQsjrCFs6uGuYq5pYgO+3VWCCOxx18wCbSzyns31felW4Y
	9SZfHSG+MQwrPTbgMJg9+pbr6NowI3OIt1RQ7U2b/z39QYHOuGdlLG8enw2cWaLUtrGmf6rNx6NAY
	YDj3Noj+F+6ovRyMDPOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSwC-00000009gb0-3KPI;
	Thu, 12 Nov 2026 11:25:52 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRSw7-00000009gYE-0WsZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 11:25:50 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261112112543euoutp010f016eb7fa47ed13835ab3afff799d5d~nSIxA7B940644806448euoutp01J;
	Thu, 12 Nov 2026 11:25:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261112112543euoutp010f016eb7fa47ed13835ab3afff799d5d~nSIxA7B940644806448euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794482743;
	bh=ipHsKGzdySUFK43kUSa1EUse/xjwdqGzCAkyYU+4IsQ=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=AvhYjNqWqGDSDWciDHfOXU3HOJjD8I0PqyiBFvEino+CXJ/Ts8YCaLP0CTP7r83SV
	 D0u2NoLv9bExEfdz3CuNTS48kAhibm5QmC2eYY3NRLEJ1vo1+7ksYjGgKf8B93b7Ln
	 eIdw+0vhCIWca8FGDq/+owQFBplfxnoB2Ht47E5M=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261112112543eucas1p2f3aa7565474df56edb967cbecfd1858d~nSIwwzSqJ0570005700eucas1p2G;
	Thu, 12 Nov 2026 11:25:43 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261112112540eusmtip2793b80df566384250842db8b2aa8054b~nSIuZrphA1705017050eusmtip2o;
	Thu, 12 Nov 2026 11:25:40 +0000 (GMT)
Message-ID: <feca1837-fb17-4d96-b6d9-7e5d413ef222@samsung.com>
Date: Thu, 12 Nov 2026 12:25:40 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/15] lib/lz4: stop forking upstream LZ4, vendor it
 instead
To: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
	<ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt
	<justinstitt@google.com>, Russell King <linux@armlinux.org.uk>, Thomas
	Bogendoerfer <tsbogend@alpha.franken.de>, "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, Heiko
	Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
	Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
	<borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
	Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Minchan Kim <minchan@kernel.org>, Sergey
	Senozhatsky <senozhatsky@chromium.org>, Jens Axboe <axboe@kernel.dk>, Andrew
	Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-block@vger.kernel.org, Yann Collet <yann.collet.73@gmail.com>, Nick
	Terrell <terrelln@meta.com>, Gao Xiang <xiang@kernel.org>, Chao Yu
	<chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>, Eric Biggers
	<ebiggers@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, David
	Laight <david.laight.linux@gmail.com>, Sungguk <sungguk.na@samsung.com>,
	Jaehoon Chung <jh80.chung@samsung.com>, Marek Szyprowski
	<m.szyprowski@samsung.com>, linux-erofs@lists.ozlabs.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261112112543eucas1p2f3aa7565474df56edb967cbecfd1858d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261106144247eucas1p15bdd0704f32d1cb3b19f9d2296a0cbc3
X-EPHeader: CA
X-CMS-RootMailID: 20261106144247eucas1p15bdd0704f32d1cb3b19f9d2296a0cbc3
References: <CGME20261106144247eucas1p15bdd0704f32d1cb3b19f9d2296a0cbc3@eucas1p1.samsung.com>
	<20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_032547_811864_4626D87D 
X-CRM114-Status: GOOD (  10.97  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi everyone,

On 11/6/26 15:42, Michal Wilczynski wrote:
> 
> The import is the v1.10.0 release tag.

It appears v1.11.0, followed by v1.11.1 were released in the
meantime. The next revision of this patchset will import from the
v1.11.1 release tag to take advantage of the newest code. It already
contains the backported commits so I will drop the backports.

I will redo all the measurements with the newr version for the v3.

> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

