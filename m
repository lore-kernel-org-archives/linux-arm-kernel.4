Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F340606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 20:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r3HVj/48;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XEOts8yn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nCuQjurNkBrhODlJsMeLvakirNJPuuoj5LNhLM7ENoU=; b=r3HVj/48nqiw2iOTrPrBWvxGHr
	SuU//eU6VAlmqaqV+jZgXsjSxXqt/BIZOgLSN2hwf3dKPpu5cTAvqRw1tuQtYOZKzLuCxcTVJar15
	ClfFe5vW9uta/ef5YAcH9hPRlsI+3ZEDHTnNwX4Ms0nfn0AJrD60wR04JebpJJ7gMDhQyEzoIhrGV
	EuV3y1PyMo36mEtBNodraXVKUirJNS8BxIRXj4OFm9m0cfOUJQEYuIZomF1P71RmJHuWjVKbofVov
	owed37KRwt8URkj7LlBigdYi+za10DlRLxvEvkjy3GjqYg88LP+aHFa8t0fHwMDhkcTiMDoBDZ0P0
	4Hx64/rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaz7-00000004srr-0kKv;
	Mon, 23 Nov 2026 20:49:57 +0000
Received: from out-14.mta0.migadu.com ([2001:41d0:1004:224b::e] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVayp-00000004smP-3biO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 20:49:42 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=GslayrUh5jOBi24MwEsHAPtHoCFsndl70v3CwuOZjbo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795466977; v=1; x=1796071777;
 b=XEOts8ynYCBW/WVWhmQZHcE34VWYg1kfQ8kwQfEpCcNQmNXnULrLWNd8z8sXCQxvufFVqhzs
 hxK0ls/6/4QWbJnTDrA2nOmHMPyleRNKkge8r63dBcpwtevCbGDf5rZN0Cf7BdKoAix9HVssOSu
 F3kFYxsMkd3pxHB/vDtUfR/s=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 65ddc5328c6ce3de;
	Mon, 23 Nov 2026 20:49:37 +0000
X-Mizu-Trace-ID: 65ddc5328c6ce3de
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so16678e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 12:49:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEN4NBibKlWldFCGVLpjXfJbdHOM4aezBKcG54zHFVg42roUR/Ea9YF0v7stF0zMDU9BJc0/DZOCfT2B2L7nWcb@lists.infradead.org
X-Gm-Message-State: APuU4Z8BxmZmBIHlbyOsF5wjyH34GflizlNoT7Ka9IoSb92J1HPuEviK
	tBoo7uc742OD0VfIoLiJizWIj/IHlb0iH4ArHMLMxR2EtTZQN8FNiXtPrzklgo/109Rn6qt9wDR
	/F+bifhfcC4ji8NFcp5oqlhKg6IXdMvnCLvsETgXl
X-Received: by 2002:a05:6512:32c8:b0:5bf:b994:6598 with SMTP id
 2adb3069b0e04-5c21a1ebb99mr287911e87.6.1795466971954; Mon, 23 Nov 2026
 12:49:31 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117174403.58762-1-vdonnefort@google.com> <20261117174403.58762-22-vdonnefort@google.com>
In-Reply-To: <20261117174403.58762-22-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 23 Nov 2026 20:49:00 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzZkAf8+BGNH15TKCEYUyO=VFvGSeJg5hfaFoefNOTVpg@mail.gmail.com>
X-Gm-Features: Aa3M54r9cn_5IcZ4PEjyUKyB1amw4J-LOqeK80O8c1MAQXjvtC5KEKyQbMQd49U
Message-ID: <CA+EHjTzZkAf8+BGNH15TKCEYUyO=VFvGSeJg5hfaFoefNOTVpg@mail.gmail.com>
Subject: Re: [PATCH v4 21/23] KVM: arm64: Add PKVM_HYP_REQ_SPLIT
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com, weilin.chang@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_124940_828490_C82E5A42 
X-CRM114-Status: GOOD (  11.54  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vincent,

On Tue, 17 Nov 2026 17:44:00 +0000, Vincent Donnefort
<vdonnefort@google.com> wrote:
[...]
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index c55b6d442d0e..58ca7ffa68e3 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
[...]
> +static int __pkvm_pgtable_stage2_split(struct kvm_vcpu *vcpu, phys_addr_t ipa, u64 size)
> +{
[...]
> +        ret = folio_add_pins(page_folio(pfn_to_page(mapping->pfn)), nr_pages);
> +        if (ret)
> +                goto unlock_mmu;
> +
> +        ret = kvm_call_hyp_nvhe(__pkvm_host_split_guest, gpa_to_gfn(ipa), size / PAGE_SIZE);
> +        if (ret) {
> +                for (int i = 0; i < nr_pages; i++)
> +                        unpin_user_page(pfn_to_page(mapping->pfn + 1 + i));
> +                goto unlock_mmu;
> +        }

Could you use unpin_user_folio() here, to mirror folio_add_pins()?

[...]
> @@ -765,6 +890,23 @@ bool pkvm_force_reclaim_guest_page(phys_addr_t phys)
>          return !ret || ret == -EAGAIN;
>  }
>
> +static int pkvm_hyp_req_handle_split(struct kvm_vcpu *vcpu, u64 gfn, u64 nr_pages)
> +{
> +        phys_addr_t addr = ALIGN_DOWN(gfn << PAGE_SHIFT, PMD_SIZE);
> +        phys_addr_t end = ALIGN((gfn + nr_pages) << PAGE_SHIFT, PMD_SIZE);
> +
> +        while (addr < end) {
> +                int ret = __pkvm_pgtable_stage2_split(vcpu, addr, PMD_SIZE);

Could you drop nr_pages from the split request? Patch 22, the only place
that raises it, passes 1, so this loop runs once.

Cheers,
/fuad

