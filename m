Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468AF606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hefgAGVv;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mnu8MBVo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vgsYe7KPFry5vGAlJY0NmB0rWIeyx9jEZizFH8iUmvE=; b=hefgAGVv4cXp0X
	n2I04K9uaLUMWwgwsQOuEn11oziz85EGUNRAJo+GOXCsEeDjPSthPgo9ybBasICtP1OOJ1e3qDZS1
	RR2OrpYfXJ0F/4UPYRJfLVZTwFBs2SLsfq8i8ndX6ufZLBSgU9YQPWG3q7otAg20Ik/CDOJcTKwfC
	8mdfiwvv3jy019QqvlnC8uZAbGlgcD3hGodGqKciGt/OkOnIFpdS/e5IeKrdT2AgKTkBh/O85JQsj
	9ODyuL/X17hi4PUtl6L2XTquv1twe7rY//JRaNNj5a3Eg9G+ZRoQd9EJfsRYpiEVza13hFQy7yH4p
	38SGZSAWgTkIiyDtu0/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8nB-00000009Bos-0sQ7;
	Wed, 25 Nov 2026 08:55:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8n9-00000009BoR-3x38
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:55:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 55C3C41405;
	Wed, 25 Nov 2026 08:55:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D211F000C6;
	Wed, 25 Nov 2026 08:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795596950;
	bh=vgsYe7KPFry5vGAlJY0NmB0rWIeyx9jEZizFH8iUmvE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Mnu8MBVoxumYqteWsAstS9zqXGLgKPyadSkd8o1fkNxDWdBwZwF4hwXzQro0llQzP
	 Z7dBpQFx7C/kUmA1dy9G9uypc3QNuE9Ykf50FNAG0EqzE/V965Ma1KyBdo1U4tAPSz
	 WKG2rt2aXNX/1l7sVRHEolrpOheHimrlcMMEvdmDkEKcIB2H3u+gOyL6aCSBkOmeWE
	 HzUyuNsk/XByWquPy2g8QzLoQaAH5WUX534bYO0/EjwKMwP5WgByBTddNPPO1ZPHTt
	 zqOUH+caFdZV0rOTu38IBn3+IjhL1yBpu+NAqbLQQLFDtOdJoUr6izCommDJ0/Pf47
	 L7YOyALKmKq8g==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 13/24] media: mali-c720: Add Mali-C720 ISP driver
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anthony McGivern <anthony.mcgivern@arm.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nayden Kanchev <nayden.kanchev@arm.com>, 
 Konstantin Babin <konstantin.babin@arm.com>, 
 Linus Walleij <linusw@kernel.org>, jacopo.mondi@ideasonboard.com, 
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com, 
 dan.scally@ideasonboard.com, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261124-b4-initial-upstream-candidate-v1-13-0cb9bde1bd30@arm.com>
References: <20261124-b4-initial-upstream-candidate-v1-0-0cb9bde1bd30@arm.com>
 <20261124-b4-initial-upstream-candidate-v1-13-0cb9bde1bd30@arm.com>
