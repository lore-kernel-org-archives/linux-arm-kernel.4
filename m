Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D198B606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 05:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OakjnB+p;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gXDqhITJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eLmVTYOfswJ+cGfMoCZUFy1VK5TCu4veYLS+0REM4CM=; b=OakjnB+pUP5qwi4CYO+O4DwKKk
	pvpnfAY/V1REkjBRpzRBiLQIhSxxsJXCLJu50eue+AT9g25+KdHPEhG2pVlWitnpdCjw6tSVEPxVf
	LTB+C3sZBARC24I4uZVjk7NlRYAI4992fzVsaC3kl0lOZCfH/nsRRyj4DgazCeCV3+KwAUN2Nktbw
	bS/LOkl1GjWy7m3ly5Bcr7DrBl9+VlEQo3rg1M3Y4wtrhGz+x1idV+RJ+/cxxhz/bYDkhF2iFezmM
	61+ikWbztNXPSuR+77TeQZCLKy6iGKJ5VFeCHwQXUH8micNxxcMOsVo8E8udIF6gtxQeEGUI+HXGP
	SM2VOPWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR117-00000005fsF-31TB;
	Wed, 11 Nov 2026 05:37:05 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR114-00000005fra-0pzW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 05:37:03 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a359b714f8so21270045e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 21:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794375420; x=1794980220; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eLmVTYOfswJ+cGfMoCZUFy1VK5TCu4veYLS+0REM4CM=;
        b=gXDqhITJbQMkfj0LYTWciNSCN24yua84bpolJ86IFTFYY6ddWs+ay97itd8LtX4Rs0
         zWzZmr0J2kEGNBdO8ijJG1HrfRFj2mZ+ekZCnHjKaADgNYKcGFy46p9DpO4n4xVx2Icy
         InYzIQKut4sD8OJBuiZvewJmgEUMnnq/baH7FtndqMcSrvBPRTS7Kd5wARZLLA27Vhew
         dUOBYHTmQVyOcIG5vKpbidNsIPLNqPbZMhgIzrQCbURu8W3PixYDaTCg4Gl+i7GZ3G/j
         jUCIFuX8DzuqZV7IsEXwHkmKocOzfu2u8hG6B7c2l3jXIPILJgHcv5baTlxrgDgHuFv6
         0+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794375420; x=1794980220;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLmVTYOfswJ+cGfMoCZUFy1VK5TCu4veYLS+0REM4CM=;
        b=vmqKhDuap9afkU9X/3n3ZjHvHUymQWBCj5nIIogU1aItDpEYJHDlbE9zt2M9t0LVCi
         1rZMFx8DEwfaNvLVqSDYyNniDu0VY93osHj6wpwNXw1YYHSUdaQk1uITVTOUpIhuM5aF
         EjJwfaFNF/oyTdOYpZDLdNliDtiklidtkjkqN4b+oqiaxl33/T4xIfjrY4LQ69VOvaH+
         jo9SL1UidMUOv6mLdpPDvKzHPcVwSq+Fff9+nH+ZuVtM5GFK0E4cNpPlvhx/UtwM17fH
         I5bfmczABMkrkXLAlJougOrJh1BxCyUByTIbio4hbSdIqljT9MJLdYglj1YLgq4ml44I
         KtsQ==
X-Forwarded-Encrypted: i=1; AL+hErG6IDyi9S3g3HcJ8JDaQYPSo7zLN4jEd/SE6YzcfSWJtTERhWztaCWGX0uql131lwhc0mbR4vth29qqFzT5c4jj@lists.infradead.org
X-Gm-Message-State: APuU4Z+ZMEkQUqksnPVfdYY8OkBXVSp/UJprqO1WkEbhEgbRetwIkuVZ
	AmUOX3WVr3e/OGYJ2jaUZn0IKu1mKKdqVtiOLLjdMiRlj5uXk3MdyonTvMJ44XQgk896mQOAd7E
	f/5aH73ANnf/GhB1cGg==
