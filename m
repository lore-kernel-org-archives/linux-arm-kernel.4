Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BDE606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 17:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eQ5euQyV;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TqGwm8lK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+yZhs6ZDC6QJyZznmfCr4E8e0ia6+c834e+dfc1J9VY=; b=eQ5euQyVMwfLWX7ID8o8m+eis3
	N+bCW5aDaRV9C4nAH1XNTi6d2sVwxqoqiLyQoX6HEUx9j3TzeKYkdixTV3sYMbkpZ9pEtUeQHYCAW
	CCs4BnvyRxV+tnCg8xm1QDAeBiXEiFhtiEyOUK0LTy6prqpsnYKpjswmJes89DioPVC/Rhl4OGatm
	eTdnuGm2/uKdkY8vrh31p3V85UK/CeSuDnAKvoOTGSwa1vLCougd/pn769rq+AHlcCLzaPEzFOJVJ
	we6euWbq2TanfoY54CLE/uNdeNUJvQoKFzhMxsIDj5T2qxZA30Qv8nZRfIwFBsiyKH/qCSL/+wa+A
	amiMCdJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpdt-00000004gS4-2uKx;
	Tue, 10 Nov 2026 17:28:22 +0000
Received: from mail-ej1-x646.google.com ([2a00:1450:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpdq-00000004gR8-2aHh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 17:28:19 +0000
Received: by mail-ej1-x646.google.com with SMTP id a640c23a62f3a-c505f26e9e1so55121866b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 09:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794331696; x=1794936496; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+yZhs6ZDC6QJyZznmfCr4E8e0ia6+c834e+dfc1J9VY=;
        b=TqGwm8lK5Zm54NX4hkmxfG6RshGdyy3ltddo9MUck8Q3FKv+/gf/AoO+aZT2Q8aoBO
         osWKmXJcj1P4WS2H8ZXw0UOxiGvK3/iMd7tZ7AYbg6INlMJ9MzWPAJhdNePPNNcF4ntk
         cpfchFs1rOFBgBHnwz1v7VN1qB37LynGETqYbpOxqDlZVCX6Z2xECx0IOQqW/AKroM9B
         gK2kQwgPiWkM+8Vv6K4f+u7tooobFJehAzH88miolENH472W51gs3iCV1YsIeqVH3U4n
         XPj6nKSbvRujfgkkclqTv21e29UtE9TPnsBo6s3d0Y316pgZv6tBMYxyqyVkszxQVPe8
         Qkkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794331696; x=1794936496;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+yZhs6ZDC6QJyZznmfCr4E8e0ia6+c834e+dfc1J9VY=;
        b=Ugl/vXThIXpi7YHubcPvsOrcK75ElGgD8hoc7sOC8MLyqms+38BrREbXUJ31a3zdm2
         bt/xB7D88SSrxI+RsneyPcoNDvcFjA2iHSwhp2G13WVky8gAIsNxRNv9J2mlLkXDf35D
         pU8raehEQc9kQnN/sHC8fDhQ81IdtVvEbb/glKR1fJZaL5NHtVZ3qiQmWUFihHQALv2D
         fg/muFrce58pR2GFU0fJVW6/t38Hfw4JowDR1Tm1uHOvU3NNQqxjPtsv0yqr1c+4J3vh
         SoztotKhUQCBq/3aL+u4huz21UfhgJ2OqIPpRZ8eylDUL4ZpbQNT5f8EGp0oDXi2kD9w
         ZyNA==
X-Forwarded-Encrypted: i=1; AL+hErEGmuxMPhdp15ZOlPKGsuO8Vcs+MVQg4oUlWrsRGMUu5vbJ1Ancf7C1sCDCIrvNKGGrJw7ZN7R/XBvrb1biijme@lists.infradead.org
X-Gm-Message-State: APuU4Z92wUrBMxwfos7IKJd8X4Sv/i5JhfYIYR6cB1stbSPM7r3HJtkv
	0oDuQnrXI74RwV1aqs1FYvNXH4Dl18ASUFfVzSgQv/AMfkjX6sqLnWbim8EQn49cwEf+/qAsHLe
	oAMo0b6vUP80a4A1PjA==
X-Received: from ejrk24.prod.google.com ([2002:a17:906:6818:b0:c46:7e9b:6a1c])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:dc91:b0:c41:1781:a2af with SMTP id a640c23a62f3a-c506338c761mr23579166b.9.1794331695882;
 Tue, 10 Nov 2026 09:28:15 -0800 (PST)
Date: Tue, 10 Nov 2026 17:28:14 +0000
In-Reply-To: <DMRJQ42LR1D3.1GZKU9EX48KZU@soleen.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261110050202.529473-1-tarunsahu@google.com> <20261110050202.529473-2-tarunsahu@google.com>
 <DMRJQ42LR1D3.1GZKU9EX48KZU@soleen.com>
Message-ID: <9huzbj7wtx3l.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v4 01/19] liveupdate, kho: Remove __packed from KHO, LUO
 and memfd ABI structures
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
X-CRM114-CacheID: sfid-20261110_092818_692249_23D60D14 
X-CRM114-Status: GOOD (  26.69  )
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
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

"Pasha Tatashin" <pasha.tatashin@soleen.com> writes:

> On Tue Nov 10, 2026 at 12:01 AM EST, Tarun Sahu wrote:
>> All structures in include/linux/kho/abi/block.h (struct
>> kho_block_header_ser), include/linux/kho/abi/luo.h (struct luo_ser,
>> struct luo_file_ser, struct luo_file_set_ser, struct luo_session_ser,
>> struct luo_flb_header_ser, struct luo_flb_ser) and
>> include/linux/kho/abi/memfd.h (struct memfd_luo_folio_ser, struct
>> memfd_luo_ser) have naturally aligned fields on 64-bit architectures,
>> with no padding holes between fields or tail padding. Assert both the
>> structure size and 8-byte alignment under CONFIG_64BIT at compile time.
>> Any future unaligned field addition should come with reserved field to
>> keep the structure aligned.
>
> Just state:
>
> Remove __packed, as it may break natural alignment. Instead, ensure that 
> all padding holes are explicitly covered by reserved or similar fields, 
> as is already done for KHO/LUO serialized data, so no functional changes 
> are intended by this change.

This look good. I will update it. Thanks.

>
>>
>> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
>> ---
>>  include/linux/kho/abi/block.h | 10 +++++++--
>>  include/linux/kho/abi/luo.h   | 38 +++++++++++++++++++++++++++++------
>>  include/linux/kho/abi/memfd.h | 16 ++++++++++++---
>>  3 files changed, 53 insertions(+), 11 deletions(-)
>>
>> diff --git a/include/linux/kho/abi/block.h b/include/linux/kho/abi/block.h
>> index d06d64b963be..36bdbaf9b3b8 100644
>> --- a/include/linux/kho/abi/block.h
>> +++ b/include/linux/kho/abi/block.h
>> @@ -12,7 +12,7 @@
>>   * pre-update kernel to a post-update kernel.
>>   *
>>   * This interface is a contract. Any modification to the structure fields,
>> - * compatible strings, or the layout of the `__packed` serialization
>> + * compatible strings, or the layout of the serialization
>>   * structures defined here constitutes a breaking change. Such changes require
>>   * incrementing the version number in the `KHO_FDT_COMPATIBLE` string to
>>   * prevent a new kernel from misinterpreting data from an old kernel.
>> @@ -26,6 +26,8 @@
>>  #define _LINUX_KHO_ABI_BLOCK_H
>>  
>>  #include <asm/page.h>
>> +#include <linux/build_bug.h>
>> +#include <linux/kconfig.h>
>>  #include <linux/types.h>
>>  
>>  /**
>> @@ -49,6 +51,10 @@
>>  struct kho_block_header_ser {
>>  	u64 next;
>>  	u64 count;
>> -} __packed;
>> +};
>> +
>> +static_assert(sizeof(struct kho_block_header_ser) == 16);
>> +static_assert(!IS_ENABLED(CONFIG_64BIT) ||
>> +	      __alignof__(struct kho_block_header_ser) == 8);
>>  
>>  #endif /* _LINUX_KHO_ABI_BLOCK_H */
>> diff --git a/include/linux/kho/abi/luo.h b/include/linux/kho/abi/luo.h
>> index 288076de6d4a..721949374fa1 100644
>> --- a/include/linux/kho/abi/luo.h
>> +++ b/include/linux/kho/abi/luo.h
>> @@ -58,6 +58,8 @@
>>  #define _LINUX_KHO_ABI_LUO_H
>>  
>>  #include <linux/align.h>
>> +#include <linux/build_bug.h>
>> +#include <linux/kconfig.h>
>>  #include <linux/kho/abi/block.h>
>>  #include <uapi/linux/liveupdate.h>
>>  
>> @@ -82,7 +84,11 @@ struct luo_ser {
>>  	u64 liveupdate_num;
>>  	u64 sessions_pa;
>>  	u64 flbs_pa;
>> -} __packed;
>> +};
>> +
>> +static_assert(sizeof(struct luo_ser) == 32);
>> +static_assert(!IS_ENABLED(CONFIG_64BIT) ||
>> +	      __alignof__(struct luo_ser) == 8);
>
> Please remove the two assertions above throughout this patch, as they 
> are replaced later in the series. In general, introducing add -> remove 
> -> add churn across a patch series is discouraged, as it indicates a 
> lack of planning.

