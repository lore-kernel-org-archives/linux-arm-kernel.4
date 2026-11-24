Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA984606A684
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 19:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O9Uve6C3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gID+J2N4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5J01ZOJdhCMA8zsKrJKkfRkGLE9elsf3RiNcT7zsnao=; b=O9Uve6C3nnP508fMEaZg76juzQ
	fwkiTfHpfyBlY0JtuMbMVHWW5STdC0HOquhWrrEReJMIZTR/c91UBEjQ7HOGanR2GUXr6ESsZI5v7
	JHsqLgawcrgbiCM9aNezY4KtMgjmfBle1szZ0lEbTrxDEQF7cajDIEVMxTA5crCKsnz7AjkzvVNRa
	dcF3zUIVyfYc8qxZohPjIDnDd0kGPToZ8zpV6K4yv448XpxImQNDF7mgiLUkxNPHSg/EgToLPbsus
	axYujqtvRvD0mnZDMs5FGcUSih9glgslwsOabQu5ciMRf2wfGMHXeeLekw7RL80tUkeCq+i5cWTCj
	hLel9BUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwU1-00000007cLd-1LAZ;
	Tue, 24 Nov 2026 19:47:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwTz-00000007cLK-2fFW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 19:47:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6615745C5A;
	Tue, 24 Nov 2026 19:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B03F1F000CA;
	Tue, 24 Nov 2026 19:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795549635;
	bh=5J01ZOJdhCMA8zsKrJKkfRkGLE9elsf3RiNcT7zsnao=;
	h=From:To:Cc:Subject:Date;
	b=gID+J2N4pc96FAGoaAdH9GNoyuk7pm/dJ+Pd1dLjC5UYwrf/2XXaiSDqR5Euswhj0
	 sJMCCPYvAXOJnPSpjddWI5vircAM4cpLXkdv7zMBKq7YtZYBsXLWu2Yk+tjyMe3dDx
	 9xyzRKC5yaHN5ndp6zBFA2eGmxq/46X0asFrabrgupkiuu5/Ad4SqNuuysY15OWCJM
	 Ja/MTu/+pURvovmn6BkUeyiAxihKX7G+i69Uzw+7txSYWS12eL9RhqD//BMsAjbVih
	 hFeqCiTIYatN5sEE0bCjcu+JpmSfIUjOt58uPkIu2oQe8XoJfE7tx01fgzPeCTMb7c
	 rLyTWF0N2uqEg==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.ams.internal (Postfix) with ESMTP id 4AF0E1980047;
	Tue, 24 Nov 2026 14:47:10 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Tue, 24 Nov 2026 14:47:11 -0500
X-ME-Sender: <xms:vekFazy-q0gutZ7ux0FCvcouxXRxAsHD34FNLCUkK1fuewqtUaqS5Q>
    <xme:vekFayNFPbrDfoDWNGpBn2pKSD_E5S8LbKakNnZYjiRXw19kBMBVyeCxLM8EdpnsX
    528oHUr8lqcvU_uwceoVN_NHgO0YO_dsaWuLI_dcdXenzg8-lnCvSIK>
X-ME-Received: <xmr:vekFayY0ZyDCUQZvCIkdB952g1vLWtuV1YXbqfih5Zldm3T5QriCgJ7f3Bo>
X-ME-Proxy-Cause: dmFkZTGUX4TdwkcU+s5tAMz9Yp1WUvFjhlftEjNS8e63BxeNN7yQom4qhi+EDz7Y31fNHS
    VqelmG4hXUQhSnQKx90mkPkGjS/Ib/iBqwLxCgM1q+hZMnhrdSgkjdm4UEMT8GOdDxt5Z2
    7Lg6Eb6MKboetZY01n/Hk7uozefc7YF5hljgdbmJ4lbazD83XBGpus63VsFuzXmhXDEeZ9
    JWdTxiLjrWHBiUq8/dP/MzCYgBCjoEn2Rtgli+x14FjTF6SI5r8vv/15/QJ2H+QpE5X9kd
    KRGhRx/BN1j26Et6RkG3SYm5hSAJA2HNDEMsr+bFOEgSNncmefC1a7U8PQb8pOch7ngxf1
    TH5RdbbWHADsYXTPBUS4gRfpDxngpqbMNQVrK10l35jqedfF0BB3QCysPDTKOO7eHI8ovf
    idn9dNdDLs7YY0EsnDjgUqIuacUiQfqhXDbUqRKeddn0k6LE0OkDP8c6CcUePcjGVVRjT/
    1Dmk2gxT42KUoHNP1lF3WlEPPJO2yyF4hmflWKq95hRtJPQKIxeQMfyuF851GWnjKdDT3g
    SbqvGWAO4miVaJC22MxZHaamB1zkVFgWEyLguUH9HRyTjYn5kFnPMv2mqcyEbUK3OcfO9u
    MgL7kHeZdsm22wy1cjhaB+lVWVcBx4HC9CC7zBZD36CdiZb8YqTljRRpgwMA
