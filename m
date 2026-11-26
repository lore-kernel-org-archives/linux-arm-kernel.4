Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71DF606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 17:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=th7AcEM+;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=huB7NYJD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EoPzyDx6jm3ywF5UzK+QhQsk3HBLA419U9A5IMCSv1w=; b=th7AcEM+4wYguM
	SLmuSc/OqnxsNITa+eTY621uiEMoi1xaAMlbBFN49To68s3jGebAlNorHZNsdqRBVgzmNCpLv+h7C
	T2C+5e7Tw3X/askjBhD+Sv6Ikyzd+jOp4fuoKB2Dvd4uGlIpXqxMkUeTWvoFQcLFtkoM3NKg6TIxw
	y9gqcMVh6c5ImTaQQEG9agQEvLneztMCSCHIOr9cN/Igf9bdOgSDfU4/QrUwS35zIANXimTuGm0Oa
	zDOYA9LwgYFh4eD8LkG9Qd+Q/nZ4xMN0C0OdVVmShEGrfDhoUzKVaLLDJi904c5dQ38NxgMMeIBoD
	KOq8zgwOGA6VdclYpduA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWd3a-0000000E1gI-3zdI;
	Thu, 26 Nov 2026 17:14:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWd3Z-0000000E1gC-32pl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 17:14:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B76840E92;
	Thu, 26 Nov 2026 17:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A5B1F000CA;
	Thu, 26 Nov 2026 17:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795713289;
	bh=EoPzyDx6jm3ywF5UzK+QhQsk3HBLA419U9A5IMCSv1w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=huB7NYJDpSHPgRRvYHILvOLy6xpry/OMA/sp5FlAVJvkdE0mutJURugvi49jT4MPd
	 l4ijVqdne7xmGkbHP7AZv9qxMtxjMgbZhrcmv7i83SnC3LnaL7QPMK4ZGqJ2fuFBJa
	 xVFwQYh2ZC+5GHc/Vv2NtS1D/A4QNWLS5WyeHKt2cDLQe46UZtShiAYws3KoR9wMDy
	 rH7iB2fSv4xuu3omk8ZEKcmGqyc9agT+URqfvp/rQTRQAqsr4wBxG4Nt325jGV2SlY
	 wTzjXRYYKa4pa5yaWiSE6BS9hg638eVZzvkoE1Y+QaV6pJZnpDP24gB/SbyxOz31g7
	 wZAluRl9B2Yww==
From: Will Deacon <will@kernel.org>
To: julien.thierry.kdev@gmail.com,
	kvm@vger.kernel.org,
	maz@kernel.org,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	Alexandru Elisei <alexandru.elisei@arm.com>
Cc: catalin.marinas@arm.com,
	mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH kvmtool 0/7] Fix --vcpu-affinity
Date: Thu, 26 Nov 2026 17:14:29 +0000
Message-ID: <179570874285.2888674.1910692252028588031.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917154932.193943-1-alexandru.elisei@arm.com>
References: <20260917154932.193943-1-alexandru.elisei@arm.com>
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

On Thu, 17 Sep 2026 16:49:25 +0100, Alexandru Elisei wrote:
> This is my attempt at fixing --vcpu-affinity, which I introduced. Patches #1-#4
> are straightforward fixes, and they don't modify the current (broken) behaviour
> in any way. Patch #5 fixes is most of the fix: with it, the VCPU threads run on
> the physical CPUs passed to --vcpu-affinity, and most of the kvmtool threads,
> except the virtio threads, use the main thread affinity.
> 
> The virtio threads are special because they are spawned from the VCPU threads,
> and they inherit the VCPU thread affinity. Note that there might be other cases
> where this happens.
> 
> [...]

Applied first five to kvmtool (master), thanks!

[1/7] arm64: Pass the number of elements as the first argument to calloc()
      https://git.kernel.org/will/kvmtool/c/5b707c29743a
[2/7] arm64: Consistently treat vcpu_affinity_cpuset as dynamically allocated
      https://git.kernel.org/will/kvmtool/c/c1c630e7d331
[3/7] arm64: Free the temporary cpumask in vcpu_affinity_parser()
      https://git.kernel.org/will/kvmtool/c/e6fbd872f1b1
[4/7] arm64/pmu: Consider kvmtool's affinity when searching for a PMU
      https://git.kernel.org/will/kvmtool/c/8c3912c087d1
[5/7] Correctly apply --vcpu-affinity to the VCPU threads
      https://git.kernel.org/will/kvmtool/c/4c90ccf4c593

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

