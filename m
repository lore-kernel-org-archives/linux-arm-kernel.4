Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EDE60A263B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 16:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Equ+/FSt;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z2HWyp/t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=h4XhdGstHHaoDKhn87VxtYdFBjOR/ijZJS15gJryUyk=; b=Equ+/FStWLdAotOe2/zZS18Ojq
	sKybwTKbeuCOQuE1zpcQTPtX7ren2eKiomRq0KZoYLAzE8LSTa4F74hHx+2oCd6alsWdrVxOfGXLd
	ZcjDiUACE13vGpu+jDzrTUjn0fSn1LpCktYA8lIEEuajNbYMlOVgUm1YjzS0fGrGba4iiFOAlCRub
	Uc/dkTi8GSMn2tx6h0MgIFhnwHBnhWKGnn6OZ0mY9zGndOo4G3ZaPQakN5h2kZGJkV0PcSbxX3uYz
	4wqFxph6E+uRo3goTd/98g+tgc12sykqTxlue/hEMAks4WX8c3LXEjtibXlvyGG0KXJjtnwMwn8wW
	VGVX4e1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXr4-0000000AeB2-2Jy2;
	Thu, 12 Nov 2026 16:40:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRXr0-0000000Ae8E-1O70;
	Thu, 12 Nov 2026 16:40:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D0DC4438F2;
	Thu, 12 Nov 2026 16:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 222B31F000C4;
	Thu, 12 Nov 2026 16:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794501649;
	bh=h4XhdGstHHaoDKhn87VxtYdFBjOR/ijZJS15gJryUyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z2HWyp/tJDDjjTHcJR3EqrO+Co3DWeMLJ1+cp2ynX2OINbp8WyivGS6bUYCElRnHv
	 j82yu2W0I6XbhRl6k1jGMrybLRN3rtsxa9jpBTx+ED6Lo2I2lVItYT5jq4zrZSGZzs
	 JXUgU8bmDotIuPcRgcQnRfdkmCpC0cle2atzG2wdTeGxjiblOhweVWrNK8sHl3qORz
	 AptP+WXgJYapp1q4qpa21NtXJZGJFCXXQTz9CI+U/mh2RSFbpUGKjXJrisLA5A/IyL
	 WRrvvgmWPTatgjPr4LX8gIKpHS1COMkia2Rnrxs+diTDADTj0jXe4+8KHHufORL2wP
	 EtFhzktL6OIhg==
Date: Thu, 12 Nov 2026 17:40:43 +0100
From: Christian Brauner <brauner@kernel.org>
To: linux-fsdevel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Breno Leitao <leitao@debian.org>, Chris Mason <mason@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, x86@kernel.org, kexec@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH RFC 0/4] crash_dump: recover from machine checks in
 copy_oldmem_page()
Message-ID: <20261112-singt-gewettert-rohkost-74009dcf3366@brauner>
References: <20261112-work-procfs-oldmem-v1-0-ecdcafd99265@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112-work-procfs-oldmem-v1-0-ecdcafd99265@kernel.org>
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

On Thu, Nov 12, 2026 at 05:37:06PM +0100, Christian Brauner wrote:
> A capture kernel reads the memory of the crashed kernel. That memory
> may have uncorrectable errors in it. Which is likely also what murdered
> the first kernel.
> 
> On x86 a machine check in the copy that /proc/vmcore does out of an old
> page panics the capture kernel. On book3s64 the read() comes up short
> and splice() panics. Breno has observed that on a fleet iiuc. The first
> kernel dies of a machine check and then there's no vmcore either.
> 
> I had the powerpc half of this as a fix in part 1 of the procfs series
> because Chris ran into it there. Breno pointed out that x86 has the same
> hole.
> 
> I think that likely makes this a kdump problem and not a procfs problem.
> So I moved this out together with the ioremap_cache() fix.

So I'm not super familiar with the machine check stuff. I know that
@Linus has some familiarity with this. So I guess a yay or nay would be
nice. Not sure if really a localized fix for the architectures that have
mc support makes more sense. A common helper seems less fragile to me.

