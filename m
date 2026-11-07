Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488E7606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 08:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tCWRJ//D;
	dkim=pass (2048-bit key) header.d=osyx-tech.20260707.gappssmtp.com header.i=@osyx-tech.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=l7KEWUp7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=A1W69Jj0cuHW+VrCPTPexg9wdW+N2t/lSjby8/XmkVs=; b=tCWRJ//DVQpuC78yYeh+r+lNKu
	vYjB3E99gD6agLHFm2VukCYjuZlBVL55IsEcH8o6EcLc3qybWohkqhqlVgNh9yIsqx//HA1H9cuiD
	U1E/E/wGjxWKOqI5NYc0i4u6quFHer2vBWb4urHiryuq3wTELtnrErMxu5eTcl1jhX93hZbhaVuh3
	oklsx5MQz74t6UyF7L7gmoEhlm4ZjAfYr+miHFhFO1G9ccMpPyyfrvnNlhhSP073/wWHzTONqmFMl
	bNcLQ8nnLOaCTXnND50pkL4aIr39RDAMOpgEGBz6Msqbwf2byTljPT21Xo7lCOG+x03HX5NBIBOju
	pePzz9Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPbSC-0000000ELnc-18WP;
	Sat, 07 Nov 2026 08:07:12 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPbS8-0000000ELm8-2hjz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 08:07:11 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so12266415e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 00:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20260707.gappssmtp.com; s=20260707; t=1794038825; x=1794643625; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A1W69Jj0cuHW+VrCPTPexg9wdW+N2t/lSjby8/XmkVs=;
        b=l7KEWUp73vRvPr67IK1BS++BTna/I5sUatakoCg591woUv+dWdfUtpBLwzs1RWLLdr
         KtM45mC9cg62/EuNgKS9hyNLx+IS/qoLx0ihCsm/W0DET1oqoByrzvASza0lj04MlMsR
         3gW0mP7cVhmqkc99RH7w4fgn4lAMiUAx9cgSYAiz581ewvev6DxK1b/74N7+u0Fy5dYx
         x6MLG3ctQrWezHgypRNH7NftA1UuSCEek0JwyAnWz85dvGbEjbVpPFWyl1rSHyVZCfGg
         grTjhMk+mA+B8rdAg/UPalQNxx6KnF438jZYab9pklYnIrAELorrrIo+96NrFL48wiIY
         vetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794038825; x=1794643625;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A1W69Jj0cuHW+VrCPTPexg9wdW+N2t/lSjby8/XmkVs=;
        b=UZIGLxBgMMVR+FBunTWq3CWRKqrewifyoalBdX+snL/yYQkpvZBWCLQgBHVRfHHpI7
         nt/AIQYArdOLDWpraw0CzUHZmyVBP+eNbBQX+FPoLSpTX3/V8T3ddVq4bHzphrpRKRlR
         YXCZmpsT8ZD3Q5tDepssWxnpux2fbTd+dxkoSZBKXm0yBRwpuvnNVntRHqKceVQrsgzq
         v4HEKJ/fN61HHwvKlinpOG19uY0N/SP52IcJCTGV4JNu5O6ibbVAg6faMEbxsoI55WU4
         m/lxy3Ll3Df6SE8zqqxu1/Pl4f2aJ1DD/dl5hYNdfoasXTkKN/QLbK7foGwLGKy0jJN/
         DqZA==
X-Forwarded-Encrypted: i=1; AKwUvBxDgu3bjGhjrqG8FlLeg8/JfzVl7M0eBKQCtYmgm9qDdTHI+IKkvCh7KQ6oNUE8wMBdWC5OEj/IKp1CU1eOH0X2@lists.infradead.org
X-Gm-Message-State: APuU4Z9nz/64DIUSeOpdFFeJ6L0Hofvp5GEpZw7FnzoajtpLd9gn4ofg
	7D2sh4HXHRK/d78WCcb7zvYKJw1ewc6eEkmyk6O+GBZveVmKcdp7I3R4bJa915cfQjn/
