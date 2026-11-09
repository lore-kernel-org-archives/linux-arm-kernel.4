Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C9C606A325
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 12:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XDvINi9K;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=uFt9q5Em
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7ehu9uwlN6f/BG1RO8PBmrITOSCd6PjFswkCZHpoDnw=; b=XDvINi9KLuZWMy
	PYwCS736dx1gRjvhF2YCPphPN/XmC6XzW/J/DVJyo+OYZL84xUj+mr0ALFW8qU11XFUMSwA1XW4x1
	YQvH1DFMcC/mLB9FSQCWsaHOSnRyV6iuGLizWF2HCaHICa1WgJKk0j2DlQ8bhhBqzaEUT8Paq2+ox
	/LAAppb5SG9HMEHR94JRX8H/GNpLQ+pot60aKgLUuDLbpGfmBwirxLbDqAGsqLc0f/ssfWDcun015
	gHYCDVbTJKfDs8drrK9/VKOZAyUr7jN1qDCHGhrOu0EjYgBiLp0euS+CpyegOPJEQDgv4Ilm8zte5
	ObrtMH2dkJ8wqLXGAhnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOcI-00000000iCV-2a6b;
	Mon, 09 Nov 2026 12:36:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOcG-00000000iBc-1ADI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 12:36:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 217B11476;
	Mon,  9 Nov 2026 04:36:46 -0800 (PST)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E073D3F632;
	Mon,  9 Nov 2026 04:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794227809; bh=UBP2ZQMotIV6KdGg51IlwlZyPK5SoCkTkNpFStNN7gk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uFt9q5EmP8uuPALMSgfayO0dNqoORyBCQdhiZe3CK0taECNUwQhxIWqLhzLTBPWgM
	 3jgBDN+oV0RLIwow4mH1pcauwWkxyN9pTumuGwFJQrHNgzFw2E3SNVtPux6ES3mZob
	 02X8lK7uRyzbzi2r9wT5O5j+O+467vIwcDH+vhds=
From: Leonardo Bras <leo.bras@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v4 0/3] Optimize S2 hugepage splitting, introduce skip-level flags
Date: Mon,  9 Nov 2026 12:36:41 +0000
Message-ID: <avG-WdfUaCalKdZU@LeoBrasDK>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <86y0b528zu.wl-maz@kernel.org>
References: <20261106161240.1345126-1-leo.bras@arm.com> <86y0b528zu.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_043652_360183_FCB67F14 
X-CRM114-Status: GOOD (  13.30  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 04:57:25PM +0000, Marc Zyngier wrote:
> On Fri, 06 Nov 2026 16:12:35 +0000,
> Leonardo Bras <leo.bras@arm.com> wrote:
> > 
> > 
> > While playing with dirty-bit tracking, I decided to take a look on how page
> > splitting works. Found out all entries are walked, even though we don't need
> > to walk the level-3 entries, as they don't need to be split. 
> 
> What's the point of this "RESEND"? Anything different from what you
> sent on Sept 30th? Since it is still numbered v4, I assume nothing has
> changed...
> 

Hi Marc, 

That's correct, nothing changed since the previous version.
Since it got no feedback since Sept 30th, I decided to resend it in order 
to maybe get some further reviewing.

Thanks!
Leo


