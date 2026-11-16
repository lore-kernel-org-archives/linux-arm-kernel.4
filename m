Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C311606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 05:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mfRL1g+k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zIG1Zp6FGJRrEDh0pN+mqn8C1jWGbL1fAfu3HFYFjzY=; b=mfRL1g+ke2/DEMYLTADxRxocja
	I2mOGBjw0YLVHvkDO52j89z5aKZEbT+/Zax/ZmZhj72g/54k4qjupyeCWXRDzbSV8m/JljSm2PM9f
	+7XY+VTyQSZa6569ieEQX3g1J9UWFZjex94knYCmU/f2cvbp6hPpZROjmbWflmVBXIEKlcIoq/W1W
	qXnyGekFgrB38a1G8X/H7iu9i2kCjLlGO2POHIcLrJ3OC2sScj/TuhPr8aYBzRlrJN+OYfPlWpcTV
	YNk2ZkKdVZ6TEkEefg+D9zSrmo5TOmbEbwkNp5QogXUosoDen2v605v642SpYWJqm9I844nBN9dDy
	Xu0jVvYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSp4O-000000019uF-0Sa9;
	Mon, 16 Nov 2026 05:15:56 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSp4J-000000019tq-0O49
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 05:15:54 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Mon, 16 Nov
 2026 13:15:41 +0800
Received: from aspeed-fw03.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Mon, 16 Nov 2026 13:15:41 +0800
From: Cooper Huang <cooper_huang@aspeedtech.com>
To: <andrew@codeconstruct.com.au>
CC: <billy_tsai@aspeedtech.com>, <chin-ting_kuo@aspeedtech.com>,
	<conor+dt@kernel.org>, <cooper_huang@aspeedtech.com>,
	<devicetree@vger.kernel.org>, <joel@jms.id.au>, <krzk+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <robh@kernel.org>,
	<ryan_chen@aspeedtech.com>, <vince_chang@aspeedtech.com>
Subject: Re: [PATCH] arm64: dts: aspeed: Enlarge AST2700 EVB kernel partition to 12 MiB
Date: Mon, 16 Nov 2026 13:15:41 +0800
Message-ID: <20261116051541.3503805-1-cooper_huang@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <bc6e605a8c5bee59ad9bcbce5f4fe775c9c3324e.camel@codeconstruct.com.au>
References: <bc6e605a8c5bee59ad9bcbce5f4fe775c9c3324e.camel@codeconstruct.com.au>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_211551_168122_C0D2824A 
X-CRM114-Status: GOOD (  33.05  )
X-Spam-Score: 0.6 (/)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andrew,

Thanks for the review. I've gone back and measured things more
carefully; details inline.

On Tue, 2026-11-03 at 14:48 +1030, Andrew Jeffery wrote:
> On Thu, 2026-10-29 at 15:25 +0800, Cooper Huang wrote:
> > The 128 MiB flash layout of the AST2700 EVB reserves 9 MiB for the
> > kernel FIT image. A FIT image containing an LZMA-compressed kernel,
> > the DTB and an initramfs is already close to that size, leaving little
> > room for the kernel to grow.
> >
> > Grow the kernel partition to 12 MiB and take the 3 MiB from rofs,
>
> Why 12MiB? Why only take 3MiB?

We chose 12MiB to give roughly 3MiB of headroom over the current FIT
while keeping u-boot, u-boot-env and rwfs (and so the persistent data
in rwfs) where they are. It's an engineering margin rather than a
derived figure, and there's no single correct size here, but the
measurements below suggest it's a reasonable choice.

The space comes from rofs because that's where the slack is: the EVB
rofs image is about 38.4MiB, well within the 79.875MiB that remains.

The LZMA-compressed kernel built with aspeed_g7_defconfig grew by
65-72KiB from v7.2 to v7.3, and by 78-89KiB from v7.3 to c339f4010dea,
depending on the compiler. With a 12MiB partition the FIT still has
2.93MiB free in the worst case measured (05441d697f7f with GCC 14.2),
providing headroom for future kernel growth and additional AST2700
drivers.

We're open to a different size if you'd prefer one.

> > which now starts at 0x1020000 and shrinks from 82.875 MiB to
> > 79.875 MiB. rofs still ends at 0x6000000, so the u-boot, u-boot-env
> > and rwfs partitions are unchanged.
> >
> > This is the same layout used by the OpenBMC images ASPEED provides
> > for the EVB [1],
> >
>
> Why was what was sent upstream different to what you were doing
> elsewhere in the software stack? It seems oddly incoherent.

