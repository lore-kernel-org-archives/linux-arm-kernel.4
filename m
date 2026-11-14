Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7E3606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 10:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KQ+ongix;
	dkim=pass (2048-bit key) header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GXxJlHfM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fGzu6S+vtoROaIzcwoSP9XCnpNyUzhPrDB39oZSUVZM=; b=KQ+ongix1jQtGG79fHcc9iDs1t
	0DokXWV5sif8RxWWQjCRjuMoxKHfMJWw0JzvcREg5hdFdSdLjws5CQIWHVnPGcFkFVWTA9/n5mXut
	6Id7zNCXkua7RVbCkU2jvISj5egIUYrCt2RBfT61FclSsrEVunjOQmI5gTrrpseq+WOZxwPt+jbsG
	0ZzJB7uceCywMYmZ8SZh1Rm2u1Zg/1bbECE8F6LI+4NAHcxnlLcLla8pgzUIZqtDLpkrDm2vtIcHN
	As8UOQH4XZ/MX/rfN9rG5xpj9X8WUuWi5wZxxHn9rzoL6vbKllX0lCLw3/SqtgKh21c+UhdD+uLWT
	9+LjFRhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAZ9-0000000FiE0-3AeL;
	Sat, 14 Nov 2026 10:00:59 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSAZ6-0000000FiDE-0dnR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 10:00:57 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso21794965e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 02:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20260707.gappssmtp.com; s=20260707; t=1794650454; x=1795255254; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGzu6S+vtoROaIzcwoSP9XCnpNyUzhPrDB39oZSUVZM=;
        b=GXxJlHfMickS8me2QEqUccwBk2zwmNO8Hg18FKgDxOFAKatU2VKVzFldhfEW8/AcfE
         SWnRj70RFfKj4ccXQv90sVoViRWslmgJjLcLPPG1RRQDmd9dAWZsO+Y8b6Jh6CAMu/iK
         TUvPr5JabQjl3paR0BhgWvJLa6nkC0tkKFjta/3SutMMiwugi+VUmhj0Zbc6Uu/9jKu5
         SEo4rmVpx7sfltRUjDQ+xIOFvW06q1z1ZY+ZDGZBhEvIhxlnWLEJ3OM2J8BPW9s34djX
         Z5AmePRH2no5PuuXyTrXuzihUZm/sjRmDaadD3Yq7Hj/DQnYW5BWKFdyT0e45QtVoAT0
         8+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794650454; x=1795255254;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fGzu6S+vtoROaIzcwoSP9XCnpNyUzhPrDB39oZSUVZM=;
        b=fKVElyY9wiAGAbi/U8tNweofqQ7cO4nXWlFNpxXhn/mJO2A1k2ur7Ml64XBgfbyZ4j
         ct/ZWB5/d6oVJ501hsfLZ/GTAH0cHkXFJGrIjXEfGs+Te5Fk/oRlPq2h+7nqwHnmJvqB
         M1MaCUVIkilCMC1IR7FHdoRHy39t4zBZ68GnOGSkNDTcF/wUjovW8lZuhQlsM/BiL6UN
         cggp+DthXeWaG1QANQxIxokTfveNZpApInoKVjpkJquSq0ko2o/yoA6tN3M2Mafoi9cN
         5oTf2hId+9yT3o5Idrmeul28mc+IO+B3mUeoVd+q7upZH5/b1ZkPEm7FHsG5C0fw8Xw7
         mBjA==
X-Forwarded-Encrypted: i=1; AL+hErE8NkjMRmXAeITUs7jcRHW111Lc7ueosyTEPyGPNp2uWoKy/Q3bf3HWSbN7eg0WR9qc11UUAAdtD5Bz3+qRA3x4@lists.infradead.org
X-Gm-Message-State: APuU4Z8HXPxoQLneiNBgDteN+EzEA5KOaIh3VWLv63dasS5ikKijImsU
	yplrVbO5YNArPoTKCbodbaRxLgS7p9SGIUcHuS3pEB6cJ82UeHucLe+NEIEoekKBL6tQ