X-Received: from wmsl10.prod.google.com ([2002:a05:600c:1d0a:b0:4a3:5d5b:9ad9])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:810c:b0:4a1:fbd2:f689 with SMTP id 5b1f17b1804b1-4ba09379cc1mr15865455e9.7.1794375419814;
 Tue, 10 Nov 2026 21:36:59 -0800 (PST)
Date: Wed, 11 Nov 2026 05:36:58 +0000
In-Reply-To: <DMRJJX2ZSYQT.2U1TTBGE7R4RA@soleen.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261110050202.529473-1-tarunsahu@google.com> <DMRJJX2ZSYQT.2U1TTBGE7R4RA@soleen.com>
Message-ID: <9huz5wy4q685.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v4 00/19] kho, liveupdate: Add feature header for
 fine-grained ABI compatibility
From: tarunsahu@google.com
To: Pasha Tatashin <pasha.tatashin@soleen.com>, Mike Rapoport <rppt@kernel.org>, robin.murphy@arm.com, 
	maz@kernel.org, will@kernel.org, David Matlack <dmatlack@google.com>, 
	Alexander Graf <graf@amazon.com>, seanjc@google.com, jgg@nvidia.com, loganodell@google.com, 
	arnd@arndb.de, dwmw2@infradead.org, baolu.lu@linux.intel.com, 
	Bjorn Helgaas <bhelgaas@google.com>, oupton@kernel.org, alex@shazbot.org, 
	gle.com@google.com, pbonzini@redhat.com, 
	Andrew Morton <akpm@linux-foundation.org>, kevin.tian@intel.com, joro@8bytes.org
Cc: kvmarm@lists.linux.dev, linux-pci@vger.kernel.org, 
	Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org, kvm@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	skhawaja@google.com, sagis@google.com, linux-arch@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_213702_296878_B351550C 
