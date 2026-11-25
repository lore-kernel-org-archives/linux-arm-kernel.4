Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3D0606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 11:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yOnNgu4z;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JZyGbLbf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=h3phsWQfdxv0uf8XfVUgGfaDc5dsQnzDLtihhQEk2TA=; b=yOnNgu4zvLfIgV
	MFYu+RphdwmnBK9jXxXb3CGuOde03TYsBti5D6d5+/o9K4kLWiDrgAdzxcgQVfjDiV37vERYKIz5A
	LTclTMeU15sZfWmBSi8GO1ddk1YE2JAJmGLWtnwBYlEDr7CVs0EecUhPYmenug6JlROveNN3gNkVf
	pz2B3r/95SgD8XyS59t399DW3RhNjYnYjsbRUY0UFGxU5iMvJgMfw88aHmxbIdHpNpu7kpz+aYCWj
	KI/62WhYxFXJFZDdkjS3ad/Ycb4vHbvSsyZXoCDymZNEKuvCgjjT3DwXmQAbP3+O+cUJswgzvrDaU
	Doe5fdwBT8flap5NxlUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWB7p-00000009cWK-2Tu4;
	Wed, 25 Nov 2026 11:25:21 +0000
Received: from out-1.mta1.migadu.com ([2001:41d0:203:375::1] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWB7R-00000009c6Y-1OSj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 11:25:01 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=5QCnQHYvVrARR6qeDXaM4h3qgqVkX81GKomM7qBO+tU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795605895; v=1; x=1796210695;
 b=JZyGbLbf4g1+ZSDf7saAvyLqtYnar3iWT0OgWH4IudSvI19fRDnoNN8H+GgYCZij+20SdI83
 24tgdSxPF7zVU5bZ2SKIjZt/3r8agRgTixW6m4dOk0rOPE6kR4PeQuBluyz8i/uCs6ERoA4KVV6
 rnd7rfFYsJhefkioDyF6CGzU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4bcef2c1382e426d;
	Wed, 25 Nov 2026 11:24:54 +0000
X-Mizu-Trace-ID: 4bcef2c1382e426d
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v3 08/19] hugetlb_vmemmap: Expose whether HVO is enabled
 to architecture code
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <CADrL8HXPKfUhRaVhVyV6CPoQ2apZx1FCpyqyPMr=p=Q_kF3HBA@mail.gmail.com>
Date: Wed, 25 Nov 2026 19:24:31 +0800
Cc: Muchun Song <muchun.song@linux.dev>,
 Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Nikos Nikoleris <nikos.nikoleris@arm.com>,
 Linu Cherian <linu.cherian@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Nanyong Sun <sunnanyong@huawei.com>,
 Yu Zhao <yuzhao@google.com>,
 Frank van der Linden <fvdl@google.com>,
 David Rientjes <rientjes@google.com>,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0EFB24F3-D3F2-4B28-9684-68CCCC1E80B8@linux.dev>
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-9-jthoughton@google.com>
 <9487E341-5F59-4245-BE0E-EFDD413E45D2@linux.dev>
 <CADrL8HXPKfUhRaVhVyV6CPoQ2apZx1FCpyqyPMr=p=Q_kF3HBA@mail.gmail.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_032457_889907_91EDF83A 