X-Gm-Gg: AYBFou1mB2yyZVcxxrJW8DmzrEXfh+lrRr+e8yaD1RLrR9BbZh2bMJeuCOBWS0EuNVw
	3oRfqDgPgGr3LGtCV/KVM+/aTYhcaCEX5YUcqAmlumJmJBUBY9nY9ip9cKpTfMFoB9wyfRikJCq
	zR1hiJ5AFBntGKuLixOkXMe+9vUqdYLAu02qjzUZ4a91jnxPPOrYPeE54Ly1jpU64K4Ug3wo24c
	VjBppkzTJIvX+w5oqqfR1CDbb4MrXHLPQ4RGb5DCEDNk+O9ljJwMf2QTxIvi2D7WZUThv57aeCG
	MfMdB2mFSbhi0NXlowhDm4mhV4meP/R4UCQ7T9VPZx/QUUse7zFUdvX/+LFT30WlSYj7w4PWG7A
	eTI+PcGk97Wnj8jnaLrNNal2Yn141Iu1IordY755IzeidJgd/zpdShXYIm/egYbfcgsQO6dKsJq
	bjQZua6eRj/7Bt4PzH8rpVlwbYs//OxOFAoLENq+HXUqn7AINZjPcWJwM2uvIhFlP4+WSQn7oOD
	LovmYzbxOFnFNn1rk/P0fM4ADyCaMl4+RWnGm2mG0lM2NxjK/YrvbSXwpg8nA5PQHUl5Btpfu15
	2H0yMgyYjRdPBhIfO9CJ9KoS82AhGbek/g==
X-Received: by 2002:a05:600c:1f96:b0:4ac:aae6:6401 with SMTP id 5b1f17b1804b1-4bb55a4d990mr111281695e9.12.1794650453934;
        Sat, 14 Nov 2026 02:00:53 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:a084:d599:46a5:5c31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm16920053f8f.44.2026.11.14.02.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:00:53 -0800 (PST)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	will@kernel.org
Cc: catalin.marinas@arm.com,
	andrew.jones@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v7 0/3] virt: bao: add Bao hypervisor IPC and I/O dispatcher drivers
