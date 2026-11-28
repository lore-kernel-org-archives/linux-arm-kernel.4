Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C7E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 01:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zRi0c0Pg;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qbp21Qyd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=BBMBNNcvr0Pj2/ghVYvp4jkKT4rcq0bfzVoAeRYCUTU=; b=zRi0c0Pg44mWTSd7NHsMBLBrCM
	/RwTwGczC354a1uMB5MISwdhS6ZfoqWU04PuqXLsCHkL61bcvlMTtFiaK4aH785te3OpZ2F7RIG2F
	5DesibAJGSRAuseVDBPXmljxDRjAXs7uwcy7r1+pQzgtxFIFTXc+noaT8JQ81/8FDHz8eTqNoQPtM
	p5wMs86CV+TNOM1mW4Psvk9Ccm8Vm3q3+Hd7M1WtUBbQIb1xGaIGD6u0DiyVXGq78R8nsS+z3nP6p
	6Yh9Iml4ask0lZfoEXbpps/hdIiwEfN5bFf/ze48Img8yHKt8vbOo/yCJNEdzkmzyyZpnMBdnJy5b
	vUIjb1BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX73X-00000000GIn-3LbN;
	Sat, 28 Nov 2026 01:16:47 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX73G-00000000G92-0ZyW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 01:16:32 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-57e468d51b1so1944111b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 17:16:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795828587; cv=none;
        d=google.com; s=arc-20260327;
        b=Y5m5OtfjOC6il9w2tDJJBa4i1PW42NfAOSGLPXvi/jgFxSTnzvgGjCphLu2pVz0ADs
         wohB7OnyeScOgG1PCL0R7ZyTlxvAF9x/cAVdubD+pj7umMW6zTrF4wgqN1SVujhy2v0u
         5EjuUp8BLEI7Ac1o8AmZ4WnYL9ix70x8RGxvH0Uc0r0o83FZUcpKhJjtNtCncOz3QtS6
         DUyHlqmTsgfaFyaezfdurgh32MegkSnboOAx4q9RhW4DLWP5aRzhOIV0gsDQLRobLhhT
         ucShlvZEKvGVONz/vRxEG583C2HP7cq793F07he5jbobN54i6L8ZUSWwQYx2WsatSLiY
         tFcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=BBMBNNcvr0Pj2/ghVYvp4jkKT4rcq0bfzVoAeRYCUTU=;
        fh=zn0txdshe2LNzyYbPX7XF7kQdxo8wRW7aa9xP3SafsI=;
        b=ZmUhkTAM2lhOdGOtc/pS40bOvdLbZSgFRzjOry9s2N9drE/p0gKpn95zYZSlHSYQiK
         oKK6YS+TxUL5iSHl10FF5q7z8/uOL/TC0G6sqzk433lYjaJ2VwwkEDJWGQyeCDMCkU54
         TCgehRB3KLVbEv+Bivgu3aL3+aEZAPKo+n2k8CCdGEtiOELYtR5KFH9m7kb7/KuJQw51
         cVE54XUEi7DIcMGGSb9PiOMToKOyt8Z8Wa9oa1phCSx8SWg6qFowx/XQUJTRnEqQ1Wk5
         lmMgZedb2O0FQgwNqGk9mHgspafsLf54FtXkqfcNjp4f3zuyfOCFBlFN6Z1ow1SD4Oa+
         yQZw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795828587; x=1796433387; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BBMBNNcvr0Pj2/ghVYvp4jkKT4rcq0bfzVoAeRYCUTU=;
        b=Qbp21QydiYMW2R1ZITuUAR7TCeEJd2EoOFAjNHAFLw4GGQmpRyJwl6I3wryB8iu6z9
         mCwsvdpQzl2jtNLQ7R78b6yKiSHNO4RBzgmJEnE0WpML6AqGx8K/gv2bW/jwNPliIYNk
         qqnKDbyXqSfg6+1DBC3+xsyIK8CcKVB2A25HrMWIKtD8vAD0a9ShqXyNXvm0FuAEXrOB
         3kucPFJ5/4PApSLGOVTyp/bRKLMYK+9N7PLhKr9D4FjzfH3E6f3npEIWDPdJ+yjIvNjs
         /F0uBIri80Taih4zUb3pltHHBDQI41sY7ISW1E2kclxmb2o6nnlxlePUpTyuhjP0gTg7
         CjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795828587; x=1796433387;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BBMBNNcvr0Pj2/ghVYvp4jkKT4rcq0bfzVoAeRYCUTU=;
        b=ian3Ytr0+ZO3A/ftyNcFPuw+cRjkYTJXggjoT9nj4Ze57+GnLe+/NZQTJkFbtHyfCh
         oM6f4GxaCf0OMp+c2RKzAl6U4OAdQs5SwcAW+9aI7mYvWmvev8ynPpU6BpzOu2n3usbO
         Wcgr8RNQrCMIw3zft2avorfo4WBR2e96vi/QgCL7N6DQB4MlfqvRuP77ETUYmPybNsqd
         e36bbsD/QSzzuXthum16b9XWQfOrNz5P+2jwy2UOQGe8exkbHYsoRDd996bOPR+WbnRd
         8MZmqdupCSELpBe3ZquAASpiI3yC/ck/8ue7wjAs4N9pu8HaXHg/2zrW17vzFjLh2Prk
         If7A==
