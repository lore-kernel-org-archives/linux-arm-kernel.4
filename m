Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4D5606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 21:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZMPgnpzp;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nqkMprSp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9eUiTKQ0nxnwd/hB/hSh3Zzj2FjaTsifeHHHck1wgfE=; b=ZMPgnpzpUY2Ju0
	XvqnCbxGPc0ByHZyLgmAlz2PHxJFfXa5ckfsmmCEINgQc4m0ZtcPZEywAdDdTkuFPml6cyMhCfl34
	WKJbOKtPJzhuLoNEEv9nLBjbYdlbP1s2dTSq/BXoKX4tKPIPmdZ/7c/gsnC2gWy/qVrnC1g9nAEXC
	dno99qlBvlu9GmqUQ/1UGh0Na35QF4oG/b0r18nPcfh7+RuXqoMQjorHFtAeJPwJJN8OAvLSXpa8g
	7thAPzcMKqdq/DRTfkuvvp/lQ6OLJ+ymC7X7x10T3JXtP+UL8yT5eGX96Ufra3jLn5BF/6eJ0NWpV
	8Uw2sUE7NtTh1bbUFDug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRBD-00000007B7N-1nrR;
	Tue, 17 Nov 2026 21:57:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRBC-00000007B6k-0nPo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 21:57:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 63F9661540;
	Tue, 17 Nov 2026 21:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45A61F000C4;
	Tue, 17 Nov 2026 21:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794952649;
	bh=9eUiTKQ0nxnwd/hB/hSh3Zzj2FjaTsifeHHHck1wgfE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nqkMprSp2bn3gUIYtVrexrmOH+LRBuDfiP+xNOhum3seJBkAi6J39qXyHNBVLAJ14
	 49IX3wnh/UQESA8lMe3WJigCG7qVrKJmQBhQXBvcTAham64iih1Ny3wGHDA3bPXdjA
	 OOaGdXKYzpStgWleIH+oN6dfa1LCGyLfUMhZDVr6B/FlKY5fJ4xxLQ/REP3NEPT+SL
	 SBPo1ZTIMl20TtNT1HbrQP3TjJefSk/j++wwBgz6L/FJSRdDtKZINrYaR8W0Tgg8Rl
	 1NTNfdb86I0f2dPXgjiaG1VbN2gEZfIA6yjEhvCx56iWOuReNQDA59K7j/A7zMVQsT
	 pMCSbf8ZlGKaw==
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: Re: [PATCH v3 0/2] KVM: arm64: Stop stage-2 teardown scaling with the IPA size
Date: Tue, 17 Nov 2026 13:57:23 -0800
Message-ID: <179495264130.1456871.12453105511491068179.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106133000.453240-1-fuad.tabba@linux.dev>
References: <20261106133000.453240-1-fuad.tabba@linux.dev>
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

On Fri, 06 Nov 2026 13:29:58 +0000, Fuad Tabba wrote:
> Changes since v2 [1]:
>   - Return a failed walk's error to the callers and warn there, instead
>     of inside the walk. (Oliver)
>   - Dropped the comment on the next-mapping lookup. (Vincent)
>   - Collected Reviewed-by from Vincent on patch 2. (thanks!)
> 
> Two patches that make stage-2 teardown take time proportional to what
> is mapped, rather than to the size of the IPA space as it has since
> 4ddfab5436b6.
> 
> [...]

Applied to next, thanks!

[1/2] KVM: arm64: Resume stage-2 teardown where the walk stopped
      https://git.kernel.org/kvmarm/kvmarm/c/6607becfb034
[2/2] KVM: arm64: Resume a pKVM stage-2 teardown at the next mapping
      https://git.kernel.org/kvmarm/kvmarm/c/737a5ff38ccd

--
Best,
Oliver

