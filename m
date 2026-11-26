Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495DF606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 01:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ObulRxlK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YfAFamKX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=A7MK+0JZdOCZ6OteoBzUeiNtDWO9oGxvpaMs7GXGdz4=; b=ObulRxlKGxZUvn/rWYp7V+p1W2
	CrgEgxilshp2A/69Ag7hM0ZwcrvLe2+aM43B1kDYEiX+sdTQzNNuck03lwXOv9EJgOlMGXCFQvHgm
	ANnSIxTJNF/cCqwhaIMEZ5DAA/+ubXZ28KLggGcz6XqxtOOLrLvf0ZVL/HmJpERszDUw0FtpVs7KB
	Ibk8X0xAr0wDl66z9Qc6hh64mU0N0H6Of16lFIsBH65EZ0xCHG1LxvQHLHTLWvO7oti/N9/+LY88J
	RZRF/Oi/9CG94BWlAUS3vueAaY6z3o/F5ewKkThFbxqtDeMb9mgLZ84uVVi2gGqZM2VyJbIhqTsHx
	eLvN9b6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWOV6-0000000Boid-2SIx;
	Thu, 26 Nov 2026 01:42:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWOV5-0000000Boi8-3kEA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 01:42:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E1E9960210;
	Thu, 26 Nov 2026 01:42:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795657334;
	b=3PhUZtdNjXuHioMjRsF6t0whFkD51teSwjH04pzuJJQtzQqgXJAE3bERMeFqf6tkpCNt
	 /ty0O2G0FItCAjCN6Oit5MxaBFbNkGGi07cZ6uAo6KowcT9qiEyUrmQTbWLyXNMuRfc0A
	 1g1TiVlcWSJTDkXNcoOGYlJQCxPibKL2f9QZ5ZMxZuuZAiIUwAraHI5LNpPiCV4/USlvG
	 MM6idNZKdkKXHkmmsDAcE16nANqzgMqPojcsGsxkdp1sfqIzfNaqI6vlWxFPDzWp8QEGn
	 WUKMcjtKl0Qg2nPMnQtXQ2QScsaPa/JdAxzzi1UKnYqaZ0aTvucPNy8XUI6vgYmUiAg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795657334;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=A7MK+0JZdOCZ6OteoBzUeiNtDWO9oGxvpaMs7GXGdz4=;
	b=m1Sv3XtwglRNwNe2LbA07PnCBivDejYf+qYwotJNBjYB65BuZNV0R2K/MBaeJWHsMd/7
	 GzI9pgM1zauS6kpEUbwUxg+TiDt2Tj0wRx6sFd6r6L1xnrgmxj3FJCK6J0slokQ5s+adW
	 TpBsj1NNCi9hS96vSUXCN6LE7UwzX3qxmNr01ApPbS6X/hPvjz8GjuM2acXeNMdJvXFbL
	 xxsU2Vj98GnUBeUs/VtqfVQI3FWz21Fe6y5WABRHgCMbTwAfQKwj+T0K8FZlOxD8ExEhI
	 E3a4kMxsWeLgsym02L8JQPwgt+8R39j7ilkSzNF+UmBxrntKwI7Hw+zyk8MVh3/d2Bg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 37DE61F000C4;
	Thu, 26 Nov 2026 01:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795657334;
	bh=A7MK+0JZdOCZ6OteoBzUeiNtDWO9oGxvpaMs7GXGdz4=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=YfAFamKXxrRpAqL9t+wh3NrO3b2Ab6wtCI2Jjm5WbrH5pBsKjwU3DlH9b9ASSoSW/
	 aHIlxV9UpbfEN3oG/y2mGaToAKvSiYqAoDjPzpgB7eJMF5KITgW0o5ES+B8wyFawMr
	 KvZxaMY3r10olDU6GApzllrgJGM3MYfDBi/g2jTsD1pLJ3RSO3TdYvyB6hFcUFyeyD
	 c5aDlt67/fMtX/LOLPdqwNDkCVK5J3SSnPHVWJGw/Nq75uBYSBSy4qBGbidZCXLtnT
	 mxu3d4qwLEg+SGkGRmO/Z4knovHQTyiAGS+O19wy80/AqqFpFsdltbLUYnN/reRbqj
	 GluAhVvCOMCWA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BD4C44D164;
	Thu, 26 Nov 2026 01:42:03 +0000 (UTC)