X-Gm-Gg: AYBFou0SGg2QEWlbi4ouZJAspkusa56oR3dgeIkUpbOGz87mnh8NkXbtI+DEXAqNqig
	RXntioKw8MgYpukAfmE9sxgancC4mS0wc2ZKixAhZMnMsk4VH61OgO/LmG0VAEjzz3cyoMZr+TO
	rceF4nYz6zCDjKZo/F8k1Nceh6mLLJ+mN4pEGag5IybdfaaaWjN0ZHnWpcxmn4Ag9RQj48EE77h
	tjTCoLhWPuzx8sCyXBjE5B5EN8VGWySY1HxLi54Sr2xbW/yCzVxnz+NCbNIoCfLaTB1c3IZlVfw
	5dcUVx/F23v90lFOhAZDsbsTkobjT90h3/RNVIaB39K9OD4bOCt4B6yxNXERdrIWL2D4K/lm6ZG
	Mt2QR9bj9E3JqoO376SueVK1qWrGQYvJuS5Pz7dSDvsmTpAk8+hjLkRYCtFnom/e9dmMdDJAPD9
	2qdTSbQlH+tyuB8aqHNIFIPjmQhk3/JY+Xg4v7ZhIt89xIWBuIjtbDIiUzTIrtmwU9JJdjAlvXV
	QqBNGWgVRKOcQebjHMzSt8v1Z9qfyKDHlaMQFzooH2JcwoEpIycILCYGX9gBMXj7J95iLWhDERg
	mltOeu/lPAsb/V17epxh8G9WgPB2xw6Q5PUq7jJKAkZO6a/N4fY=
X-Received: by 2002:a05:600c:310e:b0:4af:9cae:df63 with SMTP id 5b1f17b1804b1-4b6dfbac4c3mr81654205e9.31.1794038825053;
        Sat, 07 Nov 2026 00:07:05 -0800 (PST)
