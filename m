Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4922606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 20:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LR/lbSlr;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RbD51UQv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qX1iJKHEG9+QvOjSEHT3WU7TeQW7wThVjS178zhXy+4=; b=LR/lbSlrOZnOn9O+hJYRiPrzNM
	S/xCRmZ4hCPaXztIf5jRNpJaEpVabGU8EP+CilaDUgj7c6EznmB4ZL8qM13/Z0oTs28ggwoOa4N+9
	nOh9noRQnymhntLKji9VeQaPM8B+cRXEimbpnSVSkL42zSCd459CM1LPobdhzqfsgOU+m+LGchhbT
	jNi0uu2Tg5J0Z15tB3XEAHyyeHozmxkxUaS5Bo7C0PlRLB+5IrtC9tcCPIEyh/uDxMvdNSQoOh0zo
	FnUGwe6RIlzcK4scrqSGtY+NXHZJnJNEloYqstNe8iHEJGz3lbqZHxXj/DpekY/LshQ1Mv/qiRnRd
	cf/7VzyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaUi-00000004o7n-0t3s;
	Mon, 23 Nov 2026 20:18:32 +0000
Received: from out-29.mta0.migadu.com ([2001:41d0:1004:224b::1d] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaUf-00000004o6m-1gSf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 20:18:31 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=aiKWy7zIB/oOMpcLNxVJc+AnXjQYawoYeQiKkvCngnM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795465105; v=1; x=1796069905;
 b=RbD51UQvTHgXR7KC/RGVTCoMG8BUXnflaSaNuBI2YXRHiku9ug2683/NIPfrQmuSK1Ly9jgH
 nxEqFWyRzHYd2eIGQDndNk+4CPkDYz6FmXN6dfVdkvhadU508zC1ScMh8nJrNad0Wrz5bJtldAJ
 q34KsEsUCEaMmYNkm/ldDxd0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7e06ac77a659fc5e;
	Mon, 23 Nov 2026 20:18:25 +0000
X-Mizu-Trace-ID: 7e06ac77a659fc5e
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be58ad9600so16657e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 12:18:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFjxwVEjfNsiwiqA7ZHbTy6RXyZQ6IfFyOo2Zghf6iW7mHgd2iMfj7iFsh/yrb1+XqfhMynQROnPYozpCGW6clx@lists.infradead.org
X-Gm-Message-State: APuU4Z86My5OTriPk05BFJgfuvA40yExs6l2KkquOi/Fq3ECh/AgRZYy
	VyDXGfAI5xKpmZpko4NwxWsvlKle6A09VWmSByQP9h/IH+lANp5zsj4CF/xwUiROZ/TTD/DadOd
	k1UwamSI54of030SgAn1UH+7Q1BWtWO6JOlD9CpmG
X-Received: by 2002:a05:6512:3b07:b0:5c1:5972:4216 with SMTP id
 2adb3069b0e04-5c1c822007bmr314704e87.3.1795465100756; Mon, 23 Nov 2026
 12:18:20 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117174403.58762-1-vdonnefort@google.com> <20261117174403.58762-20-vdonnefort@google.com>
In-Reply-To: <20261117174403.58762-20-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 23 Nov 2026 20:18:00 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxshkWxw=hovdwDO=B-DiVMg1R5vv94iHDH0Aszp3czWA@mail.gmail.com>
X-Gm-Features: Aa3M54qdd1OMyU8bTqYh-0RSzzviCnT6SuQdd96WPnmdoS093ygj7s9tYKt3NGc
Message-ID: <CA+EHjTxshkWxw=hovdwDO=B-DiVMg1R5vv94iHDH0Aszp3czWA@mail.gmail.com>
Subject: Re: [PATCH v4 19/23] KVM: arm64: Add __pkvm_host_split_guest HVC
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com, weilin.chang@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_121829_877787_D0CB1458 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

On Tue, 17 Nov 2026 17:43:58 +0000, Vincent Donnefort
<vdonnefort@google.com> wrote:
[...]
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 88af0aec1ea9..e264cfd41e0c 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
[...]
> @@ -672,10 +677,8 @@ static u64 host_stage2_encode_gfn_meta(struct pkvm_hyp_vm *vm, u64 gfn)
>                 FIELD_PREP(KVM_HOST_PTE_OWNER_GUEST_GFN_MASK, gfn);
>  }
>
> -static int host_stage2_decode_gfn_meta(kvm_pte_t pte, struct pkvm_hyp_vm **vm,
> -                                       u64 *gfn)
> +static int host_stage2_decode_gfn_meta(kvm_pte_t pte, pkvm_handle_t *handle, u64 *gfn)
>  {
> -        pkvm_handle_t handle;
>          u64 meta;
>
>          if (WARN_ON(kvm_pte_valid(pte)))

Could you split the decode change and host_stage2_encode_annotation()
into separate patches?

Cheers,
/fuad