From: Brad Fitzpatrick via B4 Relay <devnull+bradfitz.tailscale.com@kernel.org>
Date: Thu, 26 Nov 2026 01:42:04 +0000
Subject: [PATCH] KVM: arm64: GICv3: Keep active LPIs in the LRs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-bradfitz-kvm_lpi_active-v1-1-9ff28176bf66@tailscale.com>
X-B4-Tracking: v=1; b=H4sIAGuOB2sC/yXMQQqDMBBA0avIrBtwUlDwKqVIMpnU0WolSUOpe
 PfGunyL/zeIHIQjdNUGgbNEeS0FeKmABrM8WIkrBl3rBlE3ygbjvKSvmvLcP1fpDSXJrLj2V2o
 dGksIpV4De/n8z7f76fi2I1M6drDvP2uisdh7AAAA
X-Change-ID: 20261126-bradfitz-kvm_lpi_active-e0f3c7d1abc1
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 stable@vger.kernel.org, Brad Fitzpatrick <bradfitz@tailscale.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795657323; l=9811;
 i=bradfitz@tailscale.com; s=20261011; h=from:subject:message-id;
 bh=BipltIb3Lr8cSMMj0mxE4M1WaC2QTa+l/ibW/HJbl7w=;
 b=la6OSwzvf+EEB6WnO34xzCyVLZjdkBGux0smwdqe6xbHThMaL04cxuyLvxOZbjCRhf8SNeS4E
 n3+qQqrguYrDyzZ4fnneNmQ+/Onaykq2fIV9++zhTdKSphOor3M4wUA
X-Developer-Key: i=bradfitz@tailscale.com; a=ed25519;
 pk=RL25YdOUenVJzQaiZDrw/Aqu9ZEwUQBon30yMHGsIKY=
X-Endpoint-Received: by B4 Relay for bradfitz@tailscale.com/20261011 with
 auth_id=1152
X-Original-From: Brad Fitzpatrick <bradfitz@tailscale.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: bradfitz@tailscale.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Brad Fitzpatrick <bradfitz@tailscale.com>

Since commit 73c9726975af ("KVM: arm64: GICv3: Drop LPI active state
when folding LRs"), the active state of a virtual LPI is discarded on
every exit. If the guest has acknowledged an LPI but not yet EOI'd it
when an exit happens, the LPI is then pruned from the ap_list, and the
guest's subsequent EOI targets an INTID that is not in any LR. KVM then
relies on the virtual CPU interface performing the priority drop
regardless.

That doesn't hold for Apple's emulated GICv3 interface, as exposed by
macOS Virtualization.framework to a Linux guest running with nested
virtualization (M3 and later, e.g. "tart run --nested"). There, an EOI
of a vLPI that has no LR leaves the corresponding ICH_AP1R0_EL2 bit set.
The running priority of the vCPU stays at the LPI's priority forever,
and since Linux uses the same priority for all of its interrupts,
nothing is ever delivered to that vCPU again. The nested guest's CPU
spins on WFI, with KVM seeing pending interrupts and waking it up over
and over (about 30k WFI exits per second), while the guest itself
reports a hard lockup on that CPU. With a 2-vCPU Debian guest, this
happens within the first minute of boot, every time.

The architecture is arguably ambiguous here: the ICV_EOIR1_EL1
description says that a write "drops the priority for the virtual
interrupt" and the VirtualWriteEOIR1() comment says "just priority drop
and return", but the pseudocode itself only drops the priority on that
path if the IMPLEMENTATION DEFINED "Drop before checks" behaviour is
implemented (Arm IHI 0069E, 9.20 Pseudocode).

Avoid depending on this when we don't have to: keep the active state of
LPIs when folding the LRs, so that an acknowledged LPI stays in its LR
until the guest EOIs it, as was the case before v6.19. The only LPIs
whose active state is now dropped are the ones that don't make it into
the LRs, which is where EOIcount can't track their deactivation. On
implementations like Apple's, that case still relies on the priority
drop, but it now requires LR overflow instead of a single exit at the
wrong time.

Tested on Apple M5 Pro, M4 Pro and M1 Macs and on AWS Graviton3.

Fixes: 73c9726975af ("KVM: arm64: GICv3: Drop LPI active state when folding LRs")
Cc: stable@vger.kernel.org
Signed-off-by: Brad Fitzpatrick <bradfitz@tailscale.com>
---
This is a bug report in the form of a vibe-coded patch, which came out of
me asking Claude to bisect why my Linux kernel upgrade broke nested virt
on my Mac mini Proxmox cluster. Things worked fine with
proxmox-kernel-6.17 (6.17.13-1-pve), but every kernel option after that
(7.0.14-30-pve, 7.3.5-1-pve, mainline 7.4-rc4) was busted: Linux guests
of the Proxmox node hang during boot with a hard lockup on one vCPU.

Claude bisected it and tested this patch, which makes Proxmox nested virt
work on my Mac minis again (both M5 Pro and M4 Pro minis).

Claude slop text follows. I don't claim to know any of this. You're
welcome to ignore this patch entirely and fix it in a proper way.

The setup: macOS's Virtualization.framework (via Tart, "tart run
--nested") runs an arm64 Linux VM with EL2, which runs KVM in nVHE mode
as a Proxmox node; that node runs a Linux guest. The vGIC in the middle
VM is Apple's emulated GICv3 CPU interface (ICH_VTR_EL2 = 0x90580007,
8 LRs, 5 priority bits, TDS set).

