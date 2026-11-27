Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEA3606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 09:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IWRm/Hly;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dzBSKDZJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Xut3zz3zXoRLkxakwjQf3q4jqPlZOu+LVNDrD9v9huI=; b=IWRm/HlycUZFCQs25hLQGpm2vg
	HdhTDfuq2pKDkWNWJPcHFVcgcfBJvo16PWPXUj4HgL3qJ/P6IUpweXIi7ARBGVpKHToQN+C/5rZRi
	4bbYi0x4pioAyYWcXoK8+WBBHvP5sy00G6653sPZMTcTG5xvEXO1ZwskM+F9M6Tt/G1AHJjDRmaK4
	+sWcYO410sBtYdCPHGsRrE5FxAKCgFK6u8wUiB9SzYfICKl8/f2fUgWdWE3GUaiHX3vanx+LqyJDb
	eg+yPWlrX6ScaKCigT69SGd7U3ZF4Zq7u6VhpQGAPJ/D3JGUFtwecuLs3ERY6XYMImGlTseI01aO7
	gv53vUEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsAA-0000000FPr8-2oP9;
	Fri, 27 Nov 2026 09:22:38 +0000
Received: from out-50.mta1.migadu.com ([2001:41d0:203:375::32] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsA8-0000000FPqb-1wca
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 09:22:38 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Xut3zz3zXoRLkxakwjQf3q4jqPlZOu+LVNDrD9v9huI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795771354; v=1; x=1796376154;
 b=dzBSKDZJB9QARKvRba6mZS+3IXZELdA4m2bLnDQ+f3NUKv9JsUS0d+n3aTkjsm66419Z7HlP
 ioaUdpghcDXIIZWOFoy1t/4nQy0PkgcDaKSuO/9b1f1kv1KPEbYlW+7nF2MuDDQUvJJbUN2jx0y
 jCehbkWfOwJ5pXSo+4OgjNFo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 70fe3c9f9e7a7976;
	Fri, 27 Nov 2026 09:22:34 +0000
X-Mizu-Trace-ID: 70fe3c9f9e7a7976
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so42851e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 01:22:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE2ts1KBAuK47ebIEmUrylOOGRgf2+x9ye/blO99aXU5Zj9ctC/3i1ww83tLx37IV7O9xnuymWQiwGTDEZM7gHC@lists.infradead.org
X-Gm-Message-State: APuU4Z9zeUP4TcEDnSCYg8iqxfpFt6BouJMLq54nq04WAyTDxXB/Lv84
	Cfcj8kuW4YOmdC0gaGU29g6xFlG4XjToaLlnJ/CUf98Oavv1SPCJXkA8otwTtGiflJ+D4/75W4O
	JRJf5qybNuEtYwp7tBaB6I3JRsyL/Hv0aaicMl2sv
X-Received: by 2002:a05:6512:158d:b0:5c3:36c0:8a91 with SMTP id
 2adb3069b0e04-5c336c08cd3mr85482e87.7.1795771349523; Fri, 27 Nov 2026
 01:22:29 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117174403.58762-1-vdonnefort@google.com> <20261117174403.58762-22-vdonnefort@google.com>
 <CA+EHjTzZkAf8+BGNH15TKCEYUyO=VFvGSeJg5hfaFoefNOTVpg@mail.gmail.com>
 <awiQzMZxQDEHrRf4@google.com> <awlLEwegiWQZLeay@google.com>
In-Reply-To: <awlLEwegiWQZLeay@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 27 Nov 2026 09:21:53 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzPgQaZ=wwwK2CTyo-m85DdGX6AkfvYqhpBBOGGQ-Ct7w@mail.gmail.com>
X-Gm-Features: Aa3M54oiv4UO_oReuZkjeiZifggq1vhJlLPIvxDymRiZYopzsVCd9x47Vspkp8U
Message-ID: <CA+EHjTzPgQaZ=wwwK2CTyo-m85DdGX6AkfvYqhpBBOGGQ-Ct7w@mail.gmail.com>
Subject: Re: [PATCH v4 21/23] KVM: arm64: Add PKVM_HYP_REQ_SPLIT
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com, weilin.chang@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_012236_841907_C9FE5027 
X-CRM114-Status: GOOD (  15.35  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 27 Nov 2026 at 09:19, 'Vincent Donnefort' via kernel-team
<kernel-team@android.com> wrote:
[...]
> > > Could you drop nr_pages from the split request? Patch 22, the only place
> > > that raises it, passes 1, so this loop runs once.
> >
> > Hum, it is just we have range everywhere now so it feels a bit weird of not
> > having one here. But then I agree this isn't a stable API.
> >
> > --
> > Vincent
>
> Looking at the existing kvm_pgtable_stage2_split() interface, I see it does take
> a size as a parameter and so does its caller. So I wonder if it isn't better to
> align everything and to keep that nr_pages argument.
>
> However, setting nr_page=1 is indeed a bit weird. I believe the hypervisor
> should just emit a PMD-aligned request. I can also drop the loop iterating over
> nr_pages.

That's what I thought, that said, I have no strong opinion on this. I
promise not to relitigate this on the respin, regardless of what you
pick :)

Cheers,
/fuad

