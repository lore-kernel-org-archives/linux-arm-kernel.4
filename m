Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60210606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 18:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f7MktCvE;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=pos13iHp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BrgRaYrX/RlgPy+GPq7MQFpr0fqcLrZ1d+Pm22+zM0Q=; b=f7MktCvEXLjaglkU+5H7WhLg5A
	o+apqv8+sXjLjwy4DGwGtVZnX7UjKBPo0Q3qnPtiZLjNskqJ7g8k//xiQKZxt9eXc0bMY1eJ0WXi0
	NJj9pQQ8sLwR7TSIgHnD4qgoQwhp56PeXQ1DkcID2LGbU9ECVdlENWweGSLRkP1dzAoN+ldwUqB5a
	07i4dL5rNIF3TYfjKKHJnuRh/zivvOhI1vtTo7khlwQn5E9/v9BY++mALKcq5y2KBMIhMgARtJZQ4
	MgHwpp8nPmnc5fT6jplVFTITU8Ra43ZuC/U+iN3ieKY4hptQ4pizIU48siH55Xf8doOQVaqo5zkt2
	dhUXCw6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOnH-0000000DPQN-1qYz;
	Fri, 06 Nov 2026 18:36:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOnF-0000000DPPY-0Iml
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 18:36:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C6B61650;
	Fri,  6 Nov 2026 10:36:00 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 844AD3F673;
	Fri,  6 Nov 2026 10:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793990163; bh=HS/iYnoDJ5zOgunxlgOe0o75m1+F+bzNPDULmR3Cnzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pos13iHpBNz7BxF+JBDu4325Y4XtfDsV4xAB0j5rLon6hdQdlL4eu0bskzBnwJmDA
	 7JQmN+KOApzEGWM4baaaNxLbgYrQDVrlwnaz4dHp+jKbp+wrat/DdLnLF2b93kX15A
	 ekZ0tvNkYEFiYyzuGM5WQHy68DprNLYmEKG3y/M4=
Date: Fri, 6 Nov 2026 18:35:57 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Kiryl Shutsemau <kirill@shutemov.name>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>,
	Usama Arif <usama.arif@linux.dev>,
	"Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	Breno Leitao <leitao@debian.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Huth <thuth@redhat.com>, Dawei Li <dawei.li@linux.dev>,
	mrigendrachaubey <mrigendra.chaubey@gmail.com>,
	kernel-team@meta.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: sdei: Run the event handler on the kernel
 vectors
Message-ID: <au4eDdjGkb9tn_T_@arm.com>
References: <20261105120835.3321912-1-kirill@shutemov.name>
 <20261105120835.3321912-2-kirill@shutemov.name>
 <1bae50ad-a65e-4ccb-b247-8d9544e4c5ee@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1bae50ad-a65e-4ccb-b247-8d9544e4c5ee@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_103605_336243_5CF6824C 
X-CRM114-Status: GOOD (  12.77  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ada,

On Fri, Nov 06, 2026 at 04:14:56PM +0000, Ada Couprie Diaz wrote:
> What are your thoughts ?
> I understand that this is a completely different approach, but I feel it
> would be more in line with what we already do for other entry paths.

I agree moving this closer to the normal entry path makes sense and the
PMR handling probably belongs there as well. However, I think there are
implications for VHE (the handler runs at EL2 with VBAR_EL2) and for an
event that interrupts a KVM world switch on the hyp vectors. I need to
dig some more into this.

In the meantime, I queued Kiryl's two patches, they're small enough for
stable. Any entry.S rework can come on top of them for future kernels.

Thanks.

-- 
Catalin

