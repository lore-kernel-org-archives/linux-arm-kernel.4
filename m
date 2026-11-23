Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C156B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 12:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zg4hLP4i;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=mgtjrai2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=a69ga5LLSiyBCNZhefjJPir9RoZN+HRVRIB9fbGVQXE=; b=zg4hLP4i5qvaIJ
	/SkeBtQpXGYHrwM5U1l85II2yO6WElBn6wWmrZUiZ0ddsiUEOF3sB7nhHVLi9a5hDgJ+SH7+8FcMS
	TUyeNE2rf0lwQMNqrvrNJ45NY+d9lhJ8McEiobjQKM9suCEtb2np+UJUFGVpxuB+4ncPdKyesP/gX
	S+LHe0Dv8dCQa7SNcdCUPMYWR4R2lJ46E+8FUzvVURqEDFj1iNyR9DvX3yeXk/MQtswIPPP2qbmu0
	Iep4fbEmaPlcHEdPgTw8hQ3plRuKWZ0iyS79ttAjSMhYRmQaSwKUL6jmhgHnN1Qg28HtEPsa8mRZN
	5kYDPNDhq3Bq+hTU0rnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTMX-00000003PJf-2Z8X;
	Mon, 23 Nov 2026 12:41:37 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVTMJ-00000003PDB-0WZz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 12:41:24 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=a69ga5LLSiyBCNZhefjJPir9RoZN+HRVRIB9fbGVQXE=;
	b=mgtjrai2mB0FJ6yLrEEfKmRFOGEXP9ZnidbBXtLETZrHw7cWpP7tkoDwMyakeIxM3agAlZvwb
	uFyj0/lfNJLtohOyf7r1BC5iLgV/g9SvWz4yWmnIZblmnX4XTZrGiMLIxNbR3wEsBqX6UZA/jGS
	E7kvstk5DTqhrsRB2LAK3YI=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jY5CK6qb6z1K9Cx;
	Mon, 23 Nov 2026 20:41:01 +0800 (CST)
Received: from whupemo200006.china.huawei.com (unknown [7.152.185.252])
	by mail.maildlp.com (Postfix) with ESMTPS id C023A40586;
	Mon, 23 Nov 2026 20:41:18 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 whupemo200006.china.huawei.com (7.152.185.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 23 Nov 2026 20:41:17 +0800
Subject: Re: [PATCH v2 5/5] irqchip/gic-v3-its: Free the page when
 gen_pool_add() fails
To: Fuad Tabba <fuad.tabba@linux.dev>
CC: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu
 Rendec <radu@rendec.net>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Steven
 Price <steven.price@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Will Deacon
	<will@kernel.org>, Fuad Tabba <tabba@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261116192933.3266502-1-fuad.tabba@linux.dev>
 <20261116192933.3266502-6-fuad.tabba@linux.dev>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <3f9a4b43-f9e1-5b58-95c1-0efbdd76654b@huawei.com>
Date: Mon, 23 Nov 2026 20:41:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261116192933.3266502-6-fuad.tabba@linux.dev>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 whupemo200006.china.huawei.com (7.152.185.252)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_044123_478909_FEF37B2E 
X-CRM114-Status: GOOD (  12.62  )
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
> When the ITT pool has no room, itt_alloc_pool() grows it by a page and
> retries. gen_pool_add() fails when it cannot allocate its chunk
> descriptor, but its return is ignored, so the page is leaked and the
> retry allocates another page to leak, until an add succeeds or a page
> allocation fails.
> 
> Free the page and fail the allocation instead.
> 
> Fixes: b08e2f42e86b5 ("irqchip/gic-v3-its: Share ITS tables with a non-trusted hypervisor")
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  drivers/irqchip/irq-gic-v3-its.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>