Got it. Will remove it.

~Tarun

>
>>  
>>  #define LIVEUPDATE_HNDL_COMPAT_LENGTH	48
>>  
>> @@ -98,7 +104,11 @@ struct luo_file_ser {
>>  	char compatible[LIVEUPDATE_HNDL_COMPAT_LENGTH];
>>  	u64 data;
>>  	u64 token;
>> -} __packed;
>> +};
>> +
>> +static_assert(sizeof(struct luo_file_ser) == 64);
>> +static_assert(!IS_ENABLED(CONFIG_64BIT) ||
>> +	      __alignof__(struct luo_file_ser) == 8);
>>  
>>  /**
>>   * struct luo_file_set_ser - Represents the serialized metadata for file set
>> @@ -113,7 +123,11 @@ struct luo_file_ser {
>>  struct luo_file_set_ser {
>>  	u64 files;
>>  	u64 count;
>> -} __packed;
>> +};
>> +
>> +static_assert(sizeof(struct luo_file_set_ser) == 16);
>> +static_assert(!IS_ENABLED(CONFIG_64BIT) ||
>> +	      __alignof__(struct luo_file_set_ser) == 8);
>>  
>>  /**
>>   * struct luo_session_ser - Represents the serialized metadata for a LUO session.
>> @@ -131,7 +145,11 @@ struct luo_file_set_ser {
>>  struct luo_session_ser {
>>  	char name[LIVEUPDATE_SESSION_NAME_LENGTH];
>>  	struct luo_file_set_ser file_set_ser;
>> -} __packed;
>> +};
>> +
>> +static_assert(sizeof(struct luo_session_ser) == 80);
>> +static_assert(!IS_ENABLED(CONFIG_64BIT) ||
>> +	      __alignof__(struct luo_session_ser) == 8);
>>  
>>  /* The max size is set so it can be reliably used during in serialization */
>>  #define LIVEUPDATE_FLB_COMPAT_LENGTH	48
>> @@ -152,7 +170,11 @@ struct luo_session_ser {
>>  struct luo_flb_header_ser {
>>  	u64 pgcnt;
>>  	u64 count;
>> -} __packed;
>> +};
>> +
>> +static_assert(sizeof(struct luo_flb_header_ser) == 16);
>> +static_assert(!IS_ENABLED(CONFIG_64BIT) ||
>> +	      __alignof__(struct luo_flb_header_ser) == 8);
>>  
>>  /**
>>   * struct luo_flb_ser - Represents the serialized state of a single FLB object.
>> @@ -175,7 +197,11 @@ struct luo_flb_ser {
>>  	char name[LIVEUPDATE_FLB_COMPAT_LENGTH];
>>  	u64 data;
>>  	u64 count;
>> -} __packed;
>> +};
>> +
>> +static_assert(sizeof(struct luo_flb_ser) == 64);
>> +static_assert(!IS_ENABLED(CONFIG_64BIT) ||
>> +	      __alignof__(struct luo_flb_ser) == 8);
>>  
>>  /* Kernel Live Update Test ABI */
>>  #ifdef CONFIG_LIVEUPDATE_TEST
>> diff --git a/include/linux/kho/abi/memfd.h b/include/linux/kho/abi/memfd.h
>> index 08b10fea2afc..376a724a1d8c 100644
>> --- a/include/linux/kho/abi/memfd.h
>> +++ b/include/linux/kho/abi/memfd.h
>> @@ -11,6 +11,8 @@
>>  #ifndef _LINUX_KHO_ABI_MEMFD_H
>>  #define _LINUX_KHO_ABI_MEMFD_H
>>  
>> +#include <linux/build_bug.h>
>> +#include <linux/kconfig.h>
>>  #include <linux/types.h>
>>  #include <linux/kho/abi/kexec_handover.h>
>>  
>> @@ -20,7 +22,7 @@
>>   * memfd uses the ABI defined below for preserving its state across a kexec
>>   * reboot using the LUO.
>>   *
>> - * The state is serialized into a packed structure `struct memfd_luo_ser`
>> + * The state is serialized into `struct memfd_luo_ser`
>>   * which is handed over to the next kernel via the KHO mechanism.
>>   *
>>   * This interface is a contract. Any modification to the structure layout
>> @@ -54,7 +56,11 @@ struct memfd_luo_folio_ser {
>>  	u64 pfn:52;
>>  	u64 flags:12;
>>  	u64 index;
>> -} __packed;
>> +};
>> +
>> +static_assert(sizeof(struct memfd_luo_folio_ser) == 16);
>> +static_assert(!IS_ENABLED(CONFIG_64BIT) ||
>> +	      __alignof__(struct memfd_luo_folio_ser) == 8);
>>  
>>  /*
>>   * The set of seals this version supports preserving. If support for any new
>> @@ -85,7 +91,11 @@ struct memfd_luo_ser {
>>  	u32 flags;
>>  	u64 nr_folios;
>>  	struct kho_vmalloc folios;
>> -} __packed;
>> +};
>> +
>> +static_assert(sizeof(struct memfd_luo_ser) == 48);
>> +static_assert(!IS_ENABLED(CONFIG_64BIT) ||
>> +	      __alignof__(struct memfd_luo_ser) == 8);
>>  
>>  /* The compatibility string for memfd file handler */
>>  #define MEMFD_LUO_FH_COMPATIBLE	"memfd-v2"
>
> -- 
> Pasha

