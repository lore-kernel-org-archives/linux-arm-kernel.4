Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42685606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 11:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t2hiGV2m;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Yw5cxfDQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1B+nCK7IVGBh795a0Rgcb1AZQ4kSvKVLL9SmHcTIfKA=; b=t2hiGV2mrKz5+/
	549fCm7eQpMcDR+8SQLScXUBRsNzgESnKxH8CG6eQEUOrki/N1OLYkR6K8qlyZrlgIn5++zvoFmNd
	MpFWjGmK2/JP5pgTERHxSUMpQxMEXfBpRQ51gNw5WWShCZx7W6kTbAWXACWWyzQKh7PLL0F90OIxH
	3gXy5L6VtwPqeTRvfvtGwnRILIEp+RNd+zQqmgPGFzinwZrv+FW+VXY1rK7IHlWnkH3/vT9XCpWbD
	Olds6elGb4bOYy8tZz/P1W9Iw5HeiePIIoeB+H8qLfb/1ZFMPCqGtmXS7Az6leu0tCovS264HCC5M
	ZI9LbkUDFVl6JSEb9gXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXTT-0000000Crrp-1xBG;
	Thu, 26 Nov 2026 11:17:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWXT0-0000000CrLP-1nZ1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 11:16:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3A521BB0;
	Thu, 26 Nov 2026 03:16:38 -0800 (PST)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9C9603F632;
	Thu, 26 Nov 2026 03:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795691801; bh=iAEd6xa9eOJeWCX84Erk4niZaFNGjwfaBPHspobCjOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yw5cxfDQLcdBCOTH8ZBtmILoVYfEkhTiO/dk2oCkdh/zSrgbbB76UGjl/5HDak7L2
	 8U9K5hsJBVYLMPWOXvzI3uFN0gNWT4ivianMNbzzYWUyOZ8PJ2OIpNyVod+DCGgNse
	 73aO3rD9AiioBwfXdLTCfLP//wYWX1bFlRLhXPFY=
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org,
	mark.rutland@arm.com,
	ying.huang@linux.alibaba.com,
	Yadong Qi <yadong.qi@linux.alibaba.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ryan.roberts@arm.com,
	robh@kernel.org,
	gregkh@linuxfoundation.org,
	ptg-linux-kernel@linux.alibaba.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] arm64: fixmap: fix missing break-before-make in __set_fixmap()
Date: Thu, 26 Nov 2026 11:15:52 +0000
Message-ID: <179569175258.1940346.15175112800352133.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126022227.1618-1-yadong.qi@linux.alibaba.com>
References: <20261126022227.1618-1-yadong.qi@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_031642_542215_DAF89F2E 
X-CRM114-Status: UNSURE (   8.79  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 26 Nov 2026 10:22:27 +0800, Yadong Qi wrote:
> __set_fixmap() installs a new PTE with __set_pte() but never invalidates
> the TLB; only the clear path calls flush_tlb_kernel_range(). The
> dsb(ishst)/isb that __set_pte() emits makes the new PTE visible to the
> table walker but does not invalidate stale TLB entries. Overwriting a
> still-valid slot therefore leaves the old translation cached and
> violates break-before-make: accesses may keep hitting the old output
> address, and changing the attributes of a cached entry can trigger TLB
> conflict aborts or CONSTRAINED UNPREDICTABLE behaviour.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: fixmap: fix missing break-before-make in __set_fixmap()
      https://git.kernel.org/arm64/c/18817028301d

