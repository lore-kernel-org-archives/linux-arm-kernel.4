Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01408606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kllfJCkj;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=avj494TK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VTayRZy96830KSV7f6wsXnSstyeYaZLryI30VcYM53A=; b=kllfJCkjBExZcvt+2Y7sz1GLcb
	Z48WCv5ai4OPAnJdbwZIvVM5ZmquICuGNSn8n/06lOogztRYS+zoA+lq50v5y/RgBGwmk69mEhwZo
	BD+pRU0867NnaeCmVDeiXHCIX0RhhdbkNbZAkeGGHTjBJ6dc60VG8qrMcSFEDVYvglp9juk/tav0D
	Twf3epqZYjhSN/eLkuUBSNsSmszf+DFj5qZwrjXL49idYed8QLEx4ZUpHWAJJTFQQa0rCDwmWWoAN
	URjzndJaCZwUzhosctgs+HZUf6U6xPVZ4X6Wierr8K/TNEFXMMMMKXtd+tGXQKS510GYjJPYzY1og
	1Gc1v8DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZf6-00000004ecp-2JxJ;
	Mon, 23 Nov 2026 19:25:12 +0000
Received: from out-231.mta1.migadu.com ([2001:41d0:203:375::e7] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZev-00000004eZq-1gBw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:25:10 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=u4m8lL2KdbFjVQEXYzTGdkreUDCwR6VcjSIzYNXl6Dc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795461898; v=1; x=1796066698;
 b=avj494TK6psRmNsw1FLAjpFpfUQVc5GwwdRWd45Qu90GIUhOhauqSNwBDLKFwDKUOF+76XhY
 +dIHbgKqH+lZRlAHQ1QJa170FFQLb3ugRfG4HVVy39VYCIOxGqaETKaexR/7hL/F8B5WrKCbHgn
 egm2+9KwtO4rFnYO+7h6QRLU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 53eb183e57c7fe91;
	Mon, 23 Nov 2026 19:24:58 +0000
X-Mizu-Trace-ID: 53eb183e57c7fe91
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so15600e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 11:24:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFHoFr7Jw0bAUZsyD0eV6c+tXTfyefb1ydqoXwr5vUYy4w2XjCfsKv5v7Xs/Wl5ZDmaMh7u1IhuplxLwW1sgknT@lists.infradead.org
X-Gm-Message-State: APuU4Z+w3F0TD0cL77eUn0MvISZHNOJRRtQ0X3PMtIc6q59weh9mprLj
	jDs1miejPtR6Yd5tnwxuTfnC+dHhwRbvwjxAOq+2wM6liApiIzlj/14v9iYKiNcP11PFInUucdZ
	N4ecbN21pmfLPgSB6ZUGM1dW0AIgGL3F5GpiOEMdR
X-Received: by 2002:a05:6512:3a87:b0:5c1:543d:2e3e with SMTP id
 2adb3069b0e04-5c21a249a25mr260653e87.7.1795461892671; Mon, 23 Nov 2026
 11:24:52 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117174403.58762-1-vdonnefort@google.com> <20261117174403.58762-2-vdonnefort@google.com>
In-Reply-To: <20261117174403.58762-2-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 23 Nov 2026 19:24:16 +0000
X-Gmail-Original-Message-ID: <CA+EHjTyCo3oUiRUeLQ_YStLAzmD8J8i1kJD4H8qYLyn5EHdp=Q@mail.gmail.com>
X-Gm-Features: Aa3M54qeQzSvLkH5nDFzJvMHktdafiAhP3uLr3VXVmWB1KOnGb85PRMxO-t136I
Message-ID: <CA+EHjTyCo3oUiRUeLQ_YStLAzmD8J8i1kJD4H8qYLyn5EHdp=Q@mail.gmail.com>
Subject: Re: [PATCH v4 01/23] KVM: arm64: Prefault host stage-2 entries on
 block split
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com, weilin.chang@arm.com, Keir Fraser <keirf@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_112502_261763_FF396F66 
X-CRM114-Status: GOOD (  10.17  )
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

On Tue, 17 Nov 2026 17:43:40 +0000, Vincent Donnefort
<vdonnefort@google.com> wrote:
[...]
> diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> index 9c83837b184d..dfbcdd3d91a4 100644
> --- a/arch/arm64/kvm/hyp/pgtable.c
> +++ b/arch/arm64/kvm/hyp/pgtable.c
[...]
> @@ -1053,6 +1095,9 @@ static int stage2_map_walk_leaf(const struct kvm_pgtable_visit_ctx *ctx,
>          if (!childp)
>                  return -ENOMEM;
>
> +        if (pgt->flags & KVM_PGTABLE_S2_IDMAP)
> +                stage2_map_prefault_idmap(ctx, childp);
> +
>          if (!stage2_try_break_pte(ctx, data->mmu)) {
>                  mm_ops->put_page(childp);
>                  return -EAGAIN;

Should kvm_pgtable_stage2_annotate() end with a dsb(ishst), like
kvm_pgtable_stage2_map()? With this patch, it installs valid leaves in
the host stage-2 too.

Cheers,
/fuad

