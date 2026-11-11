Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1E7606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 08:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1JMRb8Y1;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=PNe5BUeX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HIGazGLFZ+omnPFGXPeDAtvbrPwPKBLIFOy6gFksbCA=; b=1JMRb8Y1+bDpiW
	I1It6EkMOcQkbaRfP0u8bAK5TcxKphk5L0OvMc+b4pIs2GgN4lZQa3832dxFQ3e0C1iAb60zmefKY
	Andl9PZcjGfGzZEWRwN9TqMpzwWZHrBdHpEiS+zA82RalPdCX3IlVOx7zPbX6lQ0oInY8cgVkRHG/
	XkkFgi4kCf7jAbyukayr09IGIfyJ8o8cdoWLQ1RGtM30dokxt8vyybapq6G3XNAFcvJthskNqzru5
	IGjTEIjnCAHHuimFdTHFNH+Q7YDOcx19k/ZDIcQhyY6WCLI6bg9dJlGNNupGP7pJ0dTEXX8YaSPqq
	sEFR5QIQ2YFSEBp7fpvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3cj-0000000624Z-0zgJ;
	Wed, 11 Nov 2026 08:24:05 +0000
Received: from mail-m60227.netease.com ([210.79.60.227])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR3cf-0000000623n-29kY;
	Wed, 11 Nov 2026 08:24:03 +0000
