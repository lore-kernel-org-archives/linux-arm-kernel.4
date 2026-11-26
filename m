Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449A5606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 17:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DJTAmXru;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k51hQG8F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mr0bQkccB1U5mIDJr2ilPGqZODIc5rowh2SbF+JihyU=; b=DJTAmXrueXDX8z
	zYd1UTlCFMLiLmyzQ1tCsK550tQJ4nE+7R/bKKLzXqX7MInELqyYOjzGjn9o8OpSAPLZbnThaG0ff
	yRYf7ZyUk9WNqBlxK3AvvSwa4MrwJe/2YBkiddrJeI8Asfa9ybYZ4QwKHKLPfSL+3xcHusFhmuCMp
	rLWkvFw84+ROSghX4wW3uTu9uF/R8u9J71z4sPCj+RfwiUro89sQMlsWj7MFE16P3f3hKHVNbxA+S
	DNkLv/Pz9hL0lEgK+wtnUZNoyzc7JofKwHr5bGcZXVUDGAXmm9M99OppTFYDNmvdQZOViG4xSB9Xk
	lD5CsD5ZDSbettt19uMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdhs-0000000E6mu-49x1;
	Thu, 26 Nov 2026 17:56:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdho-0000000E6m4-2xxT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 17:56:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CED740740;
	Thu, 26 Nov 2026 17:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A332E1F000D8;
	Thu, 26 Nov 2026 17:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795715783;
	bh=mr0bQkccB1U5mIDJr2ilPGqZODIc5rowh2SbF+JihyU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=k51hQG8Fjyj3IE03hcECbxNRM+dG6XnLjuBgwlrTJVy5rnwwFL7vFrgSDGLAFITld
	 5HO7uv+BE/78iJOQTHgwWzeQ4slzvZgcH4bMQk6AO6zVzfDZFj+urTC8gRO9HbBme6
	 HK3NFyHRwlXSZXXxAjPv+PAjieWcPJYfgvSML4BkjOGcN6tFmcadmJXo9MbkE1NzzZ
	 dhOX5jz2xudfH4A8tDroVaJrqNHrkG1AZihOm+iXm4k2Zlc+Esitr1KM44Gb1SCUxW
	 ewuGGJvfl6ArufcUfFkViuBfvf6Rb34Tmad3bx3NlR8/S5jG3m3Vm/05VCA64YO9s3
	 6Lvf6jETxDzLw==
From: Will Deacon <will@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Suyash Mahar <smahar@meta.com>,
	Amir Ayupov <aaupov@fb.com>,
	Leo Yan <leo.yan@arm.com>
Cc: catalin.marinas@arm.com,
	mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org
Subject: Re: [PATCH v2 00/23] coresight: trbe: Refactor buffer and IRQ handling
Date: Thu, 26 Nov 2026 17:56:14 +0000
Message-ID: <179571394630.2992027.10346522745976163448.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 16 Oct 2026 17:54:58 +0100, Leo Yan wrote:
> This series follows the earlier TRBE buffer refactoring posting [1].
> The work is now split into two parts. This first part contains fixes
> and refactoring in preparation for wrap and trigger mode support.
> Support for those modes will be sent separately.
> 
> The patches are grouped as follows for easier review:
> 
> [...]

Applied sysregs update to arm64 (for-next/sysregs), thanks!

[01/23] arm64/sysreg: Define TRBSR_EL1.EC event classes
        https://git.kernel.org/arm64/c/9d3009259f0a

NOTE: I included the asm/sysreg.h change from patch 12 as well and added
a comment noting that the BSC encodings only apply for "Other" buffer
management events. Ideally, we'd be able to namespace those in the
sysreg file for each of the MSS2 encodings but I couldn't figure out an
easy way to do that.

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

