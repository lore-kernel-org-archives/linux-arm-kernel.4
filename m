Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37933606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 13:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dMvEJM6q;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kau27htR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7NlW+FgjysmHMnzkxFKX17sDt3W0d1ei1PekI6+t+P0=; b=dMvEJM6qtkP4w+dbst4f6MsjhM
	nZ1bW+Aatt1mTDsZHkiNghquM/gjdYanT4gdaFRvcPdZQM8gfUsKWMi6lzxCoRNO5Lr/wR8RAP41q
	Jy99Ldg1neFftvG8dQG9QaPXKRm1O87BVv7mU6z0LFNn5Y810AH+DlVGlMrbCEC7JgIcwK+HCYan/
	ClS9pS4DqG0I7TBZ+ptxbG3wv76GG4r5wu0bJLKac3U0cmCr75aiyufG1fJhYRWu7NK3TFfIm4fSK
	0OJz+j81I/AYYSZ7LiNMg4x+yden30bjotBxVJllsvKpbWUSFYhD5h6hlmz2zBTtZ/FpS+RRvC0WM
	PEbB4DpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVU6n-00000003Zi0-1KBE;
	Mon, 23 Nov 2026 13:29:25 +0000
Received: from out-65.mta1.migadu.com ([2001:41d0:203:375::41] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVU6k-00000003Zg1-2kRa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 13:29:24 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=BqxPQ9dHVKr6euzRtYVNyX6SshL4LBsKIsbxv3eX7kk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795440558; v=1; x=1796045358;
 b=kau27htR4my3OhG/SINZABOn4Kxc9/8EpA/dLBEEJsKXYOPCPpY/IrC0OTUlYq2mx1EuvTaT
 Mb1h75z16v1YZpDZZcomqsKPXGTZnitWGfne13NNafFq3W8xX6dcgXHcwsuMI9CVaTGPiMK0/13
 +HFvQHnlT1DsBA8XPkuDn0eg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 53ddbbf26cb85265;
	Mon, 23 Nov 2026 13:29:18 +0000
X-Mizu-Trace-ID: 53ddbbf26cb85265
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be58ad9600so10960e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 05:29:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF0APQE0Zuf1PZ8OcQdzWR3dmdxGkmCs8/bRGukQ0Gw49fRt92CnFaoGkee8wiWE3y40P9CSac7j/IgimmKV6uD@lists.infradead.org
X-Gm-Message-State: APuU4Z9T73zlXiYmeGUfNn3CkhT4yjjJquQQLpuZJYR1McII+IsN+8yj
	uWNP+5XJ+Xcc1pasbYmrXe0eYNibzapIAN98TdfLQbXywYvRzjMBFV2u2/B08xpcXF8dpoeariP
	3uXV6zsG84lnRyLH8nQPJFsy8fO1GEiWgoKRykLyV
X-Received: by 2002:a05:6512:124e:b0:5c1:a93b:13c2 with SMTP id
 2adb3069b0e04-5c1c8276424mr228955e87.6.1795440557447; Mon, 23 Nov 2026
 05:29:17 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116192933.3266502-1-fuad.tabba@linux.dev>
 <20261116192933.3266502-5-fuad.tabba@linux.dev> <86jym3zoq4.wl-maz@kernel.org>
In-Reply-To: <86jym3zoq4.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 23 Nov 2026 13:28:40 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzOf6k3rvcrWK83QTKC98O5cdt8GSMQxc1yBwvv_FftOQ@mail.gmail.com>
X-Gm-Features: Aa3M54rqkkHhCwgMSlFFvyRw4hHY0llS5vEglhNNQ4qWm5RVErUKegxr923W6b0
Message-ID: <CA+EHjTzOf6k3rvcrWK83QTKC98O5cdt8GSMQxc1yBwvv_FftOQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] irqchip/gic-v3-its: Zero ITTs reused from the ITT pool
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Zenghui Yu <yuzenghui@huawei.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Steven Price <steven.price@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_052922_836066_A54042F0 
X-CRM114-Status: GOOD (  15.49  )
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

Hi Marc,

On Mon, 23 Nov 2026 13:01:07 +0000, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
[...]
> > @@ -270,8 +270,10 @@ static void *itt_alloc_pool(int node, int size)
> >
> >          do {
> >                  addr = gen_pool_alloc(itt_pool, size);
> > -                if (addr)
> > +                if (addr) {
> > +                        memset((void *)addr, 0, size);
> >                          break;
> > +                }
> >
> >                  page = its_alloc_pages_node(node, GFP_KERNEL | __GFP_ZERO, 0);
> >                  if (!page)
>
> If we are going to zero every ITT that is dished out to the driver,
> then there is no point in asking for the page to be zeroed the first
> place, is it?

I'll drop it in v3. Until [1] is in, __GFP_ZERO is what clears a page
before a pKVM guest shares it with the host.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261116110549.1863653-1-fuad.tabba@linux.dev/