X-CRM114-Status: GOOD (  38.61  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> On Nov 25, 2026, at 01:13, James Houghton <jthoughton@google.com> =
wrote:
>=20
> On Mon, Nov 23, 2026 at 3:50=E2=80=AFAM Muchun Song =
<muchun.song@linux.dev> wrote:
>>=20
>>> On Nov 23, 2026, at 02:44, James Houghton <jthoughton@google.com> =
wrote:
>>>=20
>>> Architectures that select
>>> CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO may configure the
>>> system at boot depending on whether HVO is enabled, e.g. arm64 may
>>> require all CPUs to support hardware access flag updates only if HVO =
is
>>> enabled.
>>>=20
>>> Add hugetlb_vmemmap_optimize_enabled() so that they can check. It is
>>> declared before <asm/hugetlb.h> is included, so that it can also be =
used
>>> from inline helpers there.
>>>=20
>>> It only reflects the hugetlb_free_vmemmap=3D kernel command line =
parameter
>>> (and the sysctl, when writable), not whether the architecture =
supports
>>> HVO.
>>>=20
>>> Signed-off-by: James Houghton <jthoughton@google.com>
>>> ---
>>> include/linux/hugetlb.h |  9 +++++++++
>>> mm/hugetlb_vmemmap.c    | 18 ++++++++++++++++++
>>> 2 files changed, 27 insertions(+)
>>>=20
>>> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
>>> index 0d5414392d87..b2a6441bcd84 100644
>>> --- a/include/linux/hugetlb.h
>>> +++ b/include/linux/hugetlb.h
>>> @@ -22,6 +22,15 @@ struct node;
>>>=20
>>> void free_huge_folio(struct folio *folio);
>>>=20
>>> +#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
>>> +bool hugetlb_vmemmap_optimize_enabled(void);
>>> +#else
>>> +static inline bool hugetlb_vmemmap_optimize_enabled(void)
>>> +{
>>> +     return false;
>>> +}
>>> +#endif
>>> +
>>> #ifdef CONFIG_HUGETLB_PAGE
>>>=20
>>> #include <linux/pagemap.h>
>>> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
>>> index 142f2975846b..fb6da64bd80d 100644
>>> --- a/mm/hugetlb_vmemmap.c
>>> +++ b/mm/hugetlb_vmemmap.c
>>> @@ -452,6 +452,24 @@ static int __init =
hugetlb_vmemmap_optimize_param(char *buf)
>>> }
>>> early_param("hugetlb_free_vmemmap", hugetlb_vmemmap_optimize_param);
>>>=20
>>> +/**
>>> + * hugetlb_vmemmap_optimize_enabled - whether HVO is enabled
>>> + *
>>> + * This only reflects the hugetlb_free_vmemmap=3D kernel command =
line parameter
>>> + * and the vm.hugetlb_optimize_vmemmap sysctl, not whether the =
architecture
>>> + * supports HVO (see arch_support_vmemmap_remap()).
>>> + *
>>> + * The value is final once early parameters have been parsed only =
if the
>>> + * architecture selects =
CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_RO;
>>> + * otherwise it may change at any time through the sysctl.
>>> + *
>>> + * Return: true if HVO is enabled.
>>> + */
>>=20
>> I don't think hugetlb_vmemmap_optimize_enabled() has clear semantics.
>>=20
>> Its name suggests that it reports whether HVO is actually enabled and
>> usable, but it only returns the policy bit set by Kconfig, the =
command
>> line, or the sysctl. It may return true even when
>> arch_support_vmemmap_remap() is false. This is particularly confusing
>> because arm64 calls it while determining the capability on which
>> arch_support_vmemmap_remap() itself depends. Therefore, the helper
>> really reports whether HVO was requested, rather than whether it is
>> enabled.
>=20
> I agree, the name is misleading.
>=20
>> Could we keep vmemmap_optimize_enabled private and let arm64 retain
>> the boot-time setting locally instead? For example, arm64 can use a
>> private hvo_enabled_at_boot variable with a
>> core_param(hugetlb_free_vmemmap, ...) registration. The system
>> capability is evaluated after core parameters have been parsed, and
>> arm64 makes the HVO sysctl read-only, so the value remains stable for
>> system capability and late CPU verification.
>>=20
>> What do you think?
>>=20
>> +static bool hvo_enabled_at_boot __ro_after_init =3D
>> +       IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
>> +core_param(hugetlb_free_vmemmap, hvo_enabled_at_boot, bool, 0);
>> +
>> static bool has_bbm_through_af(const struct arm64_cpu_capabilities =
*caps, int scope)
>> {
>>        /* The kernel only enables HW AF updates with =
CONFIG_ARM64_HW_AFDBM. */
>> @@ -2055,7 +2059,8 @@ static bool has_bbm_through_af(const struct =
arm64_cpu_capabilities *caps, int sc
>>         * BBM-through-AF is only needed for HVO. If HVO is not in =
use, don't
>>         * penalize systems with mismatched support.
>>         */
>> -       if (!hugetlb_vmemmap_optimize_enabled()) {
>> +       if (!IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP) ||
>> +           !hvo_enabled_at_boot) {
>>                /* Only valid if HVO cannot be enabled later via the =
sysctl. */
>>                =
BUILD_BUG_ON(!IS_ENABLED(CONFIG_ARCH_HUGETLB_VMEMMAP_OPTIMIZATION_SYSCTL_R=
O));
>>                return false;
>>=20
>=20
> This is a good suggestion, but let me explain why I don't think we
> should do this:
>=20
> First of all, I'm changing the bbm_through_af capability from a
> SYSTEM_FEATURE to an EARLY_LOCAL_CPU_FEATURE, which means that
> has_bbm_through_af() will be evaluated before core_param()s are
> parsed. I could change it back to a SYSTEM_FEATURE, but I would rather
> not do that. (See [1]).

Actually you can use early_param.

>=20
> I also don't like duplicate parsing of the same command line argument.
> I'm not sure if there is precedent for this, but I feel like it will
> lead to confusion. (It is news to me that duplicate parsing like this
> is valid, as long as they are not both core_param()? or
> early_param()s, I think?)

I checked the command-line parsing paths, and having more than one
handler observe the same command-line option is supported. In
particular, it is not restricted to handlers of different types.

do_early_param() walks the entire .init.setup table and invokes every
matching early_param() entry; it does not stop after the first match.
There are several existing examples:

- "kfence.sample_interval=3D" is parsed early by the arm64 and powerpc
  MM code and is parsed again by the generic KFENCE module_param_cb().

- "pci=3D" is registered with early_param() in both
  arch/x86/kernel/acpi/boot.c and drivers/pci/pci.c.

- "console=3D" is handled by an early_param() in
  drivers/tty/serial/earlycon.c and by __setup() in
  kernel/printk/printk.c.

I agree that duplicate parsing should be used carefully, but these
handlers would not be competing to own the same state. The generic HVO
code does not need to expose its internal policy state solely for arm64
capability detection. Arm64 only needs a local snapshot of whether HVO
was requested at boot in order to decide whether the BBM-through-AF CPU
capability is needed.

Thanks,
Muchun


>=20
> It would be much easier just to rename
> hugetlb_vmemmap_optimize_enabled() to
> hugetlb_vmemmap_optimize_requested() and properly document what it
> returns. Does that sound good to you?
>=20
> [1] =
https://lore.kernel.org/linux-mm/CADrL8HUgo0zAHe7_eF1+hfTR6jBbZ=3DUKB1qPpM=
WpksvqbNHsyw@mail.gmail.com/



