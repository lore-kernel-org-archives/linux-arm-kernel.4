Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50AD606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 12:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uURW8TGY;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=fLJ0giQ0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PoHSByiLzGdhwKCPkw7GydNSvKREW6xhEq690uMockc=; b=uURW8TGYK0T4L0
	QIQmF2UrsoRfF9hCeWsGRKPIqQBGn5CJ7yOH0dXBwLNcc+yzL4kbaXSn0bWx3qnU71wc612Hoexjh
	5GsEwTzh6dVdv/I8LCqCzdgZzaN6SQbuFnAvZhre8zEB55oLcQqhkSPCPkLuOXEl/4bq5Mv6J+0OC
	nxlppI3qZBIf1JTZaJT+2n7HJJFJu5jh74OObCPA5VwzJJI+bQb+nitACUSGfRVJVKmjlfH/8yQST
	HoYkFd6DG0eDzKjzOUeFFJPt/6/Bz4gFE5ZVP+OWjfl11f7mCf0E1coQ7+YnZZRnGvJgqtQs4ILjV
	C/l1YnRnt54l6TldcU1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTcI-00000003UDB-0IXe;
	Mon, 23 Nov 2026 12:57:54 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTcD-00000003U9s-0Wvq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 12:57:52 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=PoHSByiLzGdhwKCPkw7GydNSvKREW6xhEq690uMockc=;
	b=fLJ0giQ0zHqLiWnay8Nnms5EjCOiVmAb8a2R8Qp+2GS63AA/IpG/31Ba1wKQVTbFs421PaHz9
	Xn8yrpVRQdVlQ807vP1e4Jb3ILrcaEtH13wJcMlFNJcRiOF2BeApQfuCrijXU2MvHOdeHycuoNQ
	tKnTlGYpovN2d8ihlo1IpnE=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jY5Yj4rSQz1T4Fs;
	Mon, 23 Nov 2026 20:56:57 +0800 (CST)
Received: from whupemo200006.china.huawei.com (unknown [7.152.185.252])
	by mail.maildlp.com (Postfix) with ESMTPS id B874540537;
	Mon, 23 Nov 2026 20:57:44 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 whupemo200006.china.huawei.com (7.152.185.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 23 Nov 2026 20:57:42 +0800
Subject: Re: [PATCH v2 1/5] irqchip/gic-v3-its: Order table zeroing before the
 GIC can see it
To: Fuad Tabba <fuad.tabba@linux.dev>
CC: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu
 Rendec <radu@rendec.net>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Steven
 Price <steven.price@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Will Deacon
	<will@kernel.org>, Fuad Tabba <tabba@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261116192933.3266502-1-fuad.tabba@linux.dev>
 <20261116192933.3266502-2-fuad.tabba@linux.dev>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <59e9fad1-1f11-afb9-e1dd-e68da335eca6@huawei.com>
Date: Mon, 23 Nov 2026 20:57:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261116192933.3266502-2-fuad.tabba@linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 whupemo200006.china.huawei.com (7.152.185.252)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_045750_164905_51EA248B 
X-CRM114-Status: GOOD (  14.44  )
X-Spam-Score: -4.5 (----)
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026/11/17 3:29, Fuad Tabba wrote:
> The ITS driver allocates the ITS tables and the vPE tables as zeroed
> pages. It exposes each table with a single store: a relaxed
> GICR_VPROPBASER write with Valid set, the relaxed GITS_CTLR write that
> enables the ITS, or a valid level-1 entry for a level-2 page.
> However, on a shareable table the zeroing isn't ordered before that
> store, so the GIC can read the page's previous contents as table
> entries, which the spec makes UNPREDICTABLE (IHI 0069H.b 5.2.1, and
> GICR_VPROPBASER.Z in 12.11.39). A level-2 page is exposed at runtime,
> when the GIC may already be walking the level-1 table for other IDs.
> 
> Add a dsb(ishst) at the end of its_alloc_pages_node(), as
> its_flush_cmd() does for a command. The allocator doesn't take a
> shareability argument, so the barrier is unconditional. On a
> non-shareable table it doesn't hurt.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  drivers/irqchip/irq-gic-v3-its.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>

