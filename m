Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B2E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 11:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TIa0c6A/;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZW9s1R5M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Dk2wXFjhpQieaTn4+8P73Xaj27BcCLp8OmiozuxND8Q=; b=TIa0c6A/xpjpAEBQi/hUFkjIle
	WwTcUOj8OC0BNA7ytPq3o0yBUINOIIHmSZDReVDwZKv7cqgAkt0lUs/jwMwZpVhOpWeEAnnXy3TMM
	bdErAzAitYhydmlM24A6jmoVk8Hw8KbQeLFXLeAmpf1m0Kvd9lcCgKOS0RnxXkK1VejvC+/lEUkla
	R3UD/wRFWcCzU1yrbvOVHgim1IeflxRH84LwNHB0qf5lhySz5ez9bsBSgw+lc/UtgnE19qH3TAPba
	oBdTmqkDPkegnrCVWSl0zQ243HgHG3fqFH2sZSYa+6qBdYFLWbkIJ9wb8Yt7OWKIT+JWwBqpwHfwS
	pn9aPu/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoZX-00000006KFu-0cJa;
	Tue, 24 Nov 2026 11:20:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVoZE-00000006KD6-3T8D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 11:20:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BE1F339;
	Tue, 24 Nov 2026 03:20:05 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EBD13F86F;
	Tue, 24 Nov 2026 03:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795519208; bh=6Rsk+fNLaeVjh0mdUYBJ7NOQt7+Hpq7agfJ3FnxeUIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZW9s1R5M8KR+WqVWd47Go2kxQtGXcj6QCZlJoLpkFo9/069nWj42Id7h9TNTHY9N0
	 0zV+6jhdua2jwP0FVw2K4szsWMk+g+mLl7HHP3QQvbvYyVEG0UBF7n5HTKR8iF2LSB
	 gz5VUtma8PANIC5msgF1kyd1wWQ58zf3KCH4nrR4=
Date: Tue, 24 Nov 2026 11:20:04 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/6] arm64: cputype: Add C2-Ultra definitions
Message-ID: <awVy5Dqw5tl51K45@arm.com>
References: <20261113145022.2592454-1-ryan.roberts@arm.com>
 <20261113145022.2592454-5-ryan.roberts@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113145022.2592454-5-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_032010_524578_E3C9C528 
X-CRM114-Status: UNSURE (   9.51  )
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

On Fri, Nov 13, 2026 at 02:50:18PM +0000, Ryan Roberts wrote:
> Add the C2-Ultra part number and MIDR definition. The MIDR_EL1
> description in the C2-Ultra Technical Reference Manual specifies
> implementer 0x41 and part number 0xd96.
> 
> These definitions will be used to identify C2-Ultra in the BBML3 allow
> list.
> 
> Link: https://support.arm.com/documentation/109736/0001?lang=en&rev=0001-05
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

