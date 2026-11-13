Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B76606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 17:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0UMq//Za;
	dkim=pass (2048-bit key) header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gfjbPL0q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=K4XNZiwrr0RJRpeWG5dfP2Kz0D1CmXeE6JJQJUjjjck=; b=0UMq//ZalCcqpzMbR0Hed4K5bQ
	KCqKnofJm5gg0zQrNN5XE0NXVxHoCDQn5N3G4obPdjrs1uTl6liPsJCnqfzCpnejv2RN4ZpUJzwK2
	lECdnZIYKT459NqK1+kusTIOp6AdtUX3z2qvP3ZULbsE1+IngV37XdJ/2j3yjbl8IH9aSQKqMXlc9
	tBdJXcjz14O3w6GzXlNIBA5DxDIkm+zr/XnJICljhScCIQiRUTg8LQ4vBTTRluuOsKUI34WjSMbwN
	j0m1Wsgt2KSWs80ScSoNHI2pMcYW/5N/XNLPc+Y6+ThRH17pncUkEA/NUYpjaYQ9kBF+NbdGruaM7
	C5ahGQkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRupl-0000000DhSw-1pF4;
	Fri, 13 Nov 2026 17:13:05 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRupi-0000000DhRr-0Zho
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 17:13:04 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso7576435e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 09:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20260707.gappssmtp.com; s=20260707; t=1794589980; x=1795194780; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K4XNZiwrr0RJRpeWG5dfP2Kz0D1CmXeE6JJQJUjjjck=;
        b=gfjbPL0qB7ez2MEOOyTjmrqEpNjltI89Sc0baCkJQJZrJszOPvvlkbrIx0kMOvtAyf
         4K/3TVShTE+HcvyXkSiMmip3CZw7i5UAQEuxnGZdPK+baoGEodEex66o1hCY1VAvokFS
         zIIp/Him/FMkeUUuYnL6+7NingetfccD7wMY8XSRB7fWdAWBYQLrXX7ZH380TQxjtYz9
         c9U7tB9WByfzyxKXv2NMdTdUcPyqw7mvehzyX+5hJ7kcwlX27CguzFqp8+JOdHX2+j/x
         xfPjcTzVfyY2DD8kgRWtcV3tufDqOgrlavmJ4eCbHlHuSOLnKP7xnsoU21Ktkijw1tRK
         QuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589980; x=1795194780;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K4XNZiwrr0RJRpeWG5dfP2Kz0D1CmXeE6JJQJUjjjck=;
        b=OdLQLwt3U3EmF6fLK4TsGPHcs6eghHc1xDKKks3LHWV1yPc49jIRk08jxi9+0GGBlj
         Ji1IR9aWL9LfhVmwB6hEA6D2yU1Cl1rrnZLvWJdiryxgHc8swFpaDgYI0IplAQ1CAP8m
         qAH3oHotw9y+s0l3hYGpo+hbM9d0mtRmx4DEFZI1kw3Vzh2czREryJfHxdEU53WcrZac
         +0nkTP7MLw/JstV5PeaDk5fm1qy2/QPuBG29JUG6sXMVSljWjjMxQ9ABaubwwhsgt/Q6
         GuUA9LQhGIZidk+s6VBU3nKAJEZOThZ4tKIKQX7spmY2hqFkB+cqc3ceaIHAmPprjGYO
         QWNw==
X-Forwarded-Encrypted: i=1; AL+hErHvnQhaXvZPKyqtKkZ8N04q7SgiJBoXibk1i+GUHNBrrVzrQ5LyMjWmf9GrualLYjw9TDtgWEWo3P0wgnihTsh4@lists.infradead.org
X-Gm-Message-State: APuU4Z+LjybTS/fSIc+p8KRheacW0g9FHSya7s8F5DjY8RSfh+ZeWupr
	fW6zlYPDOAmL7N0AnDYVwQyO87QizJcdnV/NBzq969dJzrh7IKF1RRw0pnWXVGeWDKMTPw0c05U
	9ckCKDbtJ
