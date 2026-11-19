Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A02606A338
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 10:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qL6eBz8a;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bDpd4c76
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1E9aeKD0ViG7J+qDgtkquYRiN07MXNXZrVg0YWEXHdA=; b=qL6eBz8ac/yWPp
	Gpvl6wg6q4zfunTKrWKVgsaknbcor0b99AfcTPpkELgyxUfQwiYyivdrLajB2wk8zGlvHerLsvsut
	XBsl+QKywsgUCZpv3dvQ/QK54iHIhPYdne2JgNRpXlEc1X2I6CiArhA7BpdxsgGbo2etyTmb53g+i
	KsUtNt4KIZcYS4UQWllYiC/1iz1HVoz2w2q0DBocG8tBnAV8P1L+Bom20L9QtjpsmGY1UCo/P+Auj
	iwiSACI/CQXcsNSleT5uySAc4OD505AdOY2ajB7sVJ6UcJVpKpzKwmcVO5YzpULtE2PALs0jLrtLM
	z3Kmam2af5CauIZb5lyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzXI-0000000BaBO-0FyW;
	Thu, 19 Nov 2026 10:38:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzXF-0000000BaAK-35LZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 10:38:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2CC61575;
	Thu, 19 Nov 2026 02:38:29 -0800 (PST)
Received: from [10.43.16.22] (unknown [10.43.16.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 048213F632;
	Thu, 19 Nov 2026 02:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795084712; bh=x1fzo650tskHuvw39pi4izoFCVukJDZuJ4305LusYok=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bDpd4c76baiHnPktB9iWk7TmT3YJu9ALX+K4/DuzM0re9Yr3YRDWuxopWtg2m5zET
	 HLVBz8WXXiC2a+J7ABKE16mDFkiEBXfpr9XI7WnIqIX/IpIM7MVn4cPEKXWKwspzrv
	 vR9QP5Xroxlu9V4bdWCKE9UuhZ4ZGN2v9WtiBBAY=
Message-ID: <243812f7-3883-4225-8f46-aa2a5face413@arm.com>
Date: Thu, 19 Nov 2026 11:38:27 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add test for atomic uaccess with permission
 overlay
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Joey Gouly
 <joey.gouly@arm.com>, Linu Cherian <linu.cherian@arm.com>,
 Mark Brown <broonie@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261119-poe_futex-v2-0-244c7a01f788@arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20261119-poe_futex-v2-0-244c7a01f788@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_023833_981606_8E993683 
X-CRM114-Status: GOOD (  22.67  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19/11/2026 10:54, Kevin Brodsky wrote:
> POE is not currently enabled at EL1, but my series [1] protecting
> page tables does exactly that, and it has revealed an interesting
> issue.
>
> Regular uaccess uses unprivileged loads/stores, which have overlays
> applied and are checked against the user's POR_EL0 as intended (same
> restrictions as when accessing memory from userspace). In some
> cases, such as atomic operations when FEAT_LSUI isn't available, we
> need to use privileged L/S with PAN disabled instead; overlays are
> not applied in that case.
>
> Once POE is enabled at EL1, we have to ensure that overlays are
> still not applied to these accesses. Otherwise, they will be checked
> against POR_EL1, which is completely invalid as kernel
> pkeys/POIndices are unrelated to user pkeys.
>
> If PIE is used, then we have to ensure that user memory types do not
> have overlays applied in POR_EL1, as Sashiko reported [2] on an
> earlier version of my series protecting page tables. Patch 1 tries
> to preempt such errors by adding a comment. If PIE isn't available,
> then... we're out of luck, as Sashiko reported later on [3]: we
> cannot prevent overlays from being applied to user memory. We'll
> most likely have to require PIE at least when POE is enabled at
> EL1.
>
> To avoid accidents in the future, patch 2 adds a kselftest to ensure
> that atomic futex uaccess (which uses privileged loads/stores unless
> FEAT_LSUI is available) does work on memory mapped with a
> non-default pkey. 
>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>
> [1] https://lore.kernel.org/r/20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com
> [2] https://sashiko.dev/#/patchset/20260505-kpkeys-v7-0-20c0bdd97197%40arm.com?part=3
> [3] https://lore.kernel.org/r/sashiko-outbox-207324@kernel.org
>
> ---
> v1..v2:
>
> * Reworded the cover letter and the commit message of patch 2 in
>   light of Sashiko's new findings (when PIE isn't available).
> * Rebased on v7.4-rc3
>
> v1: https://lore.kernel.org/all/20260521-poe_futex-v1-0-1da286b8f9b2@arm.com/
>
> ---
> To: linux-arm-kernel@lists.infradead.org
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Joey Gouly <joey.gouly@arm.com>
> Cc: Linu Cherian <linu.cherian@arm.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Yeoreum Yun <yeoreum.yun@arm.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-kselftest@vger.kernel.org
>
> ---
> Kevin Brodsky (2):
>       arm64: mm: Add note about overlays in PIE_EL1
>       kselftest/arm64: Add test for atomic futex uaccess with POE

I completely forgot to address Mark's comment from v1... Please ignore
this for now, sending a v3 soon.

- Kevin

