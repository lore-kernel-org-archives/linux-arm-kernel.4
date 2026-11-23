Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE798606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pL/+v8tm;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=nYAMMILk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wWziWSTeBoEeo7z7AajzcN/FvNVLiiTCaXNIHvNDjy8=; b=pL/+v8tm+e5EP93KYnO7q2MGc0
	LL5E34Xp0teU/iF6cSEe2+fRZW5S70IEN79fJnCqy6CCBo/WCe/NlB+t2hpe0inwq6iQJzhsnrjWE
	mtVzL/wVvcKHsMGlbv6jas8aX2w9sw3XV6UcsqEPkcewdwitv/zYxCMYlkmOMZjZh5KAxsv9emqKa
	Oz7xttPmFmEBJ749I372i8jcOQ4O6oFomUNnRo8cwNHLshRMWIflPOV5j+vZTfXwZbKJ76jpjzi8c
	Ydhyj5yvFP+1q67uAnZ6L0QCkFfnbNJgq4F/+hxvU6j3atIgB3oV3pewA1sEbFx56LBgqemgzUjDp
	y6e/5aew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaAO-00000004la6-1E81;
	Mon, 23 Nov 2026 19:57:32 +0000
Received: from out-114.mta0.migadu.com ([2001:41d0:1004:224b::72] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaAM-00000004lZa-0XLc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:57:31 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=TlIRJjfDNJE45hvMPBudJSR47q++R49DsKUCdwnCWQ0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795463847; v=1; x=1796068647;
 b=nYAMMILkvuNpDXXR8PUW2uTiE8iBCjeoXsZBHT7KTgZT2BczePllX7Lzecj5TV8ONnm6b3Lj
 kJub2oMCtM/UkTqfEZ/QbN12T2DSVKxdu7wnTCFrL3RackKdf9OsriH1w3nLKp8xtCC2+eDOarX
 6uIfDosfrw+NprvlwHBowGyI=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6a338faacbc93918;
	Mon, 23 Nov 2026 19:57:27 +0000
X-Mizu-Trace-ID: 6a338faacbc93918
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so12574e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 11:57:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGaPBGthTJjlwA5sLxrc7hwdryWOWDUQf3JEcjU/q5DQYnT7aNiLmlSw6TS9FUInY9sy8Zi+vEtvbVqE0rBtqo8@lists.infradead.org
X-Gm-Message-State: APuU4Z9S8PNfKOzXGT1J9onqfKpB9d3VHmgSu2SwWg2Py7I5gdI92Ui9
	ytQIj0R/8TuJOjT2lIts87uKIgm9WoRSovTLkoND8gdgXBA9OJYrddRnCP/gXaUKFqgBvS6ks8H
	9iIMTBeanlFVMSPQrDQ2LssCKJif1tv6yPWdzqUik
X-Received: by 2002:a05:6512:32c8:b0:5bf:b994:6598 with SMTP id
 2adb3069b0e04-5c21a1ebb99mr278454e87.6.1795463845647; Mon, 23 Nov 2026
 11:57:25 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117174403.58762-1-vdonnefort@google.com> <20261117174403.58762-16-vdonnefort@google.com>
In-Reply-To: <20261117174403.58762-16-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 23 Nov 2026 19:56:49 +0000
X-Gmail-Original-Message-ID: <CA+EHjTyzbeZ34bp-TnvVibHubgwZFuFbLZCRRSF-kbM1wXb=Wg@mail.gmail.com>
X-Gm-Features: Aa3M54r9LDW6mKOgcZNbLjoMHsuPqbG8zuF6ezqiECWli5T2bHoqhg9wWtfugXM
Message-ID: <CA+EHjTyzbeZ34bp-TnvVibHubgwZFuFbLZCRRSF-kbM1wXb=Wg@mail.gmail.com>
Subject: Re: [PATCH v4 15/23] KVM: arm64: Add a range to pKVM ownership selftest
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com, weilin.chang@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_115730_350256_E7E54D0E 
X-CRM114-Status: GOOD (  11.02  )
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

On Tue, 17 Nov 2026 17:43:54 +0000, Vincent Donnefort
<vdonnefort@google.com> wrote:
[...]
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index 4c80e0960154..ae53c701206a 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
[...]
>  static void __init pkvm_ownership_selftest(void)
>  {
>          unsigned long pgtable_order = 5;
>          unsigned long pgtable = 0;
> -        unsigned long page = 0;
> -        long ret = -ENOMEM;
>
>          /* Memory for the VM page-table */
>          pgtable = __get_free_pages(GFP_KERNEL, pgtable_order);
>          if (!pgtable)
> -                goto out;
> +                return;
[...]
> +        __pkvm_ownership_selftest(0, pgtable, pgtable_order);
> +        __pkvm_ownership_selftest(PMD_ORDER, pgtable, pgtable_order);

Could you skip the block case with a message when its allocation
fails? With 64K pages it's a 512MB contiguous allocation, and the
selftest prints a failure when it can't get one.

Cheers,
/fuad