It wasn't different at the time. The 9MiB layout from commit
e77bb5dc5759 ("arm64: dts: aspeed: Add initial AST27xx SoC device
tree"), which was posted and applied on 2026-06-09 for v7.2, matched
what the SDK was using then. The SDK only moved to 12MiB later, on
2026-08-24 [3], and this patch is meant to bring upstream back in line
with it. I should have explained that in the commit message rather
than making it look as though upstream had diverged.

> > Notes:
> > - "Already close to that size": with mainline at c339f4010dea
> >   (v7.3-17997), ASPEED's aspeed_g7_defconfig [2] and GCC 13.2, a FIT
>
> A bit of a tangent, but GCC 13.2 is over 3 years old at this point.
> Debian stable ships 14.2. Why such an old compiler?

No particular reason; it's just the cross toolchain in my local build
environment. I've now also measured with the kernel.org crosstool
builds of GCC 14.2, 15.3 and 16.2. The older compiler doesn't change
the conclusion. If anything GCC 14.2 makes it worse: its compressed
kernel is about 1% larger than GCC 13.2's, and with it the FIT no
longer fits in 9MiB at c339f4010dea.

  Free space left in a 9MiB partition, in KiB (negative: doesn't fit)

                  GCC 13.2  GCC 14.2  GCC 15.3  GCC 16.2
  v7.2               165.4      98.0     167.1     153.9
  v7.3               100.7      29.2      96.1      81.9
  c339f4010dea        16.8     -59.8      16.5       4.1
  05441d697f7f         8.5     -69.1      10.8      -3.0

05441d697f7f is mainline master as of 2026-11-03.

> >   image with the LZMA-compressed kernel, ast2700-evb.dtb and the
> >   OpenBMC phosphor initramfs is about 8.99 MiB, less than 20 KiB
>
> What are your measured sizes for the kernel vs the initramfs?

At c339f4010dea, in bytes:

  GCC    Image.lzma     DTB  initramfs        FIT
  13.2    7,930,161  36,758  1,451,420  9,420,020
  14.2    8,008,518  36,758  1,451,420  9,498,376
  15.3    7,930,429  36,758  1,451,420  9,420,288
  16.2    7,943,155  36,758  1,451,420  9,433,012

The kernel is about 84% of the FIT, the initramfs about 15% and the
DTB 0.4%. Every commit/compiler combination in the table above has
the same split (83.9-84.3% kernel).

All builds used aspeed_g7_defconfig from [2] plus olddefconfig, then
"make Image.lzma aspeed/ast2700-evb.dtb". Each FIT was packed with
mkimage using the same initramfs from our OpenBMC SDK build. With
KBUILD_BUILD_TIMESTAMP/USER/HOST fixed, two builds of the same commit
in different directories differ by only ~400 bytes compressed (the
only differences are the kernel and vDSO build IDs, which change with
the build directory), so the "few KiB between builds" in my notes was
overstated.

A caveat on the config: aspeed_g7_defconfig targets our SDK kernel.
On these mainline commits 344 of its 394 config entries apply. The
rest are mostly drivers that aren't upstream yet (eSPI, MCTP, LTPI,
JTAG and so on), plus FTGMAC100, which doesn't support arm64 upstream
yet. With the same config and compiler, the compressed kernel built
from our SDK tree (based on v6.18) is 357KiB larger than mainline
v6.18, and that gap includes the SDK's other changes as well as those
drivers. The mainline measurements therefore do not yet include all
the functionality enabled in our SDK, and additional upstream driver
support may increase the image size.

> Is the initramfs content reasonable?

Mostly, though there is some room to trim. It's the
obmc-phosphor-initramfs from our OpenBMC SDK build: 254 entries,
4.4MiB uncompressed and 1.38MiB xz-compressed. It contains busybox,
util-linux flock, the init/update/shutdown scripts and glibc 2.43,
which is the bulk of it at about 3.5MiB uncompressed.

busybox and flock only link directly against libc, libm and ld-linux,
but the whole glibc package is installed, including libmvec, libnsl,
libnss_compat, libresolv, libBrokenLocale and the compatibility stubs
(libdl, libpthread, librt, libutil, libanl, libnss_files, libnss_dns).
Based on that dependency check alone, dropping them would save about
160KiB compressed. I haven't yet verified that the boot and update
paths still work without them.

Even if all of it can go, that's a one-off saving of about 160KiB. In
the worst case above (05441d697f7f with GCC 14.2), the FIT would then
have only about 90KiB left in 9MiB. The FIT is dominated by the
kernel, whose compressed size grew by 65-72KiB from v7.2 to v7.3 and
by 78-89KiB from v7.3 to c339f4010dea.

If this sounds reasonable, I'll send a v2 with the rationale and
representative numbers in the commit message, and with the SDK
history described correctly.

[1] https://github.com/AspeedTech-BMC/openbmc/blob/438e761ed38644b77ba704c984cb607649bf2724/meta-aspeed-sdk/meta-ast2700-sdk/conf/machine/ast2700-default.conf
[2] https://github.com/AspeedTech-BMC/linux/blob/76457d3afe2bd4022ca82dd9eb8fc48b84f0e9ab/arch/arm64/configs/aspeed_g7_defconfig
[3] https://github.com/AspeedTech-BMC/openbmc/commit/f6671e0eb6a2c542bf3162df7c69906df7b301b7

Thanks,
Cooper

