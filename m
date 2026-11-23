Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BEE606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 09:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2yDHStR0;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=R3rx3qcN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=y9mi2w1yYno+RnF/J2tW0TKKj3lEXumAEJFgp3ZhgyM=; b=2yDHStR0Jxn7OX
	t8DIAGbO+JU+OUm94WCJIKnoKgZM755MkxqjPF0cr8KkUKrID9ayjIz1n6EPYTfN/lyDZFRSPTmiJ
	niQRnLBic2c106tw7fc76RZ5XLrXqLXBu3vzqyHN8OEyNrhOSSjnUlXI4swZ4X2TNOoFJBrkmdK7Q
	zEIINUvskup/K9OiBJlhvd6qlrajhx1d06tqlTr43HShpLXqKJHdz5+I2kGDkvCBKmIgkXZXTcZSN
	XTcX+1iVTxo73MWqim0jn+/OYWJ+3P4zn053hMmAO4cBeeeO9owKqB/VIDwcw4vRJ3gmSrI1hNbdj
	+fHl8V7LRBObiD/7FE6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQBD-00000002fmp-1ofR;
	Mon, 23 Nov 2026 09:17:43 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQAt-00000002fhN-1ylL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 09:17:31 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=y9mi2w1yYno+RnF/J2tW0TKKj3lEXumAEJFgp3ZhgyM=;
	b=R3rx3qcNWp3kFV8z+oHiKzoynzp9KJFxVhRPeM8hbM0FMngX0tDHIlQjuKUlmsgusqe5+Gs6N
	kxT7JxgLoeQKnA9C9RSUhV16JWofRBxqrCqDLHvsXT+EkcHlzqlfuYQWVzsAa19vOtkhiC+qWH9
	u17bhnt7Qyipn3bh5+fdxgc=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jY0gt3X0vz1prmN;
	Mon, 23 Nov 2026 17:16:58 +0800 (CST)
Received: from whupemo200006.china.huawei.com (unknown [7.152.185.252])
	by mail.maildlp.com (Postfix) with ESMTPS id 5478140538;
	Mon, 23 Nov 2026 17:17:14 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 whupemo200006.china.huawei.com (7.152.185.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 23 Nov 2026 17:17:12 +0800
Subject: Re: [PATCH v2 2/5] irqchip/gic-v3-its: Clean the GICv4.1 vPE table to
 PoC
To: Fuad Tabba <fuad.tabba@linux.dev>
CC: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu
 Rendec <radu@rendec.net>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Steven
 Price <steven.price@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Will Deacon
	<will@kernel.org>, Fuad Tabba <tabba@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261116192933.3266502-1-fuad.tabba@linux.dev>
 <20261116192933.3266502-3-fuad.tabba@linux.dev>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <a8d84ea8-c095-e444-dea2-23b92866f970@huawei.com>
Date: Mon, 23 Nov 2026 17:17:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261116192933.3266502-3-fuad.tabba@linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 whupemo200006.china.huawei.com (7.152.185.252)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_011727_530799_F0C804AE 
X-CRM114-Status: GOOD (  20.08  )
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

Hi Fuad,

Thanks for Cc'ing me on the GIC stuff. I'm happy to read them ;-)

On 2026/11/17 3:29, Fuad Tabba wrote:
> On a GICv4.1 system, allocate_vpe_l1_table() sets Z and Valid in
> GICR_VPROPBASER and points it at a freshly zeroed vPE table, but leaves
> the zeroes in the CPU's cache. A redistributor that accesses the table
> as non-shareable reads it from memory, where it might not be zero, and
> the spec makes that UNPREDICTABLE (GICR_VPROPBASER.Z, IHI 0069H.b
> 12.11.39).
> 
> Clean the table to PoC unconditionally, as the driver does for the
> pending table. Testing rdists_support_shareable() isn't enough, since
> GICR_VPROPBASER can read back as non-shareable even when the helper
> returns true. allocate_vpe_l2_table() already cleans the level-2 pages
> in that case. A vPE table inherited from an ITS is cleaned by
> its_setup_baser() when the ITS is non-shareable.
> 
> Fixes: 5e5168461c22c ("irqchip/gic-v4.1: VPE table (aka GICR_VPROPBASER) allocation")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  drivers/irqchip/irq-gic-v3-its.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index 9900c6a53526e..6932dd0a02c42 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -3007,6 +3007,9 @@ static int allocate_vpe_l1_table(void)
>  	pa = virt_to_phys(page_address(page));
>  	WARN_ON(!IS_ALIGNED(pa, psz));
>  
> +	/* Make sure the GIC will observe the zeroed table */
> +	gic_flush_dcache_to_poc(page_address(page), np * PAGE_SIZE);
> +
>  	val |= FIELD_PREP(GICR_VPROPBASER_4_1_ADDR, pa >> 12);
>  	if (rdists_support_shareable()) {
>  		val |= GICR_VPROPBASER_RaWb;

Nitpick: would "irqchip/gic-v4.1:" be a better prefix for this patch?

Otherwise looks good,

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>

Thanks,
Zenghui