What goes wrong, per instrumentation of the middle kernel: the stuck vCPU
has ICH_AP1R0_EL2 = BIT(24), i.e. an active priority of 0xc0, with no
interrupt active in KVM's view, and all four used LRs still holding
pending interrupts (timer PPI 27, SGIs 1 and 6, an LPI). Since Linux uses
0xc0 for all of its interrupts, nothing is ever delivered again; the vCPU
spins on WFI about 30k times per second with KVM waking it every time.
Logging every time vgic_v3_fold_lr() discards an LPI's active state shows
that it happened exactly once in a hung run, on the vCPU that then got
stuck, for virtio-blk's MSI at priority 0xc0.

So the guest's EOI of an LPI that is no longer in any LR doesn't drop
the priority on Apple's emulated GIC. The patch keeps active LPIs in the
LRs, as before v6.19, and drops the active state only of LPIs that don't
fit in the LRs. Details are in the commit message.

This looks specific to Virtualization.framework's emulated GIC, not to
Apple silicon: on an M1 MacBook Pro running Asahi Linux on bare metal,
with Fedora Asahi Remix's stock 7.3.4 kernel (which includes
73c9726975af1), the same Debian sid guest under QEMU/KVM, using the ITS
and LPIs, booted fine 4/4 times with 2 and 4 vCPUs. So M1's hardware vGIC
does the priority drop.

