Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360A5606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 17:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y1rd3jE0;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e+Aw7/2L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tuaICnb7sTsU3uMtAf1IdzJMLdxwJHMKKBVbfNsG8e0=; b=Y1rd3jE0hxEOLd
	EYhAzDxmyf5tZcfqMpFSdROrJZ8P4gWVJ1XR5uRVUHg65mothQaxGGIZfwaK4A2zRgq89MqxEIbx9
	8STFiFBkijl8VZ9IDwvn84Py4g0tq7rGHxY4inBYkEjwGD/BKZlQZnAvUIDOTW/ZfNpYjY0dUuOqJ
	MCGUcdHAyGcY4lI9qzbooocoZxR23ndQJ37UwJxIdAOp6853fKPJZhHzj7UG2TLrMtEYbw0kmhTvF
	gtvsla9g3TTjqwvmvmlFjJFWQcT3CmfYyAP5lwqnTasvgAU7KU7WNtydHHQ3HtFRqADhlYV7fgPcf
	L9jbEbLHQLVeqdqVKqSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5XE-0000000Clqn-1Di2;
	Thu, 19 Nov 2026 17:02:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5X9-0000000ClpA-2WlI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 17:02:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795107770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tuaICnb7sTsU3uMtAf1IdzJMLdxwJHMKKBVbfNsG8e0=;
	b=e+Aw7/2LZKdt7hvFQn2VmZ4pv2aU9pI9V5jda9Ip+lunG+IEWk/hYLmz7pff6pLh2IecYE
	Mb5ZkYG4AatANIMbX9JNlSWZQsYMgqEfPS+g26eHzmJxX9yPimF47XwgFg25VoGaf/7Rx9
	OShRVZ8cPyzxXTu+Fs4SlDyIAYvPdPA=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-uncc6HatOySM5Sf6MwhzFg-1; Thu, 19 Nov 2026 12:02:48 -0500
X-MC-Unique: uncc6HatOySM5Sf6MwhzFg-1
X-Mimecast-MFC-AGG-ID: uncc6HatOySM5Sf6MwhzFg_1795107768
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb8931aeeaso1450033a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 09:02:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107768; x=1795712568;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tuaICnb7sTsU3uMtAf1IdzJMLdxwJHMKKBVbfNsG8e0=;
        b=Sug9zswD4kUDQI/D2YGT3WcHWK83pHiO/pq+/i5k7IGlQtPi+3AKJRTjnYuHaTwPiO
         ghJbH0HNeZhhhF9SSfDHXGvvQdb8NDSZlpVK1RzYx3ROp2JpL52BiZbu02r0jkdLPdgw
         l1bY3ez4fHPeuMsgIBBBoLE9JRDp5Z0P/DCe4flQGHjq9rAfPnBusgPQxKYKKl9z4AWI
         zBkitCmkEkfjDT/J8RNeHKz9TNhaiW0XjtczXcolxDRWoOdySu51hgTo1O2+DKogP4qR
         SPxQQozEPAMA/gKBq8oJaCg2Pj33ibULFcZRye/AsbQ35AfkoL6+ePwWPQnMEX6ntZm3
         w6DQ==
X-Forwarded-Encrypted: i=1; AL+hErHkD9cvuyRNTC3ZJC8DXZl0GTpQzIOTQwUSfGdjojm8z48KCB0GQ8/hONjZN8WoLNPuEyZ+MyJgU8vTEGg1LVAU@lists.infradead.org
X-Gm-Message-State: APuU4Z8LtgVD6Mg0Yc6pKinxzaQwdGt4b8Zr6yRNoEUfHv4qYwpc/dJb
	Yla9RcpR+8MmkFauTKOPRCo+f7S7kz3I7kyELp6TdYuwxGwlc93xWOx2+L+e2RHzFMLnc7orojo
	GqcFpFO4WcGzOsRBoexTVuYJBYf4v/fJPYWYRk0da3ZQtbRFYRQf38/QKvqPl535hPi2uDFQHyG
	0kLa9oUmGu4DVJP/25P1ekgh38HlUG6elA6MR0znSF0yDzSZsn5j4=