X-Forwarded-Encrypted: i=1; AL+hErEB189Y+AMH8EoNl2MhXIF425qLvPm+U8nf5dlagiT9+2D5bO2WuFBg+dFHNGO3tvNYZcmrRDSeeqz0eWvUATCX@lists.infradead.org
X-Gm-Message-State: APuU4Z+10dVaEYLo5alX9P3ejX0QUpnx1Q9TIZ1JQZ+gpcyjeYS49vqh
	9eaT/wSjisgGmT2Up/E59mwO00q2GHlSD6vuN6EHZg0sRcaWKo72xTqtyJhEFO411CJn3lshdCw
	33t19NbZvFUrk/lZ67UBvH6UoSVFhbfs=
X-Gm-Gg: AZFdTZexHSLB3iC6nVy/HH3zcCxhHLzDPZMEju9TcE+8k6fv74V2CiBHYtPmPlAIRt+
	j1BkoBKEruCdxVjg1GHZBWNZr6drFawQFdVzNrGsudikAmAwdq2E6ypgh2oRIxEIYwk17RXPrOA
	cXRahiOaS/60harMhCj0rtnqB6j/p+dCf3KnH8s7G69JPkcWJqWFuQ4BRF7DgAoekPI/IpCS2M8
	o11Ox+N7Q4OvyJzb9ef/M6xHTWKqNhs9x3QUTJh/TjJLHSf8UWJuNwBCEgqGjA/9+WBvlX3aYVG
	Atyg6FWBR/2LlRNQHN2v/K0WEc81/t8gdMOIC/N8rB9JF1w/PNB1+92/ec45zst8MaeaFpGh44E
	AfEucHrshixjb23tvGmCAER3u4i+g/Q7W9Xq583WCAHMhzLTjPThK4sR0Kg==
X-Received: by 2002:a05:6808:2224:b0:572:d0fb:ae56 with SMTP id
 5614622812f47-57a0ab2d70fmr29848553b6e.34.1795828587269; Fri, 27 Nov 2026
 17:16:27 -0800 (PST)
Received: from 968777710935 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Nov 2026 20:16:26 -0500
From: Chenyang Yu <yuqwerty123a@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 27 Nov 2026 20:16:26 -0500
X-Gm-Features: Aa3M54qrHo6Jaw9Cpb-IZQafwPQlp-SvlrLs2D75RZWuMCPZGNxcGUVQM_cbxKU
Message-ID: <CAGV7iNjs2oYKh0eGrp=7XP+__c2XjjDQMd5gHmUcm=86uzCuCg@mail.gmail.com>
Subject: [BUG] virt: geniezone: unimplemented GZVM_IRQFD_FLAG_RESAMPLE and
 dropped GZVM_IOEVENTFD MMIO notifications stall SMP Linux guests on mt6991
To: Yingshiuan Pan <yingshiuan.pan@mediatek.com>, Ze-Yu Wang <ze-yu.wang@mediatek.com>, 
	Liju Chen <liju-clr.chen@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, crosvm-dev@chromium.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_171631_261410_067DC907 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Yingshiuan, Ze-Yu, Liju, MediaTek GenieZone and Android/crosvm teams,