Date: Sat, 14 Nov 2026 10:00:46 +0000
Message-ID: <cover.1794649714.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_020056_520116_E3E24658 
X-CRM114-Status: GOOD (  31.03  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds guest-side drivers for the Bao static-partitioning
hypervisor: an IPC shared-memory driver, an I/O dispatcher that lets a
backend guest service VirtIO I/O for frontend guests, their UAPI and a
MAINTAINERS entry.

Bao is a lightweight static-partitioning hypervisor for embedded and
safety-critical systems (https://github.com/bao-project).

- The IPC shared-memory driver lets Bao guests exchange data through a
  shared-memory region split into a read and a write channel, exposed
  as a misc character device (read(), write(), mmap()). The channels
  are declared on the kernel command line.
- The I/O dispatcher bridges Bao's Remote I/O mechanism to a userspace
  VMM: the VMM creates each device model from /dev/bao, receives the
  frontend's MMIO accesses and completes them, with ioeventfd/irqfd
  support for the fast paths.

Changes since v6
----------------
The finding of the Sashiko review of v6 is addressed; it is in the I/O
dispatcher, and patches 1 and 3 are unchanged.
- The EPOLLHUP path of an irqfd marked it for shutdown and queued the
  shutdown work outside any lock that deassign and the device-model
  teardown take, so these could skip queueing it, flush and destroy the
  workqueue and free the device model before the work was queued.
  irqfds now follow KVM: an irqfd is active while it is on its device
  model's list, and whichever path deactivates it (EPOLLHUP, deassign or
  teardown) removes it from the list and queues its shutdown under the
  same spinlock, so the flushes always wait for every shutdown. Queueing
  the work unconditionally, as suggested, would instead let an EPOLLHUP
  re-queue a shutdown that is already running and free the irqfd twice.

Changes since v5
----------------
All findings of the Sashiko review of v5 are addressed. They are all in
the I/O dispatcher; patches 1 and 3 are unchanged.
- A device model is torn down in order: dispatching stops first, every
  I/O client is stopped before any is destroyed (the ioeventfds are
  released only once their thread is gone), then the queued, in-flight
  and still pending requests are completed. The dispatcher is no longer
  paused and resumed per client, which re-queued dispatch work during
  teardown and issued hypercalls when BAO_IOCTL_CREATE_DM failed.
- IO_CLIENT_ATTACH publishes a request only once it has been copied to
  userspace, so a concurrent IO_REQUEST_COMPLETE cannot complete it
  twice.
- ioeventfds follow KVM: two of them conflict when a write could match
  both, whatever eventfd they use; a request matches only the exact
  length; reads, and writes that no ioeventfd matches, are handed to
  the VMM instead of being answered or dropped by the kernel.
- Matching a request against an I/O range rejects zero or oversized
  access widths and wrap-around.
- An irqfd consumes the eventfd counter when signaled, and deassigning
  an unknown irqfd fails with -ENOENT.
- The I/O dispatcher is 64-bit only: the Remote I/O fields did not fit
  the RV32 hypercall registers.
Also, requests already pending when a device model is created (a
frontend that started first, a VMM that restarted) are picked up at
creation instead of waiting for a notification that does not come
again.

Changes since v4
----------------
- BAO_IOCTL_CREATE_DM requires CAP_SYS_RAWIO, is refused under lockdown
  and claims a non-RAM region with request_mem_region(), mirroring
  /dev/mem. The notification line is checked against the interrupt
  controller and requested exclusively, and its mapping is never
  disposed, since it may be shared with whoever owns the line.
- Requests that cannot be delivered are completed instead of stranded.
  The requests handed to the VMM are tracked: a completion only
  provides the value, and a VMM that exits leaves nothing behind.
- ioeventfds and irqfds are bounded per device model, and a device
  model id is bound to one file descriptor at a time.
- RISC-V: the hypercall status is the SBI value (a1), and both drivers
  depend on RISCV_SBI.
- mmap goes through .mmap_prepare and only allows shared mappings;
  .compat_ioctl is set; the IPC driver never unwinds a registered
  device; bao_ipcshmem.channels= is documented in kernel-parameters.txt;
  rebased on v7.4-rc1.

Changes since v3
----------------
- No device tree (Krzysztof Kozlowski): the IPC channels are declared
  on the kernel command line and, following drivers/virt/acrn, the VMM
  creates each device model through /dev/bao (BAO_IOCTL_CREATE_DM),
  which returns a per-device-model file descriptor.
- No architecture code (Will Deacon): the hypercalls use
  arm_smccc_hvc()/arm_smccc_1_2_hvc() and sbi_ecall() from a
  driver-private header.
- The "consolidate the IPC hypercall ID" patch is folded in (Andrew
  Jones), and the ioctl type is 0xA7.

Testing
-------
Built on v7.4-rc1 with GCC 15 (W=1) for arm64, arm and riscv, at every
commit, and with clang 21 (W=1) for arm64 and riscv. Run-time tested
under Bao v2.0.0 on QEMU aarch64 virt and QEMU riscv64 virt with the
bao-demos demos: the IPC driver exchanging messages in both directions
between a Linux guest and a FreeRTOS guest, and the I/O dispatcher with
a Linux backend serving console, network and block device models to a
FreeRTOS guest and to Linux guests, including killing and restarting
the VMMs, plus a userspace test of the /dev/bao error paths run next to
the live VMMs, which now also races device-model teardown against
eventfd close for the irqfds. The arm64 runs used a lockdep kernel.
32-bit Arm is compile-tested only.

Open items
----------
- RISC-V: the Bao SBI extension still uses the experimental extension
  space (0x08000ba0), and the Remote I/O hypercall returns the request
  in a2-a7, which does not follow the SBI calling convention (Andrew
  Jones, v2). Changing that means a hypervisor ABI change (status in
  a0/a1, request through shared memory); the RISC-V support is
  experimental until then, or it can be split out of this series if
  preferred.
- Bao does not implement the SMCCC vendor-hypervisor UID call, so the
  drivers cannot detect the hypervisor yet; adding it is planned on the
  hypervisor side.
- The notification line is a line of the interrupt controller the device
  tree's root node points at through interrupt-parent; a guest whose
  root node has none cannot use the I/O dispatcher yet.

v6: https://lore.kernel.org/all/cover.1794589639.git.jpeixoto@osyx.tech/
v5: https://lore.kernel.org/all/cover.1794038390.git.jpeixoto@osyx.tech/
v4: https://lore.kernel.org/all/cover.1790357735.git.jpeixoto@osyx.tech/
v3: https://lore.kernel.org/all/cover.1786010512.git.jpeixoto@osyx.tech/

João Peixoto (3):
  virt: bao: add IPC shared-memory driver
  virt: bao: add I/O dispatcher driver
  MAINTAINERS: add Bao hypervisor entry

 .../admin-guide/kernel-parameters.txt         |  15 +
 .../userspace-api/ioctl/ioctl-number.rst      |   2 +
 MAINTAINERS                                   |   8 +
 drivers/virt/Kconfig                          |   2 +
 drivers/virt/Makefile                         |   1 +
 drivers/virt/bao/Kconfig                      |   5 +
 drivers/virt/bao/Makefile                     |   4 +
 drivers/virt/bao/bao_hypercall.h              | 210 ++++++++
 drivers/virt/bao/io-dispatcher/Kconfig        |  20 +
 drivers/virt/bao/io-dispatcher/Makefile       |   4 +
 drivers/virt/bao/io-dispatcher/bao_drv.h      | 426 ++++++++++++++++
 drivers/virt/bao/io-dispatcher/dm.c           | 460 +++++++++++++++++
 drivers/virt/bao/io-dispatcher/driver.c       |  71 +++
 drivers/virt/bao/io-dispatcher/intc.c         | 186 +++++++
 drivers/virt/bao/io-dispatcher/io_client.c    | 475 ++++++++++++++++++
 .../virt/bao/io-dispatcher/io_dispatcher.c    | 184 +++++++
 drivers/virt/bao/io-dispatcher/ioeventfd.c    | 359 +++++++++++++
 drivers/virt/bao/io-dispatcher/irqfd.c        | 350 +++++++++++++
 drivers/virt/bao/ipcshmem/Kconfig             |  16 +
 drivers/virt/bao/ipcshmem/Makefile            |   3 +
 drivers/virt/bao/ipcshmem/ipcshmem.c          | 421 ++++++++++++++++
 include/uapi/linux/bao.h                      | 126 +++++
 22 files changed, 3348 insertions(+)
 create mode 100644 drivers/virt/bao/Kconfig
 create mode 100644 drivers/virt/bao/Makefile
 create mode 100644 drivers/virt/bao/bao_hypercall.h
 create mode 100644 drivers/virt/bao/io-dispatcher/Kconfig
 create mode 100644 drivers/virt/bao/io-dispatcher/Makefile
 create mode 100644 drivers/virt/bao/io-dispatcher/bao_drv.h
 create mode 100644 drivers/virt/bao/io-dispatcher/dm.c
 create mode 100644 drivers/virt/bao/io-dispatcher/driver.c
 create mode 100644 drivers/virt/bao/io-dispatcher/intc.c
 create mode 100644 drivers/virt/bao/io-dispatcher/io_client.c
 create mode 100644 drivers/virt/bao/io-dispatcher/io_dispatcher.c
 create mode 100644 drivers/virt/bao/io-dispatcher/ioeventfd.c
 create mode 100644 drivers/virt/bao/io-dispatcher/irqfd.c
 create mode 100644 drivers/virt/bao/ipcshmem/Kconfig
 create mode 100644 drivers/virt/bao/ipcshmem/Makefile
 create mode 100644 drivers/virt/bao/ipcshmem/ipcshmem.c
 create mode 100644 include/uapi/linux/bao.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0


