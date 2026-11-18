Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA69A606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 17:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PLCvYdRl;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=W8GsXwyw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+gnTC7J6XuQNe3AgIxA1ksVKCCNmvsI3infUbJm77Jg=; b=PLCvYdRlcIFoHiqvPT4asxXBFx
	EL6EAwnItuMqM45GzhrhTjm819G2sYdn6m7zPKk/x3H/PYZ/Wq7Dj7+JO87uTwU1lhAiTpKNC050n
	Rb1nPYmTkPChqlxr5+wY6DWfYXUixN9pCn/xJW5QHqJ7iZYKYeg2Ehwtty+KNNFKRD1XVXJW8Ia6z
	wRo3djjDdTtz2f1PM/eDcFgoFrCuBqEhzVMS5aXOCIUbV/wJMXKZ3GFIaprCh53u0hltbp3csP/KD
	CzaXgVZPqQcWvHUHYyYCvz4YQKNhIoX/MfonXdHFe4V0ZS5SqFe26Z4gBNUMC/XS89wpwPsJqU61j
	f5RyANmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjwR-00000009qN2-3A6v;
	Wed, 18 Nov 2026 17:59:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTjwO-00000009qM2-3GHS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 17:59:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3DF91477;
	Wed, 18 Nov 2026 09:59:23 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE62A3F632;
	Wed, 18 Nov 2026 09:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795024766; bh=GdJnCBh89kOv9bbe6kyAqJ9BHbXO7SU8lXBrgDqy/yE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W8GsXwywxidLqvIpu9Yh3/c6OgrC+JIidTlopUe4LXzpaqHhXvZCOZ4JqskNKiXrH
	 B3fIeamvRVPFCLGh4qjsDIA/I3cppb9sEDIVAMZlh4+B+MvsHkjSKIEAzk7/BR9f6S
	 1y6YYsy0l51md5ln2xsHqa/Td2OoN2hPgBx7dX9o=
Date: Wed, 18 Nov 2026 17:59:22 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/6] arm64: cpufeature: Track BBML3 exclusions with
 erratum options
Message-ID: <av3neu-9VTv8RgeY@arm.com>
References: <20261113145022.2592454-1-ryan.roberts@arm.com>
 <20261113145022.2592454-6-ryan.roberts@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113145022.2592454-6-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_095928_859330_25D7F0DA 
X-CRM114-Status: GOOD (  13.37  )
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

On Fri, Nov 13, 2026 at 02:50:19PM +0000, Ryan Roberts wrote:
> Several CPUs implementing the BBML3 no-abort semantics advertise only
> BBML2, but cannot safely use those semantics because of hardware errata.
> Omitting their MIDRs from the allow list hides the reason for the
> exclusion and makes the relevant workarounds difficult to track.
> 
> Add a default-enabled Kconfig option for each of the following errata,
> and include the affected CPUs in the BBML3 allow list only when the
> corresponding workaround is disabled:
> 
>   3043240  Cortex-X925
>   3043263  Cortex-X4
>   3053180  Neoverse-V3 and Neoverse-V3AE
>   3683289  C1-Ultra and C1-Premium
>   3696239  Cortex-X3
>   3696242  Neoverse-V2
>   3696244  Cortex-A710 and Cortex-X2
>   3696250  Neoverse-N2
>   3696285  Neoverse-V1
>   4196850  C2-Ultra

I'm not sure what the benefit of this is. These CPUs are not listed in
the BBML3 capable list anyway, so the patch adds them but gated by a
Kconfig option, default y. Is it only an elaborate way to tell people
why we couldn't enable BBML3 support for them? Maybe the documentation
part is sufficient.

-- 
Catalin