Date: Wed, 25 Nov 2026 09:55:47 +0100
Message-Id: <179559694752.14607.4218343265884065337.b4-reply@b4>
X-Mailer: b4 0.17-dev
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-24 17:07 +0000, Anthony McGivern wrote:
> +
> +static int mali_c720_probe(struct platform_device *pdev)
> +{
> +	const struct mali_c720_discovery_target top = {
> +		.module_id = MALI_C720_DISC_MODULE_ID_PIPELINE_GLOBAL_CONTROL,
> +		.pipeline_id = MALI_C720_DISC_PIPE_GLOBAL,
> +	};
> +	struct device *dev = &pdev->dev;
> +	struct mali_c720 *mali_c720;
> +	struct resource *res;
> +	unsigned int irq;
> +	int ret;
> +
> +	mali_c720 = kvzalloc_obj(*mali_c720, GFP_KERNEL);

Why absolutely nothing here is resource managed?

> +	if (!mali_c720)
> +		return -ENOMEM;
> +
> +	mali_c720->dev = get_device(dev);
> +	platform_set_drvdata(pdev, mali_c720);
> +
> +	mutex_init(&mali_c720->device_lock);
> +
> +	mali_c720->base = devm_platform_get_and_ioremap_resource(pdev, 0,
> +								 &res);
> +	ret = PTR_ERR_OR_ZERO(mali_c720->base);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to map IO memory\n");
> +		goto err_free;
> +	}
> +
> +	mali_c720->mmio_size = resource_size(res);
> +
> +	if (resource_size(res) < MALI_C720_ID_SIZE) {
> +		ret = dev_err_probe(dev, -EINVAL,
> +				    "IO memory resource %pR is too small (minimum %#x bytes)\n",
> +				    res, MALI_C720_ID_SIZE);
> +		goto err_free;
> +	}
> +
> +	mali_c720->clk = devm_clk_get(dev, "vclk");
> +	ret = PTR_ERR_OR_ZERO(mali_c720->clk);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to acquire clock\n");
> +		goto err_free;
> +	}
> +
> +	mali_c720->reset = devm_reset_control_get_optional_shared(dev, "reset");
> +	ret = PTR_ERR_OR_ZERO(mali_c720->reset);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to acquire reset\n");
> +		goto err_free;
> +	}
> +
> +	ret = of_reserved_mem_device_init(dev);
> +	if (ret && ret != -ENODEV) {
> +		dev_err_probe(dev, ret, "failed to initialize reserved memory\n");
> +		goto err_free;
> +	}
> +
> +	ret = vb2_dma_contig_set_max_seg_size(dev, UINT_MAX);
> +	if (ret)
> +		goto err_release_mem;
> +
> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(48));
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to set DMA mask\n");
> +		goto err_release_mem;
> +	}
> +
> +	ret = mali_c720_power_on(mali_c720);
> +	if (ret) {
> +		dev_err(dev, "failed to power on: %d\n", ret);
> +		goto err_release_mem;
> +	}
> +
> +	mali_c720->registers.id = mali_c720_get_id_regs();
> +	ret = mali_c720_identify_hw(mali_c720);
> +	if (ret)
> +		goto err_power_off;
> +
> +	ret = mali_c720_get_registers(mali_c720->hw_version->id, &mali_c720->registers);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "unsupported register layout\n");
> +		goto err_power_off;
> +	}
> +
> +	if (resource_size(res) < mali_c720->registers.context_size) {
> +		ret = dev_err_probe(dev, -EINVAL,
> +				    "IO memory resource %pR is too small (minimum %#x bytes)\n",
> +				    res, mali_c720->registers.context_size);
> +		goto err_power_off;
> +	}
> +
> +	ret = mali_c720_discovery_init(mali_c720, resource_size(res));
> +	if (ret) {
> +		dev_err(dev, "failed to parse capability discovery data\n");
> +		goto err_power_off;
> +	}
> +
> +	ret = mali_c720_discovery_get_module_base(mali_c720, &top, &mali_c720->top_base);
> +	if (ret) {
> +		dev_err(dev, "failed to get top base address from discovery data\n");
> +		goto err_power_off;
> +	}
> +
> +	ret = mali_c720_init_contexts(mali_c720);
> +	if (ret)
> +		goto err_power_off;
> +
> +	ret = mali_c720_init_ctx_mgr(mali_c720);
> +	if (ret)
> +		goto err_power_off;
> +
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_set_active(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);
> +
> +	ret = platform_get_irq_byname(pdev, "isp");
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to get interrupt\n");

Please use modern Linux drivers as an example for your code. All this
should be dev_err_probe or dropped, because core takes care of.


> +		goto err_pm_runtime_disable;
> +	}
> +	irq = (unsigned int)ret;
> +
> +	spin_lock_init(&mali_c720->irq_lock);
> +	INIT_KFIFO(mali_c720->irq_fifo);
> +	ret = devm_request_threaded_irq(&pdev->dev, irq,
> +					mali_c720_isr_top, mali_c720_isr,
> +					0,
> +					dev_driver_string(&pdev->dev),
> +					&pdev->dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to request threaded IRQ\n");
> +		goto err_pm_runtime_disable;
> +	}
> +	mali_c720->irq = irq;
> +
> +	mali_c720->media_dev.dev = dev;
> +	mali_c720->media_dev.ops = &mali_c720_media_device_ops;
> +	ret = mali_c720_media_frameworks_init(mali_c720);
> +	if (ret)
> +		goto err_free_irq;
> +
> +	pm_runtime_idle(&pdev->dev);
> +
> +	dev_info(&pdev->dev, "Media frameworks and entities registered successfully\n");

Drop, drivers should  be silent on success.

> +
> +	return 0;
> +
> +err_free_irq:
> +	devm_free_irq(dev, mali_c720->irq, dev);
> +err_pm_runtime_disable:
> +	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_set_suspended(&pdev->dev);
> +err_power_off:
> +	mali_c720_power_off(mali_c720);
> +err_release_mem:
> +	of_reserved_mem_device_release(dev);
> +err_free:
> +	platform_set_drvdata(pdev, NULL);
> +	if (mali_c720->v4l2_dev.release)
> +		v4l2_device_put(&mali_c720->v4l2_dev);
> +	else
> +		mali_c720_free(mali_c720);
> +
> +	return ret;
> +}
> +

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>

