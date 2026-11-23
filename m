Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DEA606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tu2k4ah3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zi9H4Suv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PyZ9yQC5Ep4/P10hYAHGznQfdWo4mmzt/SNYST0pY9E=; b=Tu2k4ah3nYSN2+
	hhin/FDVSQ1AGVujxv0xYj3efKf2EWQjzQaKnvrz5M9x9DySm4IJwFArd+nFSVzxs0gGDpBbGhQu4
	ioFCRv47yIMCxJ8wXBvZ7AjpWvxVpCCmvJDVh74b7Dtpz+GumyB5DTMFk1K0ZuAaX6QUg4DR38v9e
	yjqyIhsUasXnY6HYywWXkwV4cn4hvOL+5UyyREJMHkxo1Sem8eL8sYlHfhfCo5EmAI7OmnqE/9dbQ
	fCp+l4X1a8Efm/c05S+t7x7kRHPPPdjX6EfqwybasQPu8X9SH+4ZOUlSLgc7Jdg1EiKUspMa3krct
	ZO2o+5fsqtGiQxNnyiiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQqX-00000002sAf-09i1;
	Mon, 23 Nov 2026 10:00:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQqT-00000002s8O-38gE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:00:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4169E401B9;
	Mon, 23 Nov 2026 10:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B0F1F000EB;
	Mon, 23 Nov 2026 10:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795428021;
	bh=PyZ9yQC5Ep4/P10hYAHGznQfdWo4mmzt/SNYST0pY9E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Zi9H4SuvGgLmReGW5/Ottuna/ZQ5hZ+k6ORJlbhlBFfv1dKS3NMd4j/6mf7lCRd2x
	 3Ylgz/slXhnP0k6Un5Q+su6zCdrBj5KS41eaw101GEZFEB5wz/3lboFZbGFIrv4ZHx
	 U84xpQrHxI3bI1jAGWwjxQjOI/kvjHwWUHjLwhFs1r5SdYzJOQMSpu3hi2A7GcGqqk
	 2D8uvRAUFJxe5CIArpMrVmOfbNenSMvot8t24AATAM7OzkmBQrdwEpDPltG0xcfK7d
	 yqAA3NhatV7/s6XRUb/rA+vp5Du2LoOjKIe0t0GMB7cq0CVJb9A6aUV7IlH8dx23jY
	 Sl7KULA/hft9w==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xVQqQ-00000001tC3-3w8R;
	Mon, 23 Nov 2026 10:00:19 +0000
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Dan Carpenter <dan@pereq.eu>
Cc: Karthik Bhargavan <karthik@pereq.eu>,
	=?UTF-8?q?Cl=C3=A9ment=20Blaudeau?= <clement@cryspen.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: nv: Reset MMIO state when committing a nested exception
Date: Mon, 23 Nov 2026 10:00:11 +0000
Message-ID: <179542800495.4189470.7702534547191717526.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123-stale_mmio-v1-1-73f9c67a1bb0@pereq.eu>
References: <20261123-stale_mmio-v1-1-73f9c67a1bb0@pereq.eu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oupton@kernel.org, fuad.tabba@linux.dev, joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, dan@pereq.eu, karthik@pereq.eu, clement@cryspen.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, sashiko-bot@kernel.org, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Mon, 23 Nov 2026 12:47:42 +0300, Dan Carpenter wrote:
> KVM has two ways to commit a pending exception, commit_pending_events()
> which also resets the MMIO emulation state, and a direct call to
> __kvm_adjust_pc() which doesn't.  The EL1 to EL2 path in
> kvm_inject_nested() uses __kvm_adjust_pc(), but it needs to use
> commit_pending_events() instead.
> 
> The scenario is: the vcpu exits to userspace for an MMIO access and
> userspace then injects a synchronous external abort or an SError using
> the KVM_SET_VCPU_EVENTS ioctl.  If the vcpu is in L2 context and L1 has
> asked for the exception, then kvm_inject_nested() enters the exception
> straight away and vcpu->mmio_needed stays set.  On the next KVM_RUN,
> kvm_handle_mmio_return() completes the access in L1's context so it
> skips the first instruction of L1's exception vector and writes the
> MMIO data to one of L1's registers.
> 
> [...]

Applied to fixes, thanks!

[1/1] KVM: arm64: nv: Reset MMIO state when committing a nested exception
      commit: 551e73d9e21ee2a6d045736246eafcd79b32d9c4

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