X-CRM114-Status: GOOD (  21.45  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

"Pasha Tatashin" <pasha.tatashin@soleen.com> writes:

> On Tue Nov 10, 2026 at 12:01 AM EST, Tarun Sahu wrote:
>> This v4 of feature flags support for LUO and KHO is no longer an RFC.
...skip
>>
>> Each serialized structure is preceded in memory by struct kho_ser_hdr
>> and registered via DECLARE_KHO_SER(name, payload_size, nr_required,
>> nr_optional). Both struct kho_kexec_metadata and struct pci_dev_ser are
>> explicitly marked with __aligned(8) because their largest member is a
>> 32-bit integer, and 8-byte alignment is required by DECLARE_KHO_SER() so
>
> I do not believe we need __aligned(8), because the struct immediately 
> follows the newly introduced kho_ser_hdr, which is 8-byte aligned. 
> However, we should verify that the combined size (header + payload) 
> is 8-byte aligned.

Yes, we can check total size alignment and remove the __aligned(8). I
will update it.

~Tarun

>
>> trailing feature payloads remain 8-byte aligned across 32-bit and 64-bit
>> kernels.
>>
>> Also, Introduce DECLARE_KHO_SER_HDR(ser_name, fhdr) which is just the
>> wrapper for struct kho_ser_hdr fhdr, This makes it clear
>> To which ser_name, this fhdr belongs to.
>>
>>
>> Series structure:
>>   - Patch 1 removes __packed from KHO, LUO, and memfd ABI structures and
>>     asserts their natural size and 8-byte alignment under CONFIG_64BIT.
>>   - Patch 2 records entry_size in struct kho_block_header_ser so the
>>     incoming kernel derives the entry stride from the block header.
>>   - Patch 3 converts callers that embedded struct kho_vmalloc by value
>>     (memfd_luo and test_kho) to reference it via DECLARE_KHOSER_PTR so
>>     struct kho_vmalloc can grow independently.
>>   - Patch 4 converts struct luo_session_ser to reference
>>     struct luo_file_set_ser via DECLARE_KHOSER_PTR instead of embedding
>>     it by value so both structures can grow independently.
>>   - Patch 5 introduces struct kho_ser_hdr, DECLARE_KHO_SER(),
>>     DECLARE_KHO_SER_HDR(), and the serialization/validation helpers in
>>     include/linux/kho/abi/feature.h.
>>   - Patches 6-18 add the feature header to each of the 13 KHO, LUO, PCI,
>>     and memfd serialized structures in independent patches.
>>   - Patch 19 adds a KUnit test suite (kho_feature) covering the feature
>>     header helpers.
>>
>> [1] https://lore.kernel.org/all/20260903023452.721732-1-loganodell@google.com/
>> [2] https://lore.kernel.org/all/20261021152527.375070-1-tarunsahu@google.com/
>> [3] https://lore.kernel.org/all/20261026174217.603114-1-tarunsahu@google.com/
>>
>> Tarun Sahu (19):
>>   liveupdate, kho: Remove __packed from KHO, LUO and memfd ABI
>>     structures
>>   kho: block: Record the entry size in the block header
>>   kho, memfd_luo: Reference struct kho_vmalloc via serialized pointer
>>   liveupdate: Reference struct luo_file_set_ser via serialized pointer
>>   kho: Add feature header for fine-grained ABI compatibility
>>   kho: kexec_metadata: Add the feature header
>>   kho: vmalloc: Add the feature header
>>   kho: block: Add the feature header to blocks
>>   liveupdate: Add feature header to struct luo_ser
>>   liveupdate: Add feature header to struct luo_session_ser
>>   liveupdate: Add feature header to struct luo_file_set_ser
>>   liveupdate: Add feature header to struct luo_file_ser
>>   liveupdate: Add feature header to struct luo_flb_header_ser
>>   liveupdate: Add feature header to struct luo_flb_ser
>>   PCI: liveupdate: Add feature header to struct pci_ser
>>   PCI: liveupdate: Add feature header to struct pci_dev_ser
>>   mm: memfd_luo: Add feature header to struct memfd_luo_ser
>>   mm: memfd_luo: Add feature header to struct memfd_luo_folio_ser
>>   kho: Add KUnit test for the feature header helpers
>>
>>  MAINTAINERS                            |   1 +
>>  drivers/pci/liveupdate.c               |  99 +++----
>>  include/linux/kexec_handover.h         |  15 +-
>>  include/linux/kho/abi/block.h          |  21 +-
>>  include/linux/kho/abi/feature.h        | 372 +++++++++++++++++++++++++
>>  include/linux/kho/abi/kexec_handover.h |  11 +-
>>  include/linux/kho/abi/kexec_metadata.h |  17 +-
>>  include/linux/kho/abi/luo.h            | 102 ++++---
>>  include/linux/kho/abi/memfd.h          |  27 +-
>>  include/linux/kho/abi/pci.h            |  66 ++---
>>  include/linux/kho_block.h              |   8 +-
>>  kernel/liveupdate/kexec_handover.c     |  98 ++++---
>>  kernel/liveupdate/kho_block.c          | 172 +++++++++---
>>  kernel/liveupdate/luo_core.c           |  43 +--
>>  kernel/liveupdate/luo_file.c           |  58 ++--
>>  kernel/liveupdate/luo_flb.c            |  69 +++--
>>  kernel/liveupdate/luo_internal.h       |   9 +-
>>  kernel/liveupdate/luo_session.c        |  55 +++-
>>  lib/Kconfig.debug                      |  13 +
>>  lib/test_kho.c                         |  38 ++-
>>  lib/tests/Makefile                     |   1 +
>>  lib/tests/kho_feature_kunit.c          | 184 ++++++++++++
>>  mm/memfd_luo.c                         | 183 ++++++++----
>>  23 files changed, 1271 insertions(+), 391 deletions(-)
>>  create mode 100644 include/linux/kho/abi/feature.h
>>  create mode 100644 lib/tests/kho_feature_kunit.c
>
> -- 
> Pasha

