Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061BA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 22:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RpPJ4vym;
	dkim=pass (2048-bit key) header.d=multikernel-io.20260707.gappssmtp.com header.i=@multikernel-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=PoNQgnkn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=/qBJIF/fG008hkLQDdrwJijKEDazNa27+pO/aXF7gs8=; b=RpPJ4vym32Rq5ss2ruUJnTgX2g
	Qr080muYnJl+6K8W4sXpZeJYsu7rS+4ZiOhbitO4iZrTp6X7u/FMOrSrJrsFfncLeHFGnvW6FpxYF
	0LlFJYc58v1R4QpDlu+oEdLYpnkjGLd2Tz2AA2cHRLHQ3vntIwREoQZwg3YtLgkmwoH54FaYVQOpO
	gl7MDcMC5KalgM1JmPB838dQu0LIyOQG2xYplJHwfb91NZuHz2aMkBxCL5yzYBsL++gRl/hgo/GLd
	+2KVhHqzqpGr7OHFR2ONlnyHc22bDUcQXMIc+qm6HDD7msrxF3SYl7dL6mNQSwpodDTUTkPF7zEIS
	NggJjTEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRwI-00000007FnC-2Pl7;
	Tue, 17 Nov 2026 22:46:10 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRwF-00000007Fmo-40HJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 22:46:09 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8a058315c79so165896b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 14:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=multikernel-io.20260707.gappssmtp.com; s=20260707; t=1794955566; x=1795560366; darn=lists.infradead.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qBJIF/fG008hkLQDdrwJijKEDazNa27+pO/aXF7gs8=;
        b=PoNQgnkn/3kzFWmMoGc5qO9j0Qn8pZfD67K7BYSJqBENRKI0ZCPuWkRFcBQH/M3h8S
         uR0smRRnAVxtFQ1r+/zbFERIuLdXnnbWCeovVqLX9tfFloBLmA5h4tZel+UvMpQCx1WA
         bNBkMRxi20qdwN3r1r2USZLFTkPoMSfw98cXJM9h/fiXlEVb9viy+ZldzRv1Etts/WYI
         vasmKJYIUXhcRR73xO7t9BHZvapzOSJMUVfr/4UGzpNosnjUX9hRKjLUdwj7m+8u/DfE
         DsRg/EyLRxCjoS0Pt6IRX2Ib1p4QSkv4FNQ87oiryFVxprphx2lNfjFTo6+Y0j5xITEi
         /BBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794955566; x=1795560366;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qBJIF/fG008hkLQDdrwJijKEDazNa27+pO/aXF7gs8=;
        b=dyJn6GBcro+0zXmf8pAU8FHrK9hMfOBNNgJUhwYQ15qmHLnKC5TPsP+RucxAWdMtKy
         GwotQLYFW8ZwU0FxakQHjvpST5DglSLbO/qexsIOVaqdq1cH6zh9tDeTNppFBiIbE1Nc
         X2CJGcTqlGB2Aa/XcIC/z8xgGOIrNnc5BBwhHvNRSsk//wEjEIYTHWvMyiJnoaIvQiak
         yVK+SEwKYEGbjBx68wshRqHPECDj2JB1rwChpP+UJDBosbEeXNGfGlsLPFZdJJhzHh0Y
         KdLrsOE0Llc0xErDP+u1ziYUm6Uho7HYQLXf700TjLb4CWWgLmFFA4X1+A/Xk4onbnRC
         HoXg==
X-Forwarded-Encrypted: i=1; AL+hErGGVtSN3TudGuP8JWMtbQHguTwqgiUiauXTCN0n2zeNnyOakIW3ivmV8cQ7MnTjyhFqi4ucTM20+Eq7qVIXkKTF@lists.infradead.org
X-Gm-Message-State: APuU4Z+sAgYjaJPDgoLhmiKt3zZh520v09dmHYsPgpe339Ah+jAv9UMc
	EfvKZ3RP4x9YE0w4N8+ALcpDW2mQvQKl6C3kAq0c7eZEH2wK5g0IHWKXGQyB79f/F0g=
X-Gm-Gg: AYBFou3hssd9HH7bhW1ocggN9A5qot5eNOoixO6idIhDC4hleuoWowYKjBObiwfOhgF
	p9OjjvsGNzid+H4rARmwBdJDxTMYZWxR36An7433TU2tgxRiw4JituTBCJaQEq2eg3AdjqRDVXT
	f/FYMMCs9LNSPrlXt75bqyimocTIl61Y/uxssj8r4759jGic7qgFTTXrIALEzml/k1nj63JIwsv
	ZqkV6mT+Y4xw+nuJ7A1HmTWU/aFa8evhV7jzf+jX21XqjPm5VGOuLpi0C3n3ljmkLj2eCG0sgs/
	6nTR7Q33a0SO0YeWtfatLUZF0qVAvBkTUzc+fdPktTvu9fUO997oLSIynxHsU39QqaFdksaau4C
	pnFI7LwObJIdm2Mt9bDsozUVYDrNWSnSV6fnuOJVVubJx0sI6PIUb/CzN3G6dLj8sHk8qlENPPj
	jcfU6Y/hpPOCK5OG+S3+QMGeqWUjDKiF9nZxELnB3byt8diGnLXWcPuHFVQC6+FwzZMsbtG4PDZ
	F6+PfXS1VB8nVyjrUk57+B12vKYPffME4TJcYnK7OmyNCjr1dlhrqTNRgOM0jz+GYkFm/hH9Vl9
	KHPS7i7t4+DPCKXhqO5tfArKSEtlYrNEVTCEeBBhC3d5NfO503MEpEfadkM758E=
