Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48205606A333
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 07:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jg35aPgG;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=BlyO/E4n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=51h+wZNa35FD1EC1X1bdOrgyM+/7WSD6oz6H64NzSRs=; b=jg35aPgGhKEETDTTb8n04hFzLM
	Oz52uCMtQhZ00rc4gdq629yculWCflAMR6RiFOkJDsPQ+0IF7K0QDQjSUVgkOuwPM7GfABnQtIzq0
	tW2VB/9wxwUnDyc5yTPI19DsERmkCP4SeniynaI8SKT+si5iPkTKO4R1dvGL4Tv7An1iJBkFdFZEi
	1jtvfFkMfcVAVuY25dETQJKMGStzOlgGApZa1m4gAGxiYzhQxJNsUNCe4cwMEsKHwddr8m7p54JY/
	UKHegardM9OShctAIy1ntLdhGbO2k6gVuCkQezsQGzDOXQOKFU3d8JvGzTaGbQ2N0hHjVmVgwS2IR
	SJPQCtww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqu8-00000001Mzu-232S;
	Mon, 16 Nov 2026 07:13:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqu5-00000001MzW-248B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 07:13:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 676231476;
	Sun, 15 Nov 2026 23:13:19 -0800 (PST)
Received: from entos-yitian-01.Arm.com (unknown [10.168.196.233])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8B7D93F673;
	Sun, 15 Nov 2026 23:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794813202; bh=a1hWSo6rMM5vS16uc45frAdAoXhN/qdOo7VriKqajX4=;
	h=From:To:Cc:Subject:Date:From;
	b=BlyO/E4nt8iq9lAYlE026ZI86/KRvlSlPukz/xkGD1JqsEhSEyJ5YKGVhOmvgvoRI
	 UmdcPTv0obqztZbi0g3L/061EbgR8F3xQUygRH+y8CDBKrWbyYWJcmLndlLsmHRVyj
	 pRcLDoqOQOISTPx2EUpaZeVHlmf+C/JsQSx2CQms=
From: Jia He <justin.he@arm.com>
To: maz@kernel.org,
	oupton@kernel.org
Cc: fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	bigeasy@linutronix.de,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	Jia He <justin.he@arm.com>
Subject: [PATCH 0/2] KVM: arm64: gic-v5: Fix irq_desc locks taken under the runqueue lock
Date: Mon, 16 Nov 2026 07:13:02 +0000
Message-Id: <20261116071304.2037895-1-justin.he@arm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_231325_625004_791BE8BE 
X-CRM114-Status: UNSURE (   9.87  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With a GICv5 guest, kvm_sched_out() takes irq_desc locks with the
runqueue lock held in two places. Lockdep reports both as a circular
dependency with any interrupt that queues affinity notifier work under
its own descriptor lock:

- kvm_timer_vcpu_put() clears the active state of the host timer
  interrupts. These are per-CPU and never threaded, so this one is a
  false positive. Patch 1 gives them a separate lockdep class, as
  commit 7100185bdc11 ("irqchip/gic-v4: Use a separate lockdep class for
  vPE doorbell IRQs") in kvmarm/fixes does for the GICv4 vPE doorbells.

- vgic_v5_put() can move the vPE doorbell with irq_set_affinity() when
  the vcpu thread is scheduled out in the middle of WFI. This came up in
  the review of "KVM: arm64: gic-v5: Request doorbells when VPEs enter
  WFI", where the resident check was expected to make it unreachable.
  It is reachable, because vgic_v5_load() makes the vPE resident again
  when the halting vcpu thread is scheduled back in. As the doorbell can
  be force-threaded, this can wake its irq thread under the runqueue
  lock, so patch 2 stops moving the doorbell from kvm_sched_out()
  rather than hiding it from lockdep.

Tested on the Arm FVP Base RevC AEMvA GICv5 model (11.31.28, 8 CPUs,
VHE) with PROVE_LOCKING, on top of eedaa7d61f1e.

Lockdep reproduction: to provide the other half of the cycle, a test
module registers an affinity notifier on the UART interrupt and changes
its affinity a few times.

- Patch 1: the vgic_v5 selftest pinned to CPU0 next to a busy loop.
  Without the patch, lockdep reports the cycle through
  kvm_timer_vcpu_put(). With it there is no report, and &rq->__lock
  depends on the new class instead of &irq_desc_lock_class.

- Patch 2: a vcpu executing WFI in a loop, woken by an SPI every 5ms,
  with halt_poll_ns at 50ms and the vcpu thread moved to another CPU
  every 1ms. A kprobe on irq_set_affinity() saw 11 calls from
  kvm_sched_out() without the patch, together with the lockdep report
  quoted in the commit message, and none with it. The doorbell is still
  moved from kvm_vcpu_wfi() itself (51 and 61 calls).

PREEMPT_RT reproduction: PREEMPT_RT force-threads the vPE doorbell, so
patch 2 also fixes a real inversion. Without the patch, and without the
test module, the same WFI test makes lockdep report the cycle closed by
the doorbell's own irq thread: irq_set_affinity() from kvm_vcpu_wfi()
wakes the thread under the descriptor lock, while kvm_sched_out() takes
the descriptor lock under the runqueue lock. The model stops making
progress right after the report. With patch 2 there is no report and the
test completes. (Booting PREEMPT_RT on the GICv5 model also needs
"arm64: smp: Don't force-thread the GICv5 IPIs", posted separately.)

Jia He (2):
  KVM: arm64: Give the host timer interrupts a separate lockdep class
  KVM: arm64: gic-v5: Don't move the vPE doorbell from kvm_sched_out()

 arch/arm64/kvm/arch_timer.c   | 15 +++++++++++++++
 arch/arm64/kvm/vgic/vgic-v5.c |  8 +++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)


base-commit: eedaa7d61f1ec8ae053a9ece0d553785350ac486
-- 
2.34.1