X-ME-Proxy: <xmx:vekFa0qQibBd5Yjy5EDY4qwQUHYEh8Jewoz4q7BmzAD7BnOD_BdArQ>
    <xmx:vekFa_zfywy1OGE3qkkRXlIpISdYaw86n2DSZjwWwdES5ay66R-Wkw>
    <xmx:vekFa8KdLB_QyPLQGQzZnGGV-levXzamS0cBt16XgEABqKCVqSewpQ>
    <xmx:vekFax7A3zle1yCe6-c7eXVhSt3HY3FhBsf6HN1wJIdeck5M5QzF8g>
    <xmx:vekFa6wPi6anooP1ZJHrXVg7yqmH00bZr8TksT7umWyBWjJFjNPxOnes>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 14:47:09 -0500 (EST)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 0/2] firmware: arm_sdei: Fix NMI backtrace lockups on idle CPUs
Date: Tue, 24 Nov 2026 19:47:03 +0000
Message-ID: <20261124194707.1030653-1-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
Cc: "Kiryl Shutsemau \(Meta\)" <kas@kernel.org>, Yin Fengwei <fengwei_yin@linux.alibaba.com>, kernel-team@meta.com, Vladimir Murzin <vladimir.murzin@arm.com>, Marc Zyngier <maz@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>, Cong Wang <cwang@multikernel.io>, Liao Chang <liaochang1@huawei.com>, Doug Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, Ashok Raj <ashok.raj@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Pengjie Zhang <zhangpengjie2@huawei.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SDEI NMI backtrace signals event 0 to every other CPU, including the
ones in a power-down idle state, where the kernel has SDEI masked. TF-A
acknowledges the SGI behind event 0 on a masked PE and never ends it,
and the PE takes no Non-secure interrupt again. Jinjie hit it on a
384-CPU HIP12, where one sysrq-l locked up the machine.

Patch 1 keeps event 0 away from masked PEs. Patch 2 sends the regular
backtrace IPI to the CPUs that SDEI refused, which wakes them.

TF-A v2.13 and later refuse to signal a masked PE, but a PE that masks
right after the check still takes the SGI. The TF-A fix is under review:

  https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55414

Tested under QEMU TCG with TF-A built without that check, 4 CPUs. One
CPU masks and unmasks SDEI in a loop, through cpu_pm, the mask calls and
CPU hotplug, while another signals it; sysrq-l afterwards. Signalling
with plain SMCs, as the kernel does now, wedges the target. With the
series every run passed, lockdep included, and a panic in the middle of
it completes.

Jinjie ran an earlier version on HIP12 with the power-down state
enabled: sysrq-l got 384/384 answers every run. The handshake has
changed since; Jinjie, could you give this one a run as well?

Kiryl Shutsemau (Meta) (2):
  firmware: arm_sdei: Do not signal event 0 to a masked PE
  firmware: arm_sdei_nmi: Send the backtrace IPI to CPUs with SDEI
    masked

 arch/arm64/include/asm/nmi.h    |   7 ++
 arch/arm64/kernel/smp.c         |   2 +-
 drivers/firmware/arm_sdei.c     | 130 ++++++++++++++++++++++++++++++--
 drivers/firmware/arm_sdei_nmi.c |  30 ++++++--
 include/linux/arm_sdei.h        |   4 +-
 5 files changed, 157 insertions(+), 16 deletions(-)


base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.54.0