Received: from [172.16.12.11] (gyproxy-mailtls1-entmail-virt216.gy.ntes [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 544931115;
	Wed, 11 Nov 2026 16:23:45 +0800 (GMT+08:00)
Message-ID: <ca90a994-70cc-410a-902d-5c4c0aacc9b7@rock-chips.com>
Date: Wed, 11 Nov 2026 16:23:45 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 10/16] pmdomain: rockchip: cycle an optional
 power-domain reset on power-on
To: Jiaxing Hu <gahing@gahingwoo.com>, tomeu@tomeuvizoso.net,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, ulfh@kernel.org,
 p.zabel@pengutronix.de, ogabbay@kernel.org, zhangqing@rock-chips.com
Cc: royalnet026@gmail.com, abel.vesa@oss.qualcomm.com,
 sebastian.reichel@collabora.com, sidong.yang@furiosa.ai,
 u.kleine-koenig@baylibre.com, chaoyi.chen@rock-chips.com,
 shawn.lin@rock-chips.com, diederik@cknow-tech.com, alchark@flipper.net,
 leonard@lausen.nl, jeff.hugo@oss.qualcomm.com, rfoss@kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux.dev, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261108065917.135194-1-gahing@gahingwoo.com>
 <20261108065917.135194-11-gahing@gahingwoo.com>
From: Finley Xiao <finley.xiao@rock-chips.com>
In-Reply-To: <20261108065917.135194-11-gahing@gahingwoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1c9b4b55703a8kunm2d5d490d3aa52c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTE5OVh5ITUIdGRoZS05CH1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=PNe5BUeXIVF4MzdxsakPs8/fbX+x0vjN/3ButBeQnwAzztEQ3I7la/27YHllx5kc1gRV4ixYgpoX1S3VjkkRgaqWsU9UlWaVfc3sYg1A0zzfrMFB2c5xo3ARIWcAg+yLjwkUGuiSG43F1a1sPJfl4bh9g4zSQLZugv05/J69mD8=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=HIGazGLFZ+omnPFGXPeDAtvbrPwPKBLIFOy6gFksbCA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_002402_375029_91B66B4A 
X-CRM114-Status: GOOD (  28.64  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


在 2026/11/8 14:59, Jiaxing Hu 写道:
> The bus interface of some power domains can be left in an undefined state
> after power-on.
>
> On the RK3576 NPU this shows up as a hang on the first register access
> after power-on. Resetting the power domain once makes access work again.
>
> When the power domain node has a reset, the driver gets it and cycles it
> after releasing the idle request and before restoring QoS.
>
> This is optional. Power domains without a reset are not affected.
>
> Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
>   drivers/pmdomain/rockchip/pm-domains.c | 33 +++++++++++++++++++++++++-
>   1 file changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
> index e3cc60fa2277..0f4ea5471792 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
> @@ -19,6 +19,7 @@
>   #include <linux/of_clk.h>
>   #include <linux/clk.h>
>   #include <linux/delay.h>
> +#include <linux/reset.h>
>   #include <linux/regmap.h>
>   #include <linux/regulator/consumer.h>
>   #include <linux/mfd/syscon.h>
> @@ -103,6 +104,7 @@ struct rockchip_pm_domain {
>   	struct clk_bulk_data *clks;
>   	struct device_node *node;
>   	struct regulator *supply;
> +	struct reset_control *reset;
>   };
>   
>   struct rockchip_pmu {
> @@ -688,6 +690,21 @@ static int rockchip_pd_power(struct rockchip_pm_domain *pd, bool power_on)
>   		if (ret < 0)
>   			goto out;
>   
> +		/*
> +		 * Optional: some domains need their reset cycled once power
> +		 * is on. This goes BEFORE the settle delay, not after: a
> +		 * domain that asks for both is asking to settle before the
> +		 * QoS registers answer, and a reset deasserted after the
> +		 * delay would leave nothing between it and the QoS writes.
> +		 * On RK3576 the reset being cycled is the NPU core's bus
> +		 * interface, which is what those writes go through.
> +		 */
> +		if (pd->reset) {
> +			reset_control_assert(pd->reset);
> +			usleep_range(10, 20);
> +			reset_control_deassert(pd->reset);
> +		}
> +
We have tested this across a large number of RK3576 chips and have
never seen this problem. From the design side there is no such issue
either: the bus interface does not come up in an undefined state
after the power domain switches on, so no reset cycle is needed.

The settle delay, on the other hand, is needed - but as discussed
earlier in this series, only on NPUTOP, not on PD_NPU0/PD_NPU1 and
not together with a reset.

If you are seeing a hang on the first register access, could you
share the exact conditions (which code performs the access and
whether its clocks are enabled, firmware/boot state)? That would
help us understand the difference from our testing.
>   		/* Some domains need to settle before the QoS registers answer. */
>   		if (pd->info->delay_us)
>   			udelay(pd->info->delay_us);
> @@ -873,6 +890,14 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
>   	if (error)
>   		goto err_put_clocks;
>   
> +	pd->reset = of_reset_control_get_optional_exclusive(node, NULL);
> +	if (IS_ERR(pd->reset)) {
> +		error = dev_err_probe(pmu->dev, PTR_ERR(pd->reset),
> +				      "%pOFn: failed to get reset\n", node);
> +		pd->reset = NULL;
> +		goto err_unprepare_clocks;
> +	}
> +
>   	pd->num_qos = of_count_phandle_with_args(node, "pm_qos",
>   						 NULL);
>   
> @@ -943,11 +968,13 @@ static int rockchip_pm_add_one_domain(struct rockchip_pmu *pmu,
>   	clk_bulk_unprepare(pd->num_clks, pd->clks);
>   err_put_clocks:
>   	clk_bulk_put(pd->num_clks, pd->clks);
> +	reset_control_put(pd->reset);
>   	return error;
>   }
>   
>   static void rockchip_pm_remove_one_domain(struct rockchip_pm_domain *pd)
>   {
> +	struct reset_control *reset;
>   	int ret;
>   
>   	/*
> @@ -962,11 +989,15 @@ static void rockchip_pm_remove_one_domain(struct rockchip_pm_domain *pd)
>   	clk_bulk_unprepare(pd->num_clks, pd->clks);
>   	clk_bulk_put(pd->num_clks, pd->clks);
>   
> -	/* protect the zeroing of pm->num_clks */
> +	/* protect the zeroing of pd->num_clks and pd->reset */
>   	mutex_lock(&pd->pmu->mutex);
>   	pd->num_clks = 0;
> +	reset = pd->reset;
> +	pd->reset = NULL;
>   	mutex_unlock(&pd->pmu->mutex);
>   
> +	reset_control_put(reset);
> +
>   	/* devm will free our memory */
>   }
>   

-- 
Best regards,

底层平台中心 肖锋（Finley Xiao）
************************************************************************************
瑞芯微电子股份有限公司
Rockchip Electronics Co., Ltd.
福建省福州市铜盘路软件大道89号软件园A区21号楼 350003
No.21 Building, A District, Fuzhou Software Park, Fuzhou, Fujian 350003, P.R. China
Tel: 0591-83991906-8602 Mobile: 18506057603
************************************************************************************