Received: from jp-linux.tailbfef0e.ts.net ([2001:8a0:f59c:a900:ea06:fa16:f0a0:9d64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e327a652sm43927455e9.7.2026.11.07.00.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 00:07:04 -0800 (PST)
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
Subject: [PATCH v5 0/3] virt: bao: add Bao hypervisor IPC and I/O dispatcher drivers
Date: Sat,  7 Nov 2026 08:06:49 +0000
Message-ID: <cover.1794038390.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_000709_007322_457A7829 
X-CRM114-Status: GOOD (  30.26  )
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

Changes since v4
----------------
All findings of the Sashiko review of v4 are addressed:
- creating a device model (BAO_IOCTL_CREATE_DM) requires CAP_SYS_RAWIO,
  is refused under lockdown, rejects shared-memory regions overlapping
  System RAM and claims the region with request_mem_region(), mirroring
  /dev/mem;
- the notification line is requested exclusively and is checked against
  the sources the interrupt controller declares before it is mapped,
  since irqchip drivers trust the specifiers they are given (a PLIC
  line above riscv,ndev wrote out of bounds). Its mapping is not
  disposed when request_irq() fails, though: irq_create_of_mapping()
  returns the existing mapping of a line that is already mapped without
  counting its users, so disposing it would free the interrupt of
  whoever owns the line. A leftover mapping is reused when the line is
  mapped again;
- a request that cannot be delivered is completed and fetching goes on,
  so pending requests are no longer stranded;
- the ioeventfds and irqfds of a device model are bounded (256 each) and
  their flags validated; requests still queued when a client is
  destroyed are completed back to the hypervisor;
- the IPC driver registers its devices only once every channel has been
  parsed and mapped, and never unwinds a device it has registered.

Other changes:
- the requests handed to the VMM are tracked: a completion must name one
  of them and only provides its value, so userspace can no longer pick
  the hypercall operation (an ASK lost a request), and the requests a
  VMM leaves behind when it exits are completed on release;
- a device model id can only be bound to one file descriptor at a time;
- RISC-V: the hypercall status is taken from the SBI value (a1), where
  Bao returns it, not from the SBI error (a0), which is always 0; a
  failed hypercall was taken as a success. Both drivers depend on
  RISCV_SBI, so M-mode kernels no longer fail to build them;
- mmap goes through .mmap_prepare and only shared mappings are allowed;
  .compat_ioctl is set, the structures having the same layout for 32-bit
  userspace; DM_GET_INFO and IO_CLIENT_ATTACH are _IOR; the ioctl table
  reserves 0xA7 00-0F;
- bao_ipcshmem.channels= is documented in kernel-parameters.txt;
- rebased on v7.4-rc1.

Changes since v3
----------------
The two design comments on v3 changed the shape of the series, which
went from six patches to three.

- No device tree (Krzysztof Kozlowski): both bindings and the "bao"
  vendor prefix are dropped. The IPC channels are a software contract
  between the hypervisor and the guest and are declared on the kernel
  command line (bao_ipcshmem.channels=...). The set of device models a
  backend serves is a contract between the hypervisor and the VMM, so,
  following drivers/virt/acrn, the I/O dispatcher exposes a single
  /dev/bao control device and the VMM creates each device model with
  BAO_IOCTL_CREATE_DM (shared-memory region + notification line), which
  returns a per-DM file descriptor; the DM lives as long as the
  descriptor. The notification line is resolved against the device
  tree's root interrupt parent, like any device's interrupt.
- No architecture code (Will Deacon): the hypercall helpers live in
  drivers/virt/bao/bao_hypercall.h and use arm_smccc_hvc() for the IPC
  hypercall and, because the Remote I/O hypercall returns the request
  in x1-x6, the SMCCC v1.2 arm_smccc_1_2_hvc(). RISC-V uses sbi_ecall()
  for IPC and a local ecall for Remote I/O (see open items). 32-bit Arm
  has no SMCCC v1.2 helper, so the I/O dispatcher is limited to arm64
  and RISC-V for now; the IPC driver still supports 32-bit Arm through
  SMCCC v1.1 (HAVE_ARM_SMCCC).
- The standalone "consolidate the IPC hypercall ID" patch is folded into
  the driver patches (Andrew Jones).
- All findings of the Sashiko review of v3 are addressed. Details are in
  the per-patch changelogs.
- The ioctl type is 0xA7: 7.3-rc1 registered 0xA6 for memory allocation
  profiling.

Testing
-------
Built on v7.4-rc1 with GCC 15 (W=1) for arm64, arm and riscv, at every
commit, and with clang 21 (W=1) for arm64 and riscv. Run-time tested
under Bao v2.0.0 on QEMU aarch64 virt and QEMU riscv64 virt with the
bao-demos demos: the IPC driver exchanging messages in both directions
between a Linux guest and a FreeRTOS guest, and the I/O dispatcher with
a Linux backend serving console, network and block device models to a
FreeRTOS guest and to Linux guests, including killing and restarting
the VMMs, plus a userspace test of the /dev/bao error paths (privilege,
region and line checks, duplicate ids, limits, completions) run next to
the live VMMs. 32-bit Arm is compile-tested only.

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
 drivers/virt/bao/bao_hypercall.h              | 205 ++++++++
 drivers/virt/bao/io-dispatcher/Kconfig        |  20 +
 drivers/virt/bao/io-dispatcher/Makefile       |   4 +
 drivers/virt/bao/io-dispatcher/bao_drv.h      | 401 ++++++++++++++++
 drivers/virt/bao/io-dispatcher/dm.c           | 438 ++++++++++++++++++
 drivers/virt/bao/io-dispatcher/driver.c       |  71 +++
 drivers/virt/bao/io-dispatcher/intc.c         | 186 ++++++++
 drivers/virt/bao/io-dispatcher/io_client.c    | 430 +++++++++++++++++
 .../virt/bao/io-dispatcher/io_dispatcher.c    | 173 +++++++
 drivers/virt/bao/io-dispatcher/ioeventfd.c    | 350 ++++++++++++++
 drivers/virt/bao/io-dispatcher/irqfd.c        | 321 +++++++++++++
 drivers/virt/bao/ipcshmem/Kconfig             |  16 +
 drivers/virt/bao/ipcshmem/Makefile            |   3 +
 drivers/virt/bao/ipcshmem/ipcshmem.c          | 421 +++++++++++++++++
 include/uapi/linux/bao.h                      | 126 +++++
 22 files changed, 3202 insertions(+)
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


