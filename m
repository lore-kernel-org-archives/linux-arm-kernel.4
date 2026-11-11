Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2A2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 06:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nQIok6tj;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kHvR+JuU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Up8Sxm5Z/vJlw6/f/g9Tue73jy4SQVTZi+t46heonUg=; b=nQIok6tjdmmiZaJFlpR4S3nVEh
	iYnnJQdL56QbxbUfsPosMgLAR0ywRjuUGV1o1xrKEFy3r9nSQ5E0PMR4+h7c5fS+C+yIk71wRHH6r
	ri8FCweRN2GpYSNkCA1q5cHlYQu5SXsx1GhoH2r3YQ37K5q+/29niFtywPHWmPMWCzSBJNhJE99du
	HxYJWVkicFf+sGmI3cgO44yBKl2yWaA0167XSz27WTF99sybeacnp/90baNDd1hGjtYVUk3KAUaUq
	SCQYkUPlTtun1flQp11kQr9ytDEyO/ZoqG/1ut5AIAJIZZPYkXWuqEUvy4x/AOs/ZmuWis8gSLSy/
	DZ3s27wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1he-00000005lIR-1Awm;
	Wed, 11 Nov 2026 06:21:02 +0000
Received: from mail-ej1-x648.google.com ([2a00:1450:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1hb-00000005lHT-0Khg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 06:21:00 +0000
Received: by mail-ej1-x648.google.com with SMTP id a640c23a62f3a-c50547b4992so116653466b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 22:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794378056; x=1794982856; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Up8Sxm5Z/vJlw6/f/g9Tue73jy4SQVTZi+t46heonUg=;
        b=kHvR+JuUhTmjJAwxDg7xG65AtsUkKs+f87GObitewgaHdSf6jvsSzApWEYMjMkHgtr
         J9oL67Hmvrtm3YFUfcmu8UbGbYqBBFYgm2TjAgGA0NgVEI3zPmqKt2BmqumIpoKiNtAd
         tBxvfN1sl6HhfrTJyxRNohhrTzw37VwplKH6qksqPaaSNOR4j/ZKbmO6Bl840fdgI9Hu
         tyoss2QeTcuZST2unyHQ/WYMHKEG4ALvz76AJoX/Nw3AyhHHc6IMTcpmtWTQJ10APjNm
         kpiYEcJJRx6Hv1vdhqMy5Rsmh6/Iao8vls9VNT0MXFrH9hCv/KS6Bjd2OIDd1fJwcKgE
         J7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794378056; x=1794982856;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Up8Sxm5Z/vJlw6/f/g9Tue73jy4SQVTZi+t46heonUg=;
        b=M/7jx73HpqZ1ZryUZhkOHPER0wi+zzojYOmaxpdBXWapyEVxINhnuDfQWqdUjDoJYW
         BAPTavVNo5k2ct4KzPH73tPicAsmaWS5bvGIOoFiOPQ/HpzdrOo5tcM7iH8CBuRvytqT
         9JHcpFfLTKkkap7u1hA2L9zfEoMFZu+UGBW0QCiabIqk9wInzWhfc0oVNhW89C6IIitK
         6UtVpnEYqkQOOgXvqGmCqRCEkV8hWKCHZE0UDumCLcslBC2dada4+cGwT4lDjpvrE48H
         mYaFAm48jssJalzQuuJ59WJOChDy0keaS2kUQC9ViQIxGf0psHreAKFHZo1J9zVrf8v1
         AUxA==
X-Forwarded-Encrypted: i=1; AL+hErFonk7HQmwSQXYOTyWxpsK8cy4tTjABJ9qN8vJozRVhTKIaYbw6wq2rrlqIAKDj9NS4xH1vbcpOoD0tCv3KIbdC@lists.infradead.org
X-Gm-Message-State: APuU4Z9CLmXQNAIf4oaHltwChRJvegk/ImwtjHRz9TG6qRIot0MDJKk+
	zNfG4pfDr0+VZmgJ89lrzL/iYXV8zGHi4/+8qv+I5UfPmxeZa2+3b/1f7UoLjUPSYmYU/NvEKG5
	XBM8EElEaAO+xXPsOJg==
X-Received: from ejcuu11-n1.prod.google.com ([2002:a17:907:c60b:10b0:c3f:fb8f:67f3])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3e8b:b0:c31:8c48:e18b with SMTP id a640c23a62f3a-c5066aa85bemr101254666b.14.1794378056032;
 Tue, 10 Nov 2026 22:20:56 -0800 (PST)
Date: Wed, 11 Nov 2026 06:20:55 +0000
In-Reply-To: <179432062803.2329176.7220119921541924936.b4-review@b4>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261110050202.529473-1-tarunsahu@google.com> <20261110050202.529473-4-tarunsahu@google.com>
 <179432062803.2329176.7220119921541924936.b4-review@b4>
Message-ID: <9huzy0azq46w.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v4 03/19] kho, memfd_luo: Reference struct kho_vmalloc via
 serialized pointer
From: tarunsahu@google.com
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, Mike Rapoport <rppt@kernel.org>, robin.murphy@arm.com, 
	maz@kernel.org, will@kernel.org, David Matlack <dmatlack@google.com>, 
	Alexander Graf <graf@amazon.com>, seanjc@google.com, jgg@nvidia.com, loganodell@google.com, 
	arnd@arndb.de, dwmw2@infradead.org, baolu.lu@linux.intel.com, 
	Bjorn Helgaas <bhelgaas@google.com>, oupton@kernel.org, alex@shazbot.org, 
	gle.com@google.com, pbonzini@redhat.com, 
	Andrew Morton <akpm@linux-foundation.org>, kevin.tian@intel.com, joro@8bytes.org, 
	kvmarm@lists.linux.dev, linux-pci@vger.kernel.org, 
	Pratyush Yadav <pratyush@kernel.org>, kexec@lists.infradead.org, kvm@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	skhawaja@google.com, sagis@google.com, linux-arch@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_222059_185701_EACCCB16 
X-CRM114-Status: GOOD (  26.28  )
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

Pasha Tatashin <pasha.tatashin@soleen.com> writes:

>> Subsystems preserving vmalloc allocations currently embed struct
>> kho_vmalloc directly by value in their serialized structures or device
>> tree properties. For example, struct memfd_luo_ser embeds struct
>> kho_vmalloc folios, and test_kho writes the structure directly into the
>> folios_info FDT property.
>> 
>> Embedding struct kho_vmalloc directly couples the containing layout's
>> field offsets and size to struct kho_vmalloc. Any modification to struct
>> kho_vmalloc shifts subsequent fields in the containing structure and
>> breaks the handover ABI across kexec.
>> 
>> Convert callers to hold a DECLARE_KHOSER_PTR pointer to struct
>> kho_vmalloc instead of embedding it by value. In memfd_luo, allocate the
>> main structure and struct kho_vmalloc in the same preserved folio, placing
>> struct kho_vmalloc in the remaining 8-byte-aligned space, and bump the
>> compatibility string to memfd-v3. In test_kho, place struct kho_vmalloc
>> in the remaining space of the FDT folio, store the serialized pointer in
>> the folios_info property, and bump the compatibility string to
>> kho-test-v2.
>> 
>> Signed-off-by: Tarun Sahu <tarunsahu@google.com>
>>
>> diff --git a/include/linux/kho/abi/kexec_handover.h b/include/linux/kho/abi/kexec_handover.h
>> index 6f12f5037ea5..bee75a7006e8 100644
>> --- a/include/linux/kho/abi/kexec_handover.h
>> +++ b/include/linux/kho/abi/kexec_handover.h
>> @@ -11,6 +11,8 @@
>>  #define _LINUX_KHO_ABI_KEXEC_HANDOVER_H
>>  
>>  #include <linux/bits.h>
>> +#include <linux/build_bug.h>
>> +#include <linux/kconfig.h>
>>  #include <linux/log2.h>
>>  #include <linux/math.h>
>>  #include <linux/types.h>
>> @@ -177,6 +179,10 @@ struct kho_vmalloc {
>>  	unsigned short order;
>>  };
>>  
>> +static_assert(sizeof(struct kho_vmalloc) == 16);
>> +static_assert(!IS_ENABLED(CONFIG_64BIT) ||
>> +	      __alignof__(struct kho_vmalloc) == 8);
>> +
>>  /**
>>   * DOC: KHO persistent memory tracker
>>   *
>> diff --git a/include/linux/kho/abi/memfd.h b/include/linux/kho/abi/memfd.h
>> index 376a724a1d8c..7b49dd6d7e2a 100644
>> --- a/include/linux/kho/abi/memfd.h
>> +++ b/include/linux/kho/abi/memfd.h
>> @@ -81,7 +81,7 @@ static_assert(!IS_ENABLED(CONFIG_64BIT) ||
>>   *             to directly use them in the ABI.
>>   * @flags:     Flags for the file. Unused flag bits must be set to 0.
>>   * @nr_folios: Number of folios in the folios array.
>> - * @folios:    KHO vmalloc descriptor pointing to the array of
>> + * @folios:    Pointer to KHO vmalloc descriptor for the array of
>>   *             struct memfd_luo_folio_ser.
>>   */
>>  struct memfd_luo_ser {
>> @@ -90,14 +90,14 @@ struct memfd_luo_ser {
>>  	u32 seals;
>>  	u32 flags;
>>  	u64 nr_folios;
>> -	struct kho_vmalloc folios;
>> +	DECLARE_KHOSER_PTR(folios, struct kho_vmalloc *);
>>  };
>>  
>> -static_assert(sizeof(struct memfd_luo_ser) == 48);
>> +static_assert(sizeof(struct memfd_luo_ser) == 40);
>>  static_assert(!IS_ENABLED(CONFIG_64BIT) ||
>>  	      __alignof__(struct memfd_luo_ser) == 8);
>>  
>>  /* The compatibility string for memfd file handler */
>> -#define MEMFD_LUO_FH_COMPATIBLE	"memfd-v2"
>> +#define MEMFD_LUO_FH_COMPATIBLE	"memfd-v3"
>>  
>>  #endif /* _LINUX_KHO_ABI_MEMFD_H */
>> diff --git a/lib/test_kho.c b/lib/test_kho.c
>> index aa6a0956bb8b..cd0f183ff68e 100644
>> --- a/lib/test_kho.c
>> +++ b/lib/test_kho.c
>> @@ -25,7 +25,7 @@
>>  
>>  #define KHO_TEST_MAGIC	0x4b484f21	/* KHO! */
>>  #define KHO_TEST_FDT	"kho_test"
>> -#define KHO_TEST_COMPAT "kho-test-v1"
>> +#define KHO_TEST_COMPAT "kho-test-v2"
>>  
>>  static long max_mem = (PAGE_SIZE << MAX_PAGE_ORDER) * 2;
>>  module_param(max_mem, long, 0644);
>> @@ -34,7 +34,7 @@ struct kho_test_state {
>>  	unsigned int nr_folios;
>>  	struct folio **folios;
>>  	phys_addr_t *folios_info;
>> -	struct kho_vmalloc folios_info_phys;
>> +	DECLARE_KHOSER_PTR(folios_info_phys, struct kho_vmalloc *);
>>  	int nr_folios_preserved;
>>  	struct folio *fdt;
>>  	__wsum csum;
>> @@ -47,13 +47,13 @@ static void kho_test_unpreserve_data(struct kho_test_state *state)
>>  	for (int i = 0; i < state->nr_folios_preserved; i++)
>>  		kho_unpreserve_folio(state->folios[i]);
>>  
>> -	kho_unpreserve_vmalloc(&state->folios_info_phys);
>> +	if (KHOSER_LOAD_PTR(state->folios_info_phys))
>> +		kho_unpreserve_vmalloc(KHOSER_LOAD_PTR(state->folios_info_phys));
>>  	vfree(state->folios_info);
>>  }
>>  
>>  static int kho_test_preserve_data(struct kho_test_state *state)
>>  {
>> -	struct kho_vmalloc folios_info_phys;
>>  	phys_addr_t *folios_info;
>>  	int err;
>>  
>> @@ -61,11 +61,10 @@ static int kho_test_preserve_data(struct kho_test_state *state)
>>  	if (!folios_info)
>>  		return -ENOMEM;
>>  
>> -	err = kho_preserve_vmalloc(folios_info, &folios_info_phys);
>> +	err = kho_preserve_vmalloc(folios_info, KHOSER_LOAD_PTR(state->folios_info_phys));
>>  	if (err)
>>  		goto err_free_info;
>>  
>> -	state->folios_info_phys = folios_info_phys;
>>  	state->folios_info = folios_info;
>>  
>>  	for (int i = 0; i < state->nr_folios; i++) {
>> @@ -123,14 +122,19 @@ static int kho_test_prepare_fdt(struct kho_test_state *state, ssize_t fdt_size)
>>  
>>  static int kho_test_preserve(struct kho_test_state *state)
>>  {
>> -	ssize_t fdt_size;
>> +	struct kho_vmalloc *folios_vmalloc;
>> +	ssize_t fdt_size, alloc_size;
>>  	int err;
>>  
>>  	fdt_size = state->nr_folios * sizeof(phys_addr_t) + PAGE_SIZE;
>> -	state->fdt = folio_alloc(GFP_KERNEL, get_order(fdt_size));
>> +	alloc_size = fdt_size + sizeof(struct kho_vmalloc);
>> +	state->fdt = folio_alloc(GFP_KERNEL, get_order(alloc_size));
>>  	if (!state->fdt)
>>  		return -ENOMEM;
>>  
>> +	folios_vmalloc = folio_address(state->fdt) + fdt_size;
>> +	KHOSER_STORE_PTR(state->folios_info_phys, folios_vmalloc);
>> +
>>  	err = kho_preserve_folio(state->fdt);
>>  	if (err)
>>  		goto err_free_fdt;
>> @@ -234,7 +238,8 @@ static int kho_test_save(void)
>>  
>>  static int kho_test_restore_data(const void *fdt, int node)
>>  {
>> -	const struct kho_vmalloc *folios_info_phys;
>> +	const DECLARE_KHOSER_PTR(*folios_info_phys, struct kho_vmalloc *);
>> +	const struct kho_vmalloc *folios_vmalloc;
>>  	const unsigned int *nr_folios;
>>  	phys_addr_t *folios_info;
>>  	const __wsum *old_csum;
>> @@ -255,7 +260,11 @@ static int kho_test_restore_data(const void *fdt, int node)
>>  	if (!folios_info_phys || len != sizeof(*folios_info_phys))
>>  		return -EINVAL;
>>  
>> -	folios_info = kho_restore_vmalloc(folios_info_phys);
>> +	folios_vmalloc = KHOSER_LOAD_PTR(*folios_info_phys);
>> +	if (!folios_vmalloc)
>> +		return -EINVAL;
>> +
>> +	folios_info = kho_restore_vmalloc(folios_vmalloc);
>>  	if (!folios_info)
>>  		return -EINVAL;
>
> Why do we need DECLARE_KHOSER_PTR() in test_kho.c at all?
>
I tried to keep the kho_vmalloc reference after kho_ser_hdr to be
same at every places. But Now I realized it is completely unnecessary.

> DECLARE_KHOSER_PTR() makes sense in shared ABI structs like struct 
> memfd_luo_ser where both kernels reference the same struct field and get 
> type checking between KHOSER_STORE_PTR() and KHOSER_LOAD_PTR().
>
> Here, struct kho_test_state is purely local to the saving kernel and the 
> handover ABI is just the "folios_info" FDT property carrying a u64 
> physical address. Having two unrelated DECLARE_KHOSER_PTR() declarations 
> doesn't buy any cross-kernel type safety
>
> Can we drop DECLARE_KHOSER_PTR() here, keep a plain pointer in struct 
> kho_test_state, serialize a u64 phys addr into the "folios_info" FDT 
> property, and read it back as const u64 * + phys_to_virt() like the rest 
> of the KHO FDT code?

Yes,Agree. I will update it. Thanks!

~Tarun
>
> -- 
> Pasha

