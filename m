Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06FA606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=omIhWhph;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KFHuThxf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hIyBw/Rnf4XDdCcPvUaoHh+oCwvS6/u0QmuD2Ig3thk=; b=omIhWhphhbZGZWimKGriJYJoJX
	AqCCbjXq/gxer/tGSuErel7fWx71Jhl6i+qW4ftW4Ee+xZEK/HWZL0QDfLALLO6SsLGXerS2ow1bq
	GQFCXbQWzg8ABAIQ9RPgM1BgABO/as6uVeKGusIuTdxJ1soJinKyhgAN7SiJ1v1Is8lyS03/a0N6p
	G1A3SkgUACGFGopueJIrCb2dfUnEi9RZ4n36PeB3AbG7sNrcO3vBc8PzwrvlkkfM3Pkbiec9g2fGn
	nhmwzvZFYGUozjMIVoR38l5w20yTr7/u0AHVYR9f/fOC/63akyZdqtvQEAjouWhzMTDSMj5efQWRH
	az+BHNCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZlA-00000004fjm-3OFO;
	Mon, 23 Nov 2026 19:31:31 +0000
Received: from out-90.mta0.migadu.com ([2001:41d0:1004:224b::5a] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZl7-00000004fip-0cNx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:31:26 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=kKf0+6VXw5GQNljtgXjHRstGkHmQFT+6ySSk8HNbVuw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795462281; v=1; x=1796067081;
 b=KFHuThxfuMB8f+Z/DGVJNflJxRnq3MEyhy3QPkaX3SBIMBS9blqoIPE36o5OmqbVbUxSzEwJ
 08chBGd5o4NFR0ksCfSvFOyCZtNK4aREEun9LQeVyjQhIrNVKUzUk5FjCvHxGYIY6hH9XAYPg+x
 8jOGzkkUjNkQceqzX+k00V1Y=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 980f7a0d94fa68ff;
	Mon, 23 Nov 2026 19:31:21 +0000
X-Mizu-Trace-ID: 980f7a0d94fa68ff
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c00d7ac49dso11616e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 11:31:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHG670OHhIBtrCL/P0/PyDGCqjzMlENeiJyH+4RBQxmXUqtXwiXJ1na8JOxtsoysxYMz0nDVV8F/GZsfEpSYE4r@lists.infradead.org
X-Gm-Message-State: APuU4Z/Uld5MhXZtSJi/idK7q6CLJhYxOehheTvHiJDlzag/bqLxioHF
	HfZTKPMlloT8Kd8dIzNx45zoxSquCQTpIP8DeGtyoVO6KYNB5sWs3iUQwvZP7j7y9TOtU4Angui
	zEHblZ1+JJw9XH8/j7FKmDaYY8N5JeUZWvU43msZo
X-Received: by 2002:a05:6512:6c3:b0:5c1:6063:cd75 with SMTP id
 2adb3069b0e04-5c1c8052873mr300301e87.0.1795462280355; Mon, 23 Nov 2026
 11:31:20 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117174403.58762-1-vdonnefort@google.com> <20261117174403.58762-9-vdonnefort@google.com>
In-Reply-To: <20261117174403.58762-9-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 23 Nov 2026 19:30:44 +0000
X-Gmail-Original-Message-ID: <CA+EHjTy5fjJcFAYfxYeG2aAAuwbSwXrkzK+3tiVNag-wNmiKCw@mail.gmail.com>
X-Gm-Features: Aa3M54omcjaQ9NPsG0-ifI_vW3LHFs3kfGStDJpu6bzStGYmSDLTwYfW8RlpE7Y
Message-ID: <CA+EHjTy5fjJcFAYfxYeG2aAAuwbSwXrkzK+3tiVNag-wNmiKCw@mail.gmail.com>
Subject: Re: [PATCH v4 08/23] KVM: arm64: Add a range to __pkvm_host_donate_guest()
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com, weilin.chang@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_113125_577283_A6B100CD 
X-CRM114-Status: GOOD (  19.35  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vincent,

On Tue, 17 Nov 2026 17:43:47 +0000, Vincent Donnefort
<vdonnefort@google.com> wrote:
[...]
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index f7d249d35f50..ed82cbe973ad 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -1452,22 +1452,30 @@ static int __guest_check_pgtable_memcache(struct pkvm_hyp_vcpu *vcpu)
>          return 0;
>  }
>

Could you update the comment above __guest_check_pgtable_memcache()? It
says only share installs a block, and donate does too now.

Cheers,
/fuad

On Tue, 17 Nov 2026 at 17:44, Vincent Donnefort <vdonnefort@google.com> wrote:
>
> In preparation for supporting stage-2 huge mappings for protected VMs,
> add a nr_pages argument to the __pkvm_host_donate_guest() hypercall.
> This range supports only two values: 1 or PMD_SIZE / PAGE_SIZE (that is
> 512 on a 4K-pages system).
>
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> ---
>  arch/arm64/include/asm/kvm_hcall.h            |  2 +-
>  arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  2 +-
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  4 +-
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 48 +++++++++++--------
>  arch/arm64/kvm/pkvm.c                         |  2 +-
>  5 files changed, 33 insertions(+), 25 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_hcall.h b/arch/arm64/include/asm/kvm_hcall.h
> index 64d18b7f2392..c47ee2653110 100644
> --- a/arch/arm64/include/asm/kvm_hcall.h
> +++ b/arch/arm64/include/asm/kvm_hcall.h
> @@ -221,7 +221,7 @@ DECLARE_KVM_HOST_HCALL(int, __pkvm_host_share_hyp,
>  DECLARE_KVM_HOST_HCALL(int, __pkvm_host_unshare_hyp,
>         u64, pfn)
>  DECLARE_KVM_HOST_HCALL(int, __pkvm_host_donate_guest,
> -       u64, pfn, u64, gfn)
> +       u64, pfn, u64, gfn, u64, nr_pages)
>  DECLARE_KVM_HOST_HCALL(int, __pkvm_host_share_guest,
>         u64, pfn, u64, gfn, u64, nr_pages, u64, prot)
>  DECLARE_KVM_HOST_HCALL(int, __pkvm_host_unshare_guest,
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> index ec0bf9dff899..b04cedaf4ec6 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
> @@ -39,7 +39,7 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
>  int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
>  int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
>  int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
> -int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu);
> +int __pkvm_host_donate_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu);
>  int __pkvm_vcpu_in_poison_fault(struct pkvm_hyp_vcpu *hyp_vcpu);
>  int __pkvm_host_force_reclaim_page_guest(phys_addr_t phys);
>  int __pkvm_host_reclaim_page_guest(u64 gfn, struct pkvm_hyp_vm *vm);
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 853dad542597..4f420718ca6a 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -965,7 +965,7 @@ static int pkvm_refill_memcache(struct pkvm_hyp_vcpu *hyp_vcpu)
>  }
>
>  DEFINE_KVM_HOST_HCALL(int, __pkvm_host_donate_guest,
> -       u64, pfn, u64, gfn)
> +       u64, pfn, u64, gfn, u64, nr_pages)
>  {
>         struct pkvm_hyp_vcpu *hyp_vcpu;
>         int ret;
> @@ -978,7 +978,7 @@ DEFINE_KVM_HOST_HCALL(int, __pkvm_host_donate_guest,
>         if (ret)
>                 return ret;
>
> -       return __pkvm_host_donate_guest(pfn, gfn, hyp_vcpu);
> +       return __pkvm_host_donate_guest(pfn, gfn, nr_pages, hyp_vcpu);
>  }
>
>  DEFINE_KVM_HOST_HCALL(int, __pkvm_host_share_guest,
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index f7d249d35f50..ed82cbe973ad 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -1452,22 +1452,30 @@ static int __guest_check_pgtable_memcache(struct pkvm_hyp_vcpu *vcpu)
>         return 0;
>  }
>
> -int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu)
> +int __pkvm_host_donate_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu)
>  {
>         struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
>         u64 phys = hyp_pfn_to_phys(pfn);
>         u64 ipa = hyp_pfn_to_phys(gfn);
> +       u64 size;
>         u64 meta;
>         int ret;
>
> +       if (!pfn_range_is_valid(pfn, nr_pages))
> +               return -EINVAL;
> +
> +       ret = __guest_check_transition_size(phys, ipa, nr_pages, &size);
> +       if (ret)
> +               return ret;
> +
>         host_lock_component();
>         guest_lock_component(vm);
>
> -       ret = __host_check_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_OWNED);
> +       ret = __host_check_page_state_range(phys, size, PKVM_PAGE_OWNED);
>         if (ret)
>                 goto unlock;
>
> -       ret = __guest_check_page_state_range(vm, ipa, PAGE_SIZE, PKVM_NOPAGE);
> +       ret = __guest_check_page_state_range(vm, ipa, size, PKVM_NOPAGE);
>         if (ret)
>                 goto unlock;
>
> @@ -1476,9 +1484,9 @@ int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu)
>                 goto unlock;
>
>         meta = host_stage2_encode_gfn_meta(vm, gfn);
> -       WARN_ON(host_stage2_set_owner_metadata_locked(phys, PAGE_SIZE,
> +       WARN_ON(host_stage2_set_owner_metadata_locked(phys, size,
>                                                       PKVM_ID_GUEST, meta));
> -       WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
> +       WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, size, phys,
>                                        pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_OWNED),
>                                        &vcpu->vcpu.arch.stage2_mc, 0));
>
> @@ -1820,7 +1828,7 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
>         assert_transition_res(-EPERM,   hyp_pin_shared_mem, virt, virt + size);
>         assert_transition_res(-EPERM,   __pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
>         assert_transition_res(-ENOENT,  __pkvm_host_unshare_guest, gfn, 1, vm);
> -       assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, vcpu);
> +       assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
>
>         selftest_state.host = PKVM_PAGE_OWNED;
>         selftest_state.hyp = PKVM_NOPAGE;
> @@ -1840,7 +1848,7 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
>         assert_transition_res(-EPERM,   __pkvm_hyp_donate_host, pfn, 1);
>         assert_transition_res(-EPERM,   __pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
>         assert_transition_res(-ENOENT,  __pkvm_host_unshare_guest, gfn, 1, vm);
> -       assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, vcpu);
> +       assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
>
>         assert_transition_res(0,        hyp_pin_shared_mem, virt, virt + size);
>         assert_transition_res(0,        hyp_pin_shared_mem, virt, virt + size);
> @@ -1853,7 +1861,7 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
>         assert_transition_res(-EPERM,   __pkvm_hyp_donate_host, pfn, 1);
>         assert_transition_res(-EPERM,   __pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
>         assert_transition_res(-ENOENT,  __pkvm_host_unshare_guest, gfn, 1, vm);
> -       assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, vcpu);
> +       assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
>
>         hyp_unpin_shared_mem(virt, virt + size);
>         assert_page_state();
> @@ -1873,7 +1881,7 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
>         assert_transition_res(-EPERM,   __pkvm_hyp_donate_host, pfn, 1);
>         assert_transition_res(-EPERM,   __pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
>         assert_transition_res(-ENOENT,  __pkvm_host_unshare_guest, gfn, 1, vm);
> -       assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, vcpu);
> +       assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
>         assert_transition_res(-EPERM,   hyp_pin_shared_mem, virt, virt + size);
>
>         selftest_state.host = PKVM_PAGE_OWNED;
> @@ -1890,7 +1898,7 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
>         assert_transition_res(-EPERM,   __pkvm_host_share_hyp, pfn, 1);
>         assert_transition_res(-EPERM,   __pkvm_host_unshare_hyp, pfn, 1);
>         assert_transition_res(-EPERM,   __pkvm_hyp_donate_host, pfn, 1);
> -       assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, vcpu);
> +       assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
>         assert_transition_res(-EPERM,   hyp_pin_shared_mem, virt, virt + size);
>
>         selftest_state.guest[1] = PKVM_PAGE_SHARED_BORROWED;
> @@ -1906,9 +1914,9 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
>
>         selftest_state.host = PKVM_NOPAGE;
>         selftest_state.guest[0] = PKVM_PAGE_OWNED;
> -       assert_transition_res(0,        __pkvm_host_donate_guest, pfn, gfn, vcpu);
> -       assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, vcpu);
> -       assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn + 1, vcpu);
> +       assert_transition_res(0,        __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
> +       assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
> +       assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn + 1, 1, vcpu);
>         assert_transition_res(-EPERM,   __pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
>         assert_transition_res(-EPERM,   __pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
>         assert_transition_res(-EPERM,   __pkvm_host_share_ffa, pfn, 1);
> @@ -1921,8 +1929,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
>         selftest_state.guest[0] = PKVM_PAGE_SHARED_OWNED;
>         assert_transition_res(0,        __pkvm_guest_share_host, vcpu, gfn);
>         assert_transition_res(-EPERM,   __pkvm_guest_share_host, vcpu, gfn);
> -       assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, vcpu);
> -       assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn + 1, vcpu);
> +       assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
> +       assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn + 1, 1, vcpu);
>         assert_transition_res(-EPERM,   __pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
>         assert_transition_res(-EPERM,   __pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
>         assert_transition_res(-EPERM,   __pkvm_host_share_ffa, pfn, 1);
> @@ -1935,8 +1943,8 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
>         selftest_state.guest[0] = PKVM_PAGE_OWNED;
>         assert_transition_res(0,        __pkvm_guest_unshare_host, vcpu, gfn);
>         assert_transition_res(-EPERM,   __pkvm_guest_unshare_host, vcpu, gfn);
> -       assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, vcpu);
> -       assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn + 1, vcpu);
> +       assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
> +       assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn + 1, 1, vcpu);
>         assert_transition_res(-EPERM,   __pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
>         assert_transition_res(-EPERM,   __pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
>         assert_transition_res(-EPERM,   __pkvm_host_share_ffa, pfn, 1);
> @@ -1948,19 +1956,19 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
>         selftest_state.host = PKVM_PAGE_OWNED;
>         selftest_state.guest[0] = PKVM_POISON;
>         assert_transition_res(0,        __pkvm_host_force_reclaim_page_guest, phys);
> -       assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, vcpu);
> +       assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
>         assert_transition_res(-EPERM,   __pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
>         assert_transition_res(-EHWPOISON, __pkvm_guest_share_host, vcpu, gfn);
>         assert_transition_res(-EHWPOISON, __pkvm_guest_unshare_host, vcpu, gfn);
>
>         selftest_state.host = PKVM_NOPAGE;
>         selftest_state.guest[1] = PKVM_PAGE_OWNED;
> -       assert_transition_res(0,        __pkvm_host_donate_guest, pfn, gfn + 1, vcpu);
> +       assert_transition_res(0,        __pkvm_host_donate_guest, pfn, gfn + 1, 1, vcpu);
>
>         selftest_state.host = PKVM_PAGE_OWNED;
>         selftest_state.guest[1] = PKVM_NOPAGE;
>         assert_transition_res(0,        __pkvm_host_reclaim_page_guest, gfn + 1, vm);
> -       assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, vcpu);
> +       assert_transition_res(-EPERM,   __pkvm_host_donate_guest, pfn, gfn, 1, vcpu);
>         assert_transition_res(-EPERM,   __pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
>
>         selftest_state.host = PKVM_NOPAGE;
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 29e7a51a1c03..d1acdca0254f 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -594,7 +594,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
>                         return ret ? -EFAULT : -EAGAIN;
>                 }
>
> -               ret = kvm_call_hyp_nvhe(__pkvm_host_donate_guest, pfn, gfn);
> +               ret = kvm_call_hyp_nvhe(__pkvm_host_donate_guest, pfn, gfn, 1);
>         } else {
>                 if (WARN_ON_ONCE(size != PAGE_SIZE && size != PMD_SIZE))
>                         return -EINVAL;
> --
> 2.56.1.708.g77570a6a1d-goog
>

