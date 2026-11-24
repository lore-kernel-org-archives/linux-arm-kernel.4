Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD897606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 07:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0RMw/8EO;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=IReWqivt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gq87rGVVD4KSpSFWL7D6d3e24UEKtH1rPNqBfJ2s+4Q=; b=0RMw/8EOsRfZ3X
	LMzmPp+/V6hiEUp24kb4HtWVlEDEhspFO6NmZvfJQjyeZQdwIWPcrS3QdUaS/QizNNccij/NOOB87
	pvrkj2WNDTSW/PIx2b1S6KF3HUxencI14lnv9+7TBoE5E5RgtMphxTdI4CFgJt9IURZq87jElgBew
	ZzUTdr3iCUJ/U1PaUiBZ5Zxk8NZWfoP+0flGx9NDaAowTS3B/t606QKQa+zxx+5aK31cA3UOKnZ/K
	b7me6jHpWsCeECGd/Jwwiwqm0SN4sHPPLq3iVYOyVrGupdqGRiQkwG9+y1b1+SZCSg2aVEh/L8ZHT
	lmH1UepMf1X0LBjI7A8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVl2E-00000005mMp-1uMK;
	Tue, 24 Nov 2026 07:33:50 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVl29-00000005mKb-3X4G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 07:33:48 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=gq87rGVVD4KSpSFWL7D6d3e24UEKtH1rPNqBfJ2s+4Q=;
	b=IReWqivtOsblcN+tXM/8b+ODJiGrLJge40Zj53rVyoXBu732GcajweLdUfVu6XElEMAIEa6T0
	bzq4GYAmSbeufVRem9hKBtjgD0jbcvXBmmHP/3k8UCuSRd8FCfqDrG2jwrACcWUkH7QgVUFHMGI
	/FsvAk2OGug5dfXjXNqerA8=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jYZKj4QBmz1K96m;
	Tue, 24 Nov 2026 15:33:13 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id E704C4056C;
	Tue, 24 Nov 2026 15:33:30 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 24 Nov
 2026 15:33:30 +0800
Message-ID: <5e4d8f95-ae3f-4143-a90e-c3ef51127230@huawei.com>
Date: Tue, 24 Nov 2026 15:33:29 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] resctrl: mpam: Fix potential per-CPU data leak on probe
 failure
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>, James Morse
	<james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, Reinette Chatre
	<reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
References: <20261120173519.3923924-1-liguangshuo@mail.sdu.edu.cn>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261120173519.3923924-1-liguangshuo@mail.sdu.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_233346_422951_5DBD1B4A 
X-CRM114-Status: GOOD (  12.97  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



在 2026/11/21 1:35, Guangshuo Li 写道:
> The PPI device IDs are allocated separately from the MSC. If subsequent
> resource discovery fails, probe destroys the MSC without freeing its
> per-CPU allocation.
> 
> Use devm_alloc_percpu() so the device releases the allocation when probe
> fails. Its cleanup remains valid even if the MSC is freed beforehand.
> 
> This issue was found by our static analysis tool under development.

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> 
> Fixes: 49aa621c4dca ("arm_mpam: Register and enable IRQs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
> ---
>  drivers/resctrl/mpam_devices.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index c067b6d57d71..3e89f9183041 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2351,7 +2351,7 @@ static int __setup_ppi(struct mpam_msc *msc)
>  {
>  	int cpu;
>  
> -	msc->error_dev_id = alloc_percpu(struct mpam_msc *);
> +	msc->error_dev_id = devm_alloc_percpu(&msc->pdev->dev, struct mpam_msc *);
>  	if (!msc->error_dev_id)
>  		return -ENOMEM;
>  
> 
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4


