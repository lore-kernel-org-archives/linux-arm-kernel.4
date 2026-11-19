Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7B1606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 12:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Yxz5he6B;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JcNiaom0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PmHoASv/ZBuNPegMJO4sTM3s780shpGIpjr17DZNI+c=; b=Yxz5he6Bzs6Hf4gODjLwSzx9mY
	+sneJZipbZVGjq5uxqei+bNOJ4hdSux0SnFl2C/kX+DWkx/kh/Ej+vwlB4gYWO9PpfoHF0Goqza8V
	CDr9ZsRuiTAKS80nCFlu2zSqtMTwLUyu0Wm27UKPz3BhpEBH+eXiG7c+ubHRefHIc4Ju0QpfCQ/YQ
	afVpQ2KAjjYHT9AdQNaDKbCFxm9Xmfev6kLdixhiJM48PuX0BCIfqIInM8NzmhbhNkU9CpRUygN9U
	0khno/UWd6gTaIKShWwK02LeqQ7NqMdbU993EDEXyqbMeifQ7PkbRPgrj0alWcu5pqiDql6XrL3x2
	EHnaBxTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0p0-0000000Bm2q-3rfE;
	Thu, 19 Nov 2026 12:00:58 +0000
Received: from out-99.mta0.migadu.com ([2001:41d0:1004:224b::63] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0oy-0000000Bm2L-0i6z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 12:00:57 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=LSXZMF3S7OYOJHwM1QSRH7X80XNBYndcmXoKDDjQXdg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795089653; v=1; x=1795694453;
 b=JcNiaom084owNwZqSnrrQWawStu6CpfrOds3bxCNBUmisDYAV5jLt80M6aV7x4DZ2XEZuTHG
 PAdWoDzrSVwwtYghsKe78V7gAJPe6qD7nrlEMzVirKdWzCMp7BkroCx6MzL0EWJJBnHHlanJXMo
 g2Is46PeWltpRgs++gHpwPis=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7bf49391f9303bed;
	Thu, 19 Nov 2026 12:00:53 +0000
X-Mizu-Trace-ID: 7bf49391f9303bed
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c00d7ac49dso5149e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 04:00:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGDZuKBDKJ0XQR5pyasDBzNKKJr634DAXmB0daLo+zVmPkjaGRd9MXRO17sA0w41HysIQC0uFRmvJQKA8LKBxh0@lists.infradead.org
X-Gm-Message-State: APuU4Z8zKxEx6WBkBvs77MNgCLc9BZnrUDgJSjgkwlS25VfxsOk41nS+
	UXMZvzWmr+SBNYFdwfZywbDd/9bo/b7Xb3dYQ7hU3O9EC4geP8HLroY/PCWhBKX/lhhgHGkgj6o
	gU67aGmtqctQmxci9qCi7rcoeC/PjS+gVk3pl6E27
X-Received: by 2002:a05:6512:3c9a:b0:5c1:488e:a067 with SMTP id
 2adb3069b0e04-5c1b67e0252mr59074e87.16.1795089651342; Thu, 19 Nov 2026
 04:00:51 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com> <20261118-host_gicv5_fixes-v3-4-13c1859e8aa3@arm.com>
In-Reply-To: <20261118-host_gicv5_fixes-v3-4-13c1859e8aa3@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 19 Nov 2026 12:00:15 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzPFjUOXCiccswH2xGvbiqgXPbSihov7MA0WuXn-SmrEg@mail.gmail.com>
X-Gm-Features: Aa3M54q0cGXEpu0u_MHtlVc61lpQYDybJxHzFMkhhDm4bjBsec_uETwUsiLZ0mQ
Message-ID: <CA+EHjTzPFjUOXCiccswH2xGvbiqgXPbSihov7MA0WuXn-SmrEg@mail.gmail.com>
Subject: Re: [PATCH v3 04/14] irqchip/gic-v5: Retain the L2 IST when mapping
 times out
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Cameron <jic23@kernel.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_040056_410830_7B33042B 
X-CRM114-Status: GOOD (  11.82  )
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

Hi Sascha,

On Wed, 18 Nov 2026 17:35:33 +0000, Sascha Bischoff
<sascha.bischoff@arm.com> wrote:
[...]
> diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
[...]
> @@ -217,6 +217,10 @@ int gicv5_irs_iste_alloc(const u32 lpi)
>          if (FIELD_GET(GICV5_ISTL1E_VALID, le64_to_cpu(l1ist[index])))
>                  return 0;
>
> +        /* A previous map timed out; do not overwrite its pending L1 entry. */
> +        if (READ_ONCE(l1ist[index]))
> +                return -EBUSY;

Sashiko's review [1] didn't go on the list, in case you missed it.
Sashiko found that l1ist[index] is read twice, and that on a
non-coherent IRS a map completing after the timeout leaves a stale
copy of the L1 entry in the cache for later allocations. Invalidating
the entry before it's first read would fix the latter. Invalidating it
on the timeout path wouldn't, since a later read can refill the line
before the map completes.

With those fixed:
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

[1] https://sashiko.dev/#/patchset/20261118-host_gicv5_fixes-v3-0-13c1859e8aa3%40arm.com

