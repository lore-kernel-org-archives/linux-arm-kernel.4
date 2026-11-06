Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51268606D802
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 17:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tE6NtK+z;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=b46Iw0Is
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=V/Ki9KYCk1/u/T9+TLPXVuBQHKR32la5lHVotRJ9M9s=; b=tE6NtK+zj2CeDdQpQl1Wo6ZLs+
	UIpwSp3c5d/b26Ngi+L3ii/4N4+VtBP1TL/CQxEM4OxD5ZZo1ax4bdqtK0PcFpvVxI8jL5AJaTC6l
	aO4x3vwOaX46YKu0PBHzU/G1d0kN/OfygPRYiZjCuCtyusTwYGtplEu5rSOaE+GIPuWXbdtazOVfj
	Rb6uvhO17ixbCtAdo5PLVSRN4uQ8ZXnGJeGxGKrc2fRd25yZroBp/VrUCrX+/6qAJBPfc4rimtT6E
	CyEOjrGhuF3zfIp2ZNSuVDGbScrnl4Gk1yoUaBQCWEmvrwcbWjxqAzhsRLjYgBY3jHi2yVDx7HB6x
	1PjLDWxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNu1-0000000DGDv-2eC2;
	Fri, 06 Nov 2026 17:39:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNtz-0000000DGCt-2Baj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 17:39:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37C51153B;
	Fri,  6 Nov 2026 09:38:55 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E311E3F632;
	Fri,  6 Nov 2026 09:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793986738; bh=Au11w2LcZqWcY7AEya/LgeSWkZUdT+Gf4txaRTnYGZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b46Iw0Iszy98SNd2Ysmjz5/eWk+qZHyrwWByFkmfYCpUNGC07OVTzMcnxF6B1tl5u
	 dZTZWdyX3pVaWzbzKvqFf9udxyzvhmX7DaqTMaxgvh4Yv2OTOSjVj8jg7gV6rC2rGe
	 vY5mjfipkuqKnqSBvbDhhZiwbQO82z5CZBo8whm8=
Date: Fri, 6 Nov 2026 17:38:53 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kiryl Shutsemau <kirill@shutemov.name>
Subject: Re: [PATCH v2 1/2] arm64: sdei: Run the event handler on the kernel
 vectors
Message-ID: <au4QrUV_l6QDeArN@arm.com>
References: <20261105120835.3321912-1-kirill@shutemov.name>
 <20261105120835.3321912-2-kirill@shutemov.name>
 <auzM-l40BLsT3clg@arm.com>
 <au2-GegBg8kRmBs0@thinkstation>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <au2-GegBg8kRmBs0@thinkstation>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_093859_603438_C11C69E0 
X-CRM114-Status: GOOD (  15.81  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Thomas Huth <thuth@redhat.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Usama Arif <usama.arif@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>, kernel-team@meta.com, Doug Anderson <dianders@chromium.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, linux-arm-kernel@lists.infradead.org, Breno Leitao <leitao@debian.org>, mrigendrachaubey <mrigendra.chaubey@gmail.com>, Will Deacon <will@kernel.org>, Linus Walleij <linusw@kernel.org>, Dawei Li <dawei.li@linux.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 11:48:00AM +0000, Kiryl Shutsemau wrote:
> On Thu, Nov 05, 2026 at 06:37:46PM +0000, Catalin Marinas wrote:
> > Worth a separate patch to fix SDEI handling with pseudo-NMI on and no
> > changes to __this_cpu_read() above needed. So, for this patch:
> > 
> > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> 
> Thanks!
> 
> Would it still make sense to switch to raw_cpu_read() in this patch for
> stable@? The splat is new with this patch, so without it stable trees
> would also need the PMR fix.
> 
> Let me know if you want a re-spin with raw_cpu_read().

No need to respin, I can fix it locally.

-- 
Catalin