X-Received: by 2002:a05:6a20:3d19:b0:3fb:5183:5e27 with SMTP id adf61e73a8af0-3fe86bdb958mr889308637.9.1794955566341;
        Tue, 17 Nov 2026 14:46:06 -0800 (PST)
Received: from localhost ([2601:647:4084:777d:a912:5690:58ab:9eb1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde3c7b3105sm119772a12.30.2026.11.17.14.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:46:05 -0800 (PST)
Date: Tue, 17 Nov 2026 14:46:04 -0800
From: Cong Wang <cwang@multikernel.io>
To: linux-kernel@vger.kernel.org
Cc: multikernel@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [ANNOUNCE] mklinux v7.0-mk5: multikernel Linux, now on arm64
Message-ID: <avzZLLKSZIlqAjag@pop-os.localdomain>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_144608_105544_BEC61B9F 
X-CRM114-Status: GOOD (  21.36  )
X-Spam-Score: 0.1 (/)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi all,

mklinux v7.0-mk5 is out. mklinux is an out-of-tree branch of Linux that
lets one machine run several Linux kernels side by side without a
hypervisor. A host kernel sets aside a pool of CPUs, memory and PCI
devices, loads another kernel into it with kexec_file_load() and starts
it on those CPUs. Each kernel then runs natively on its own share of the
machine. The kernels talk over shared-memory rings and IPIs, which carry
a console, AF_VSOCK and PCI config space access, and a kernel can take
the whole machine over from its host, which is what kernel upgrade and
crash recovery are built on.

This release is 114 patches on top of v7.0-mk4, and the tree is 330
patches on top of v7.0.

What is new
===========

arm64
  Multikernel now runs on arm64 as well as x86_64. CPUs are started,
  confirmed off and released through PSCI. An Image is loaded with
  kexec_file_load() and boots from a device tree the host builds for
  it. A spawned kernel is a tenant of the GICv3: it leaves the
  distributor and LPI setup to the host and initialises only the
  redistributors and CPU interfaces of its own CPUs. It gets PCI
  devices only, with MSIs routed through whichever host ITS serves the
  device. A kernel is forced down through SDEI event 0 where firmware
  has it, which reaches a CPU that has every exception masked, and
  with the stop IPI otherwise. arm64 memory hot-remove learned to
  split or refuse a partial removal of a linear map leaf and to free
  the page tables and vmemmap it empties.

Device leases and DMA confinement
  A PCI function lent to another kernel is held on the host by a stub
  driver, as vfio-pci and xen-pciback do, and everything the host sets
  up for it hangs off one lease. Its DMA is confined through the IOMMU
  to the memory of the kernel that drives it, on arm64 (SMMUv3) and on
  x86 (VT-d), and follows that kernel's memory as it grows and
  shrinks. The function is reset while still confined when the lease
  ends.

VT-d
  The host leaves alone the units another kernel drives, lends each
  spawned kernel a block of interrupt remapping entries and checks
  every entry written into it. A kernel that took the machine over can
  claim the units of its fenced host without turning translation off.

Chained takeover
  A kernel that took over from its host becomes instance 0, can online
  the memory it adopts as kernel memory, and can arm and hand over to
  a successor of its own, any number of times. On x86 parked CPUs no
  longer wait on slots owned by one kernel: there is one park table
  for the machine with a cell per CPU, so any kernel can find and wake
  a parked CPU, as PSCI allows on arm64.

Messaging
  Each parent/child pair has its own rings, so a kernel that dies in
  the middle of a send can only wedge its own link.

Console
  A spawned kernel can be handed the host's screen as a
  simple-framebuffer, for machines reached only through a BMC's remote
  KVM.

ABI change
==========

The multikernel flag and the instance id moved to the upper half of the
kexec_file_load() flags, as KEXEC_FILE_MULTIKERNEL (0x80000000) and
KEXEC_FILE_MK_ID_MASK (0x7fff0000). The old values collided with
KEXEC_FILE_NO_CMA and KEXEC_FILE_FORCE_DTB. A loader built against
v7.0-mk4 or earlier has to be rebuilt; kerf 0.5.0, the user-space tool,
uses the new layout.

Getting it
==========

  git:      https://github.com/multikernel/linux.git, tag v7.0-mk5
  release:  https://github.com/multikernel/linux/releases/tag/v7.0-mk5
  kerf:     https://github.com/multikernel/kerf/releases/tag/v0.5.0
  docs:     Documentation/multikernel/ in the tree

The release page has the full change list and deb and rpm packages for
x86_64 and arm64, built with the Ubuntu 26.04 generic config plus
CONFIG_MULTIKERNEL=y.

Known limitations
=================

- An arm64 instance gets PCI devices only, no platform devices, since
  every SPI goes through the one GIC distributor, which stays with the
  host.
- An arm64 spawn has to boot with pseudo-NMIs
  (irqchip.gicv3_pseudo_nmi=1) so that the host can stop it when SDEI
  is not available.
- The prebuilt packages have no debug info, hence no BTF, and are not
  Secure Boot signed.

Testing, bug reports and review are all welcome, on the list or in the
issue tracker at https://github.com/multikernel/linux/issues.

Thanks,
Cong