X-Gm-Gg: AZFdTZchOwf5oMmu8mCS+/gcwiTpH6oIrzShwourLVYLqZki7Ofrz0qhbOoYkWPUMgN
	dqMUz6Ve64uvw7mqePdHAou2fh430yqzdBzkiDgNMga/DdPd+b6oNvXRwhR0owDgizl+4FbbN9z
	vcAxl0BaUnUAApA4ZhSxvNi8EPEW30VnidpFWiUmr67NmNXZ2AodBEVnKhjuO6U6ERjF5d/AxTW
	33MUoLbBhNjonExv6lsE+OozHJa9k2NGlJEL0ivNoyKxquc70IbK33JU1CO
X-Received: by 2002:a17:903:1c9:b0:2e9:6352:6c61 with SMTP id d9443c01a7336-2f03f15511fmr4875155ad.19.1795107767406;
        Thu, 19 Nov 2026 09:02:47 -0800 (PST)
X-Received: by 2002:a17:903:1c9:b0:2e9:6352:6c61 with SMTP id
 d9443c01a7336-2f03f15511fmr4874595ad.19.1795107766796; Thu, 19 Nov 2026
 09:02:46 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119125608.3939330-1-maz@kernel.org>
In-Reply-To: <20261119125608.3939330-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 19 Nov 2026 18:02:34 +0100
X-Gm-Features: AclHuK9gLqjDXNyNzrRYpnTsqE3NQnqKer4SP-4ZAj4I36D5tykUXBkj1PxU_-4
Message-ID: <CABgObfaXpZsZ32L7gkW1EhuYwt0mkwTueyW9=BDBpZr71NCmuw@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 fixes for 7.4, take #3
To: Marc Zyngier <maz@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Colton Lewis <coltonlewis@google.com>, 
	Dan Carpenter <dan@pereq.eu>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Michael Reeves <michael.reeves077@gmail.com>, Mostafa Saleh <smostafa@google.com>, 
	Myria Sarvay <myrialsarvay@gmail.com>, Oliver Upton <oupton@kernel.org>, 
	Vincent Donnefort <vdonnefort@google.com>, Will Deacon <will@kernel.org>, 
	Xuheng Li <xuheng@cs.columbia.edu>, Yureka Lilian <yureka@cyberchaos.dev>, 
	Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Gv8f7_yBjt1CMYC0-lMcPQexUZH5Cnw311dETgm8fvk_1795107768
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_090251_786158_55AB929C 
X-CRM114-Status: GOOD (  26.01  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 1:56=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote=
:
>
> Paolo,
>
> As promissed in my previous missive, I'm back with a few more
> presents...
>
> This round of fixes is mostly a Dan Carpenter special, as they seem to
> have hit the jackpot with some new formal analysis tool, and found a
> number of issues in NV. I am very surprised (/s).
>
> The rest is a bunch of pKVM fixes and workarounds for ugly hardware.

Pulled, thanks.

> I will be back next week same time for more of the same!

I can't wait for it!

Paolo

> Please pull,
>
>         M.
>
> The following changes since commit 181a701fc14d3d468c603b5ecfb9f12115c5fb=
72:
>
>   Merge branch kvm-arm64/misc-7.4-1 into kvmarm-master/fixes (2026-11-03 =
18:14:37 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kv=
marm-fixes-7.4-3
>
> for you to fetch changes up to 3385a832525527801012f5993d1f6a7a3d23092c:
>
>   Merge branch kvm-arm64/mmu-fixes-7.4-2 into kvmarm-master/fixes (2026-1=
1-19 11:16:29 +0000)
>
> ----------------------------------------------------------------
> KVM/arm64 fixes for 7.4, take #3
>
> * MMU fixes:
>
>   - Fix arbitrary truncation to 32bit when dealing with pool size
>
>   - Correctly order page pin refconting
>
>   - Prevent a HYP block mapping from being replaced with a table
>
>   - Fix NV Range invalidation by extending the boundaries to the
>     next block mapping
>
>   - Make sure the correct hw_mmu gets picked on the first run,
>     should userspace restore a nested context between init and
>     the first vcpu_load().
>
>   - Reject TLBI IPAS2E1 that fall outside of the S2 range
>
> * System register fixes:
>
>   - Correctly forward POE/PIE/TVAL EL2 register traps
>
>   - Add a sanity check for missing trap forwarding
>
>   - Correctly hide generic PAuth for pKVM protected guests when
>     the feature PAuth has been exluced from the feature set
>
>   - Make sure that HCR_EL2.NV1 is always RES0
>
> * Misc fixes:
>
>   - Flag Apple M3, M4 and M6 CPUs as having a broken vgic and
>     a wonky PMUv3 emulation.
>
>   - Correctly handle 64bit offsets into an MMIO region from
>     userspace
>
>   - Ensure that a vcpu is loaded when injecting an event
>
> ----------------------------------------------------------------
> Colton Lewis (2):
>       KVM: arm64: Force HCR_EL2.NV1 to RES0 unconditionally
>       KVM: arm64: selftests: Verify HCR_EL2.NV1 is RES0 when E2H0 is NI_N=
V1
>
> Dan Carpenter (9):
>       KVM: arm64: nv: Invalidate whole L1 blocks on TLBI RIPAS2E1
>       KVM: arm64: vgic: Don't truncate offsets in vgic_find_mmio_region()
>       KVM: arm64: nv: Initialize hw_mmu to NULL for nested vCPUs
>       KVM: arm64: nv: Forward PIR_EL2, PIRE0_EL2 and POR_EL2 traps
>       KVM: arm64: nv: Forward CNTP_TVAL_EL02 and CNTV_TVAL_EL02 traps
>       KVM: arm64: nv: Report EL2 registers with no trap forwarding
>       KVM: arm64: Load the vcpu in KVM_SET_VCPU_EVENTS
>       KVM: arm64: nv: Fix NULL dereference in kvm_pmu_nested_transition()
>       KVM: arm64: nv: Ignore TLBI IPAS2E1 above the IPA limit
>
> Fuad Tabba (1):
>       KVM: arm64: Hide generic ptrauth from protected VMs without ptrauth
>
> Marc Zyngier (3):
>       Merge branch kvm-arm64/misc-7.4-2 into kvmarm-master/fixes
>       Merge branch kvm-arm64/sysreg-fixes-7.4-2 into kvmarm-master/fixes
>       Merge branch kvm-arm64/mmu-fixes-7.4-2 into kvmarm-master/fixes
>
> Michael Reeves (1):
>       arm64: Apply existing Apple Silicon CPU workarounds to newer CPUs
>
> Mostafa Saleh (1):
>       KVM: arm64: Use consistent type for pool size
>
> Myria Sarvay (1):
>       arm64: Add CPU part numbers for newer Apple Silicon CPUs
>
> Xuheng Li (2):
>       KVM: arm64: Don't replace a valid hyp block mapping with a table
>       KVM: arm64: Order a later pinner's accesses after the hyp mapping
>
>  arch/arm64/include/asm/cputype.h              | 28 +++++++++++++++++++
>  arch/arm64/include/asm/kvm_host.h             |  2 +-
>  arch/arm64/include/asm/kvm_pgtable.h          |  2 +-
>  arch/arm64/kernel/cpu_errata.c                | 12 +++++++++
>  arch/arm64/kernel/cpufeature.c                | 12 +++++++++
>  arch/arm64/kvm/arm.c                          |  8 ++++--
>  arch/arm64/kvm/config.c                       |  7 +----
>  arch/arm64/kvm/emulate-nested.c               | 10 ++++++-
>  arch/arm64/kvm/hyp/include/nvhe/early_alloc.h |  2 +-
>  arch/arm64/kvm/hyp/include/nvhe/gfp.h         |  4 +--
>  arch/arm64/kvm/hyp/nvhe/early_alloc.c         |  2 +-
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         |  8 ++++++
>  arch/arm64/kvm/hyp/nvhe/page_alloc.c          |  6 ++---
>  arch/arm64/kvm/hyp/nvhe/sys_regs.c            |  4 +--
>  arch/arm64/kvm/hyp/pgtable.c                  | 10 ++++++-
>  arch/arm64/kvm/nested.c                       |  8 ++++++
>  arch/arm64/kvm/pmu-emul.c                     |  3 +++
>  arch/arm64/kvm/sys_regs.c                     | 39 +++++++++++++++++++++=
+++---
>  arch/arm64/kvm/vgic/vgic-mmio.c               |  4 +--
>  arch/arm64/kvm/vgic/vgic-mmio.h               |  2 +-
>  tools/testing/selftests/kvm/arm64/hello_el2.c | 15 +++++++++++
>  21 files changed, 161 insertions(+), 27 deletions(-)
>


