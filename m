Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74C8606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 18:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AoSGuks8;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=I3xtlgyU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Vi7mH+dw9wS6ao9xyvbhD1j+T7U5ryvmcBSEHbMA8Xk=; b=AoSGuks8+HWbRLfF1NdHx9Xv4X
	Ms7NQCIar4EtzMJDrCDMlFj7E2JYPq+S9S7JDm9I+TAgfJQ1JCyhFChfVKfOYWYXmutgPHbGUEeYR
	vnTMSAhwM6l0jSOGZWwiSI30xwMPh1tWM52ehv/Cdim+/dDjtK2/Mf0szCXNJchBdW4pdgElELevG
	Zb+Js3mDvVnBVH5pJ8s93s+47xygy1WETUjbz/d3dkW6KbOd8OBFKbLFfIQ2Pw2vye8cYhORYcDMy
	6RK0sznqkX9KPXlWFKLS/AH+Fk6LCzpQ574ZH7rSvvciLRiKGTx2wcTaQoMOve/UktKgIE5U2DSNu
	yy+xCnAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkU2-00000009z5h-2YpC;
	Wed, 18 Nov 2026 18:34:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkTj-00000009yu2-0s0T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 18:33:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFA491596;
	Wed, 18 Nov 2026 10:33:51 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9A333F673;
	Wed, 18 Nov 2026 10:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795026834; bh=7mdOOQuMqF/9zKIPA4CkwpFW7k7ZK0oDrx6hNO8qdz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I3xtlgyU8ZpQNKAqzD3ziZfwM+dwEuE3CAU5brR/WeBg3mSxXvByzEzvsHeu6CuIM
	 gSroDu+G5ZNW/8ONTMdqzptFk16Q/HccrEWrW8nlguL9ec9OzoCufMi4MVFYtuG4G7
	 LVq3kwlv9mWsfSV8CGcjUjpjI/ZUV+gWFTU03G+s=
Date: Wed, 18 Nov 2026 18:33:51 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/6] arm64: cputype: Add Cortex-A320 definitions
Message-ID: <av3vj4Tn4mX-Y-xf@arm.com>
References: <20261113145022.2592454-1-ryan.roberts@arm.com>
 <20261113145022.2592454-4-ryan.roberts@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113145022.2592454-4-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_103355_290989_DA903B87 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 02:50:17PM +0000, Ryan Roberts wrote:
> Add the Cortex-A320 part number and MIDR definition. The MIDR_EL1
> description in the Cortex-A320 Technical Reference Manual specifies
> implementer 0x41 and part number 0xd8f.
> 
> These definitions will be used to identify Cortex-A320 in the BBML3
> allow list.
> 
> Link: https://support.arm.com/documentation/109551/0002?lang=en&rev=0002-04
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