X-Gm-Gg: AYBFou1rPJe3fZ+NoMuZLxM1gghjVYMvDnAdDMYavuW3IXCU4Noz4jF1tEbjVy1EE4b
	YtkhZ+r1Lg1URH2yCyehTJm4JDr/kG8bSfb3Lb4gJ83ECXb94b8bWIVfwq2wJ9bYzsm9cdC3jek
	sdUGxvGoY+lT7ulwbfYI47sTuHt3k7hKzWHw7PTvrmRKLgU5Wq0SxPdhoLA7433F7YPgSK9rrlX
	JJJxnWCFqHQDQ7GoSGuO6cUnExOislhlfZbbQ7Al44LBlxM3njbcHMM9X5LnkwRTWXb7j5JtZDo
	p3hb0TRHjIqSklcoHlxNwY94SbAdzW3edzlzV0KeRO5pcuNj9dQVdNaCj75+7wPU3/Hr0sg7Fnw
	ZkiUKBSDaM4kDJ7afhr0O0SHRK7sl7FcTiFNSTuGiUgI3OHDHIQvecQ9UlkA0T44Ilu9e8xOJmf
	2fFBJrw+vIXFeSoTfOBjliOQjG2tD29XKzB389dCuf6KZiaZLC1gtNmWqhkZhXp0xZ59sYm5zGL
	kFEKqxaH03xMTRUjWJVdfbnaGGJdeBHhM2vpcTGCjHX3tWsrZArbKD6XWMFn5noUDYlQgLnDOYi
	OU9BcK6a/hEhihJsVifjeGNW71eCrND6Iw==
X-Received: by 2002:a05:600c:4ecd:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4bb5599a73fmr77020185e9.0.1794589979643;
        Fri, 13 Nov 2026 09:12:59 -0800 (PST)
Received: from jp-linux.Home ([2001:8a0:f59c:a900:b5a2:ed52:66a7:3ac7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm6001643f8f.12.2026.11.13.09.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 09:12:58 -0800 (PST)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	will@kernel.org
Cc: catalin.marinas@arm.com,
	andrew.jones@oss.qualcomm.com,
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
Subject: [PATCH v6 0/3] virt: bao: add Bao hypervisor IPC and I/O dispatcher drivers
Date: Fri, 13 Nov 2026 17:12:52 +0000
Message-ID: <cover.1794589639.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_091302_556050_56347428 
X-CRM114-Status: GOOD (  28.83  )
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
Built on v7.4-rc1 with GCC 15 (W=1) for arm64, arm and riscv (RV64 and
RV32), at every commit, and with clang 21 (W=1) for arm64 and riscv.
Run-time tested under Bao v2.0.0 on QEMU aarch64 virt and QEMU riscv64
virt with the bao-demos demos: the IPC driver exchanging messages in
both directions between a Linux guest and a FreeRTOS guest, and the I/O
dispatcher with a Linux backend serving console, network and block
device models to a FreeRTOS guest and to Linux guests, including
killing and restarting the VMMs, plus a userspace test of the /dev/bao
error paths (privilege, region and line checks, duplicate ids, limits,
completions, ioeventfd and irqfd rules) run next to the live VMMs.
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
 drivers/virt/bao/io-dispatcher/bao_drv.h      | 421 ++++++++++++++++
 drivers/virt/bao/io-dispatcher/dm.c           | 460 +++++++++++++++++
 drivers/virt/bao/io-dispatcher/driver.c       |  71 +++
 drivers/virt/bao/io-dispatcher/intc.c         | 186 +++++++
 drivers/virt/bao/io-dispatcher/io_client.c    | 475 ++++++++++++++++++
 .../virt/bao/io-dispatcher/io_dispatcher.c    | 184 +++++++
 drivers/virt/bao/io-dispatcher/ioeventfd.c    | 359 +++++++++++++
 drivers/virt/bao/io-dispatcher/irqfd.c        | 330 ++++++++++++
 drivers/virt/bao/ipcshmem/Kconfig             |  16 +
 drivers/virt/bao/ipcshmem/Makefile            |   3 +
 drivers/virt/bao/ipcshmem/ipcshmem.c          | 421 ++++++++++++++++
 include/uapi/linux/bao.h                      | 126 +++++
 22 files changed, 3323 insertions(+)
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


