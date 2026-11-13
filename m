Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777B7606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 12:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zk8dUIeJ;
	dkim=temperror header.d=puresig.cz header.i=@puresig.cz header.a=rsa-sha256 header.s=dkim header.b=URzV+I8X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iFLB5hhb5axx2wBU+qQkAhbTinTqvnjS+ztS3y8CPfg=; b=Zk8dUIeJCh7lbA6y4qEhiZAbe4
	KHsvO5kATI6SE7Rb1av8bT+J+TkaDSS/hhzQToLVFpHTHeigr6IuE8GTYvHbYESi4nCSzp63D3Oxh
	G9EFWP3/i/VitA/2F2Se5l423vt+2tFM/py0kRnGa5hZZn6WeXSyHnXgiySbB4tCmPPScOC0ehlVj
	zauDg000H+t7cMviKECaihb00MidmaKwdhPehdImbQj/xGyxlT0YCgc9fx2JbJ1XZGXEniPYymIF6
	y54mlljiovaqnrROdouD2jzXlJTIcK0QtY/TKgrZ2Ntz2OT2vdVfQxyTLtAErAvGqKCrJvk5xpMLv
	CZiVmLMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqZ9-0000000ClMn-2HwZ;
	Fri, 13 Nov 2026 12:39:39 +0000
Received: from mail.serverx.eu ([93.185.108.244])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRqZ5-0000000ClL2-1PKp;
	Fri, 13 Nov 2026 12:39:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6225F13F4C;
	Fri, 13 Nov 2026 13:39:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=puresig.cz; s=dkim;
	t=1794573564; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=iFLB5hhb5axx2wBU+qQkAhbTinTqvnjS+ztS3y8CPfg=;
	b=URzV+I8XXZ1k2/AWVmF40lYdmbxpP3gFE3sauXwLMApIDUqmVqryqozTCbfOBL1Gzu28Wd
	QeDkTpQqI48j4a9LmUYLzgGGJ3Vt/WOb2DMpYTFG3oFoDPwPGy7cen1zGFtya33OYz32Pj
	8jcPgBx2AZDmk71xzK8sXTZ0+6znY7sBAyie309d8QVCg3/HQnHNNS76qeFa/SFqBRda9h
	oPAhiFyUfopZzPIKntM288C351gVqAHI7+8pwOn7BLW+/3PvnPshG+6hW6vLcJWS5WK6tm
	doDbWCcAVy26UU9Ei58AIhRkdCPFWJKSPu2QJ8eFYVC5AHtufor6Bpuo3RZleQ==
Date: Fri, 13 Nov 2026 13:39:20 +0100
From: Lukas Splavec <lukas.splavec@puresig.cz>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Heiko Stuebner <heiko@sntech.de>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Jonas Karlman <jonas@kwiboo.se>, Sven =?utf-8?Q?P=C3=BCschel?= <s.pueschel@pengutronix.de>, 
	kernel@collabora.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/5] media: rkvdec: Enable multi-core support
Message-ID: <avb5Bm7IA15N2ibR@Lukass-MacBook-Air.local>
References: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_043935_829162_D4FFC0EB 
X-CRM114-Status: GOOD (  12.90  )
X-Spam-Score: -1.7 (-)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Aug 10, 2026 at 11:22:10AM +0100, Detlev Casanova wrote:
> Since the driver is used for decoding on rk3588 and that the SoC has
> 2 identical decoding cores, enable support for it.

Hi Detlev,

I tested this series together with Sven's RGA3 multicore v1 on an RK3588
board (Giada D77, both vdec cores enabled), with 4 to 8 concurrent
GStreamer 1.28 pipelines (v4l2slh264dec / v4l2slh265dec, 1080p to 4K60,
H.264 and HEVC 8/10-bit).

Multicore works fine: both cores are used and throughput scales roughly
linearly up to 8 streams; 4x HEVC 4K60 runs at about 65% busy per core.

I encountered a problem on v7.1-rc1. I hit an rk_iommu page fault storm
followed by a decoder timeout and device freeze, when pipelines were
started and stopped in overlapping manner. I was able to replicate the
same behaviour without these and Sven's patches on plain v7.1-rc1, but
not on v7.0.

The cause seems to be the inverted error check in iommu_map_nosync() from
d6c65b0fd6 ("iommupt: Avoid rewalking during map"), already fixed by
6fc7e8a3 ("iommu: Fix loss of errno on map failure for classic ops") in
v7.1-rc4. With that fix applied on top of both series, 150 rounds of my
stress test pass with no faults. So it is not caused by this series, but
a rebase onto >= v7.1-rc4 would avoid confusing other testers.

The underlying map failure is likely a separate issue: the RCB SRAM
buffers are mapped at IOVA == kernel VA, which the dma-iommu allocator
does not know about, so capture buffers can collide with them. That is
present since v7.0 and independent of this series, so it is probably a
matter for a separate thread.

Tested-by: Lukas Splavec <lukas.splavec@puresig.cz>

Thanks,
Lukas

