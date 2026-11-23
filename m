Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F52606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hkVNo9lB;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xuOVMtZ6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IgLGsvO6I1cVesMXGOLiV/+5WDdxgMcaxBy6FOWw03c=; b=hkVNo9lBJLrhM3zYrgmeK4qfP5
	GYS7+msn2Qk5rwUhrT6VJjqkdtuvvEUmINNDCWS2AKH8SFdlOrL4NAnnRjVQ1VhSV6aZws6Vgx17u
	YNn+4FqaGdyfYr8zdVkMoJnS+agtozGWYjsuoScph/pUoWY8L0EZ6ZpqBFDYWBi8vxHi75i8BJLoO
	lncI+tk9V1GTyXYoxwnzMAJRy3mtkk5TJkOlF5sexF/b0d8BbZcHbjIPyFOePimkk12AjfKzC7NNp
	ITvTV42B7ieWMG1YvccO01iiKz1caxa83AksGY72Vim9zVM0cZ+IEwPl0cDQO1FX51vqgzRlwQubC
	ZQ7GAdvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVa11-00000004kOV-0rRH;
	Mon, 23 Nov 2026 19:47:51 +0000
Received: from out-151.mta0.migadu.com ([2001:41d0:1004:224b::97] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVa0x-00000004kO6-44Me
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:47:50 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=IgLGsvO6I1cVesMXGOLiV/+5WDdxgMcaxBy6FOWw03c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795463265; v=1; x=1796068065;
 b=xuOVMtZ6w5sYirb6lMba5gJ+UElrac0P4xnk5+xriioNnsdjIrHyJHuAFHRMX7jkYnsA8QFq
 7Jr65DULFQtTjMf3Gl5VLD14V67RkJWV9sZwBpafDhloKV+uadzSa9AnPCNeGx/lApbFN6cZcsJ
 hE2sfPmJGUeqSMyWb/1DzJZo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 9f04c3274e615659;
	Mon, 23 Nov 2026 19:47:45 +0000
X-Mizu-Trace-ID: 9f04c3274e615659
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c14bc5a743so15861e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 11:47:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEQsGI2z9b+CpBBXZGn2e33f3K0iqZxyRQCih7pMvP7jv0D2QbFPXWEakF+GL/W1s+Fj73+Kc8h9WXTUhcM2VRg@lists.infradead.org
X-Gm-Message-State: APuU4Z94wue55F0saHccxf9Xr7ULFky5m0RS0zy4yn7k9BpzVWefAv9p
	nI+nm53XLcSw+83JNYrRlGOE7n7CYNHuPmXRos29FzPqYhDTX/DHfF8CxH4CgVirpA9lK3OEKYN
	F8eaBIFVIhwF72ce289G9lJkracRj28ovCgI9N/3z
X-Received: by 2002:a05:6512:2342:b0:5c1:56f6:2f50 with SMTP id
 2adb3069b0e04-5c21234bb6bmr259897e87.1.1795463263390; Mon, 23 Nov 2026
 11:47:43 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117174403.58762-1-vdonnefort@google.com> <20261117174403.58762-12-vdonnefort@google.com>
In-Reply-To: <20261117174403.58762-12-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 23 Nov 2026 19:47:06 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzXp-id_CFECB+X-F7GZ9etswCVknWbZzC=euZk=1psSg@mail.gmail.com>
X-Gm-Features: Aa3M54rgmBRXFm63EaKcGRVndPx-0D9msphFQcyS8e9jJT3_VFzFGgPwCV7sANA
Message-ID: <CA+EHjTzXp-id_CFECB+X-F7GZ9etswCVknWbZzC=euZk=1psSg@mail.gmail.com>
Subject: Re: [PATCH v4 11/23] KVM: arm64: Add a range to __pkvm_guest_share_host()
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com, weilin.chang@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_114748_927364_DE99AEAC 
X-CRM114-Status: UNSURE (   7.38  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vincent,

On Tue, 17 Nov 2026 17:43:50 +0000, Vincent Donnefort
<vdonnefort@google.com> wrote:
> In preparation for supporting stage-2 huge mappings for protected VMs,
> add a nr_pages argument to the __pkvm_guest_share_host() hypercall. This
> range supports only two values: 1 or PMD_SIZE / PAGE_SIZE (that is 512
> on a 4K-pages system).

__pkvm_guest_share_host() is a function, not a hypercall. Also, the
MEM_SHARE hypercall still passes one page.

Cheers,
/fuad