We are reporting two critical virtualization bugs in MediaTek's GenieZone
driver (drivers/virt/geniezone/) and EL2 hypervisor observed on production
mt6991 (Dimensity 9400) hardware running Android 16 / ACK 6.6.118 with AVF
crosvm and an unmodified Debian 13 ARM64 guest (Linux 6.12.118, 8 vCPUs).

Hardware & Software Versions:
- SoC / Device : MediaTek Dimensity 9400 (mt6991), OPPO Find X8 (PKB110)
- Android Build: Android 16 (API 36), PKB110_16.0.8.300(CN01)
- Host Kernel  : 6.6.118-android15-8-gebdfad32d749-ab15099304-4k SMP PREEMPT
- VMM          : Android 16 com.android.virt crosvm (ab13197479)
- Guest Kernel : Debian 6.12.118+deb13-cloud-arm64 (8 vCPUs, 4 GiB RAM)

========================================================================
Bug 1: GZVM_IRQFD_FLAG_RESAMPLE is accepted by gzvm_irqfd() but never
       implemented, stalling level-triggered virtio-pci INTx queues
========================================================================

In drivers/virt/geniezone/gzvm_irqfd.c:

1. gzvm_irqfd() explicitly accepts GZVM_IRQFD_FLAG_RESAMPLE:

       if (args->flags &
           ~(GZVM_IRQFD_FLAG_DEASSIGN | GZVM_IRQFD_FLAG_RESAMPLE))
           return -EINVAL;

2. However, gzvm_irqfd_assign() completely ignores args->flags and
   args->resamplefd. No resample eventfd_ctx is acquired, no
   gzvm_irq_ack_notifier is registered, and gzvm_notify_acked_irq() is
   not wired to guest VGIC EOI from EL2.

Impact on VMMs (crosvm):
Because GenieZone does not provide virtual GICv3 ITS (no MSI-X), crosvm
falls back to legacy PCI INTx (IRQ_TYPE_LEVEL_HIGH on GICv3 SPIs 36..41)
and registers GZVM_IRQFD with GZVM_IRQFD_FLAG_RESAMPLE. When register_irqfd
succeeds, crosvm assumes level resampling works (async_intr_status = false
in devices/src/virtio/interrupt.rs) and suppresses further irqfd triggers
whenever interrupt_status.fetch_or(mask) != 0, relying on resamplefd to
re-inject if interrupt_status != 0 upon guest EOI.

Whenever a host virtqueue completion races with the guest window between
reading/clearing the VirtIO PCI ISR byte and writing ICC_EOIR1_EL1,
interrupt_status transitions back to 1, no resample event ever arrives
after EOI, and all subsequent interrupts for that PCI device are
permanently suppressed.

Workaround confirmation:
Rewriting /pci/interrupt-map SPI trigger flags in the UEFI FDT from 0x4
(level-high) to 0x1 (edge-rising) prior to booting Linux completely
prevents this stall class.

Expected fix:
Either wire args->resamplefd end-to-end with EL2 VGIC EOI resampling (and
deassert the virtual SPI line prior to signaling resamplefd), or reject
GZVM_IRQFD_FLAG_RESAMPLE with -EINVAL until EL2 support is present (and
avoid pairing IRQ_TYPE_LEVEL_HIGH INTx with async_intr_status = false in
crosvm when resampling is unavailable).

(Note: while inspecting gzvm_vcpu.c and gzvm_irqchip_inject_irq(), we also
noticed gzvm_vcpu_wakeup_all() unconditionally wakes all GZVM_MAX_VCPUS
threads on every SPI injection and per-vCPU gzvm_vtimer expiry rather than
waking only the target vCPU(s), causing 7x redundant host context switches.)

========================================================================
Bug 2: Dropped GZVM_IOEVENTFD MMIO doorbell writes permanently wedge
       VIRTIO_RING_F_EVENT_IDX virtqueues
========================================================================

Even with PCI SPIs patched to edge-triggered, guests intermittently hang
due to lost Guest-to-Host ioeventfd notifications when executing
vp_notify():

    dmb  oshst
    strh w0, [x1]   // 16-bit MMIO store to VirtIO-PCI Notify BAR