Testing:

  - Nested (KVM in nVHE mode in a Tart VM), QEMU guest (Debian sid, 2
    and 4 vCPUs), M5 Pro Mac mini on macOS 27.0: unpatched 7.4-rc4+ hung
    5/5 boots, patched booted 4/4.
  - Same on an M4 Pro Mac mini on macOS 26.6.2: unpatched hung 2/2,
    patched booted 4/4.
  - Nested, real Proxmox VE 9.2 node on the M5 Pro, booting a Proxmox
    guest (Debian sid): 6.12 and 6.17.13-1-pve boot, 7.0.14-30-pve hangs,
    and patched 7.4-rc4+ built with Proxmox's full config booted 4/4 (2
    and 4 vCPUs), with the node's cluster and Ceph services healthy.
  - Bare metal M1 (Asahi, Fedora's 7.3.4-401.asahi.fc43 source): boots
    4/4 both unpatched, as above, and with this patch applied on top.
  - Bare metal AWS Graviton3 (c7g.metal, Neoverse-V1, GICv3 with ITS, 4
    LRs), mainline 4dce97c6c265 with and without this patch, each in VHE,
    nVHE and protected mode:
      - KVM selftests: identical results with and without the patch in
        every mode (VHE and nVHE: 40 pass, 9 skip, 0 fail; protected: 37
        pass, 10 skip, 2 fail, where vgic_init gets EINVAL instead of
        E2BIG and mmu_stress_test times out, both without the patch too).
      - vgic_lpi_stress at up to 16 vCPUs and 64 devices: passes.
      - Debian sid guests with 2, 4 and 16 vCPUs and 32 virtio-blk
        queues under O_DIRECT read load: boot and finish, no stalls.
      - To exercise the LR overflow path with active LPIs: a local copy
        of vgic_lpi_stress whose guest handler spins between ack and EOI,
        with a kprobe on vgic_v3_configure_hcr() histogramming the
        ap_list summary on every guest entry. With this patch, the LRs
        overflowed while LPIs were active 904 times (VHE), 376 (nVHE) and
        344 (protected), and all 160 runs passed. Without the patch that
        count is always 0, since LPI active state is dropped on exit.

Not tested: kvm-unit-tests, GICv4.1 direct injection (KVM reported
"GICv4 support disabled" on the Graviton3), and any non-Apple, non-AWS
hardware.
---
 arch/arm64/kvm/vgic/vgic-v3.c |  4 +---
 arch/arm64/kvm/vgic/vgic.c    | 26 +++++++++++++++++++++-----
 2 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 65b77fb35be37..ba50809f66928 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -90,9 +90,7 @@ static void vgic_v3_fold_lr(struct kvm_vcpu *vcpu, u64 val)
 		return;
 
 	scoped_guard(raw_spinlock, &irq->irq_lock) {
-		/* Always preserve the active bit for !LPIs, note deactivation */
-		if (irq->intid >= VGIC_MIN_LPI)
-			val &= ~ICH_LR_ACTIVE_BIT;
+		/* Always preserve the active bit, note deactivation */
 		deactivated = irq->active && !(val & ICH_LR_ACTIVE_BIT);
 		irq->active = !!(val & ICH_LR_ACTIVE_BIT);
 
diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index fe09ada322625..05459d662965c 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -1013,11 +1013,13 @@ static void summarize_ap_list(struct kvm_vcpu *vcpu,
  * - Virtual LPIs have an active state (surprise!), which gets removed on
  *   priority drop (EOI). However, EOIcount doesn't get bumped when the LPI
  *   is not present in the LR (surprise again!). Special care must therefore
- *   be taken to remove the active state from any activated LPI when exiting
- *   from the guest. This is in a way no different from what happens on the
- *   physical side. We still rely on the running priority to have been
- *   removed from the APRs, irrespective of the LPI being present in the LRs
- *   or not.
+ *   be taken to remove the active state from any activated LPI that doesn't
+ *   make it into the LRs. This is in a way no different from what happens
+ *   on the physical side. Active LPIs that fit are kept in the LRs, as some
+ *   implementations (such as Apple's emulated GICv3 under nested virt)
+ *   don't perform the priority drop for an EOI of a vLPI that has no LR,
+ *   leaving the running priority stuck forever. Overflowing the LRs with
+ *   active LPIs still relies on the priority drop.
  *
  * - Virtual SGIs directly injected via GICv4.1 must not affect EOIcount, as
  *   they are not managed in SW and don't have a true active state. So only
@@ -1059,6 +1061,20 @@ static void vgic_flush_lr_state(struct kvm_vcpu *vcpu)
 			break;
 	}
 
+	/*
+	 * Active LPIs left out of the LRs can't be deactivated by EOIcount, so
+	 * drop their active state. See the LPI rules above.
+	 */
+	irq = *host_data_ptr(last_lr_irq);
+	if (irq) {
+		list_for_each_entry_continue(irq, &vgic_cpu->ap_list_head, ap_list) {
+			if (irq->intid >= VGIC_MIN_LPI) {
+				guard(raw_spinlock)(&irq->irq_lock);
+				irq->active = false;
+			}
+		}
+	}
+
 	/* Nuke remaining LRs */
 	for (int i = count ; i < kvm_vgic_global_state.nr_lr; i++)
 		vgic_clear_lr(vcpu, i);

---
base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
change-id: 20261126-bradfitz-kvm_lpi_active-e0f3c7d1abc1

Best regards,
--  
Brad Fitzpatrick <bradfitz@tailscale.com>