where crosvm registered the queue's notify address via GZVM_IOEVENTFD
with len = 0 (wildcard length/datamatch).

Case A - Live /proc/kcore proof on virtio-blk (guest IRQs enabled):
During normal multi-process file I/O over SSH, fdatasync/fsync/writeback
tasks hung in TASK_UNINTERRUPTIBLE (rq_qos_wait <- wbt_wait), while
hctx0..6 were idle (active = 0) and virtio-vsock (SSH) remained live.
/sys/kernel/debug/block/vda/hctx7/busy showed 2 requests stuck in_flight
(tag=54 READ, tag=55 WRITE) on vCPU 7.

Reading struct vring_virtqueue for virtio3 vq[7] live from /proc/kcore:

    vring.num               = 256
    event (F_EVENT_IDX)     = 1
    num_added               = 0
    avail_idx_shadow        = 561
    vring.avail->idx        = 561
    vring.avail->used_event = 558
    vring.used->idx         = 558
    vring.used->avail_event = 558
    last_used_idx           = 558

1. last_used_idx == used->idx == 558: the guest processed all completions
   written by the host; no host->guest interrupt was lost.
2. used->avail_event == 558: the host [virtio_blk] worker last consumed
   entry 557, published avail_event = 558, and slept on epoll_wait.
3. On submission 558 -> 559 (num_added = 1), virtqueue_kick_prepare()
   computed (u16)(559 - 558 - 1) < 1 (true), cleared num_added = 0, and
   executed vp_notify() (strh of 7 to GPA 0x2c01b01c) in normal task
   context with guest IRQs enabled, advancing guest PC past strh. However,
   the host eventfd was never signaled.
4. Subsequent submissions 559 -> 560 and 560 -> 561 observed
   avail_event == 558, evaluated vring_need_event() == false, and did not
   re-notify, leaving vq[7] permanently wedged.

Case B - 4-vCPU hard lockup on virtio-console hvc0 (guest IRQs disabled):
The same dropped GZVM_IOEVENTFD write hits virtio-console (hvc0, out_vq
GPA 0x2c003004) during boot log floods or interactive console echo.
Because Linux's put_chars() -> __send_to_port(..., in_nonblock=false)
submits 1 buffer at a time (needs_kick is unconditionally true) and spins
with local IRQs disabled at:

    while (!virtqueue_get_buf(out_vq, &len) && !virtqueue_is_broken(out_vq))
        cpu_relax();

while holding port->outvq_lock, a single lost 0x2c003004 kick locks up
4 vCPUs at 100% host stime (outvq_lock holder + hp->lock waiter + RCU
stall console_owner + hardlockup detector console_waiter), while host
[v_console] remains asleep in WaitContext::wait() (verified live: sending
RX input 15 minutes after the hang still woke [v_console] on in_avail_evt,
incrementing voluntary_ctxt_switches from 844 to 847, proving the worker
was not blocked on host pipe output and never received transmitq's
ioeventfd signal).

Suspected EL2 / gzvm_vcpu_run() boundary to audit:
In drivers/virt/geniezone/gzvm_vcpu.c:

    while (!need_userspace && !signal_pending(current)) {
        gzvm_arch_vcpu_run(vcpu, &exit_reason);
        switch (exit_reason) {
        case GZVM_EXIT_MMIO:
            if (!gzvm_vcpu_handle_mmio(vcpu))
                need_userspace = true;
            break;
        ...
        case GZVM_EXIT_IRQ:
        case GZVM_EXIT_GZ:
            break;

If gzvm_vcpu_handle_mmio() had returned false, need_userspace = true would
have exited to crosvm, where VirtioPciDevice::write_bar() has a userspace
fallback (evt.event.signal()). Because neither gzvm_ioevent_write() nor
the userspace fallback signaled the eventfd while guest ELR_EL1 advanced
past strh w0, [x1], please audit EL2's Stage-2 MMIO abort handling under
concurrent physical IRQ / MT_HVC_GZVM_IRQ_LINE exits to ensure an in-flight
MMIO trap that has already incremented ELR_EL1 cannot have its exit_reason
overwritten by GZVM_EXIT_IRQ / GZVM_EXIT_GZ before EL1 processes
GZVM_EXIT_MMIO.

Best regards,
Chenyang Yu

