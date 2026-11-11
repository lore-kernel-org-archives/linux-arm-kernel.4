Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3560C606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 13:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=41MvgbTl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iORx3w5FkLYMo5FmpEuyNzVrPoVAC1WcY+wYqaiaaH8=; b=41MvgbTlbYdAw/KVTf+ssyKeOJ
	+m+ojEwNoXmpbjhQhsOf7E1aPpBp8xJh0DZXMJ0EstjcYV9I5NTXB/MUsWMw98qF62MQ3jT/y1u8b
	Ca+x5L+kYa1PArmeqy025K2O+Rs/wEWynBqN39PwvRFuiCLvPJQCb8Ah/is3u+E3spVPCbnWYRLN7
	hajxiUi97Z/AhdX6m9verznUBWDByar0j4YlINjcvQ5C0piT07XkX7g4PMElJ6+ITGZdIDL0MLu+A
	I0cJvx37sKSPVM6V8q++iy5k/waFSVXtei0ra23fKWh1NwC1cwz5wUnTmnAEFmweJAnnMYvDE1XoS
	v3IRgfXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7we-00000006kxw-3XPH;
	Wed, 11 Nov 2026 13:00:56 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR7wa-00000006ktM-3bLR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 13:00:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NUkkZmtpLoz5DRJhCkOhmR3Jen7fBaA1wVYajG6hMe5XlUyKbq3QVzXwvOaSSLLMmI9iaUDioUDmg3MwOazuLEktDZZr43yXP29ZEvej87ePdEck9za2wLxfDE22kLCQdhVza7CNxx7KhmreaaMZG+yWgTAm0D1aBWnzhxdUVayHt6Gua74i2kourRxofvj22V7cWX8j2pSViYHRlDawxcnbEiMqr6nFkjcAEMexA7FHxAf9qy+AMbPRTR3OcPZJmvZi2Kzg1PzqLn29oan1DAnv7fvbsQGkkQcwz9pJjKchJbxdCEybO7aI4foESWFmDT1rfmWRQu4BOand9QSRkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iORx3w5FkLYMo5FmpEuyNzVrPoVAC1WcY+wYqaiaaH8=;
 b=Jc8JkaiqeHWWeBAEnYpgpIwIN/kNSmrdnz6yDBmXVu/8ULzOeIkjzhFur8J0IEHIYG+JN7eI0d8Scanb6/TxImN3SVwQF+n8fZvn/6CJSJmjQ/H1o9Rkta+Ijw2jLinJ/HujWuaI8e34syfedGYFJWpK1J5dgfhGT26c00MTeFkIvf8seSJmfmZqBvTmjvA1TnqCFUpQF/ofAguFjd4Jo2/Sm9/a6f+bLL5djXVCbaQTq3Stn1Lhe3LXOva1bqe6SGy8V7u/LYEVpkCz5+59PDnKfQDGng93cLMKgfBbpa1uWZrFhx50KRhoV25nhX65Kt36b2l4DDmTJHRTHKKUaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0223.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3c5::11)
 by TY8PR06MB9294.apcprd06.prod.outlook.com (2603:1096:405:3a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 13:00:42 +0000
Received: from TY2PEPF0000AB83.apcprd03.prod.outlook.com
 (2603:1096:400:3c5:cafe::6e) by TYCP286CA0223.outlook.office365.com
 (2603:1096:400:3c5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 13:00:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB83.mail.protection.outlook.com (10.167.253.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 13:00:37 +0000
Received: from cix (unknown [172.16.64.42])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 253DD4102E73;
	Wed, 11 Nov 2026 21:00:36 +0800 (CST)
Date: Wed, 11 Nov 2026 21:00:35 +0800
From: Cunyuan Liu <cunyuan.liu@cixtech.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: boris.brezillon@collabora.com, steven.price@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, gary.yang@cixtech.com,
	fugang.duan@cixtech.com, daniel.almeida@collabora.com,
	aliceryhl@google.com, p.zabel@pengutronix.de,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	robin.wang@cixtech.com
Subject: Re: [PATCH v2 2/3] drm/panthor: Add initial support for CIX Sky1
Message-ID: <avRm82TLBe6I6LAD@cix>
References: <20261109120902.125242-1-cunyuan.liu@cixtech.com>
 <20261109120902.125242-3-cunyuan.liu@cixtech.com>
 <avLsAlL048MtIX4x@e142607>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avLsAlL048MtIX4x@e142607>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB83:EE_|TY8PR06MB9294:EE_
X-MS-Office365-Filtering-Correlation-Id: 1058a81c-8b23-406c-cc4c-08df3ff3c821
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|36860700016|82310400026|261026140227099003|4143699003|261009223027099003|261102123227099003|261028144727099003|56012099006|261022105027099003|261022075727099003|261021121427099003|261026121527099003|18002099003|22082099003|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: fDcTr1lDRK66cXs8/fcaA4kToAqxka9eA2MuAgDYbdJiPgSi73dkh0p+VmrEB2Jtrvt9EeQ//y1qE/RHWrW6Lcj61ug5tHJitPec0IXpU6KCYVNSkGix+SBPa9zCYrtFm/sQS3AMTK5gegekNqhSccuI1+nYy7SgO5LeHuYsx4YnQD8lPInI3v4iq/YCMSCKqfeDMqVqVL7aXPRrF8Js4UPsePy5wlTpIV5oAZTX/dPjuRFDcAPSzCrzmnIygfuzf6eKCIaUBsLdKT0zw6ZJ62s4tvdUOBQriL4Oyy7IwmaviHvOhrd6XvIJJd+hJmLKWKBkTXrTfddLc5lNQ1D5CgFitsgxb0ZwIXivhzbzz1bJLRWsuNLGvjbAZb2f5Caf/KTAo+01sdkuN4PcvixjogsipRqp2LWPLKu26Oo2r4K+pfZzpoZXSA5md/yn4bPYxN+A2BdfoiPYeuR4whgo9CIE4Vi5GTLpNA06+iPprb7VY9/kxwB1tkbJmYYCYcr02hfDZWGpd3AHWw4Mx5Sw8KWhOEoLg/91tnrQrBAZDaN+2Z5O7q+rQo/w89P80ED2j3AJF6dqWxx15oEheFYq/YZAjHr6Lx5P6hBH12MB4bWq0H2xISsDP+NV+vuxBox4NrVhgQwUXPvyjCMMuCiD/9hZhhkOmwLv56LAzxSEGWz7XdCz+EUOyRQ+SID0tfYhqpPElZ4DXEwNghrffuMa5w==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(36860700016)(82310400026)(261026140227099003)(4143699003)(261009223027099003)(261102123227099003)(261028144727099003)(56012099006)(261022105027099003)(261022075727099003)(261021121427099003)(261026121527099003)(18002099003)(22082099003)(3023799007)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RoREtYnLJUtQStPBchIxbhzgggkF684xAmSz+SPqrDYoIWgMlvhoLoahvtcrymKTmvqYxosjTT0A1mPMD5updFA1fUG2EIHQQObcVRIf55MtDNd1Ue939aA7K1PZE6Gh+cjGgN1acUoM9VHHmFTBhyJ2Vm0IA1dxdsYMU+QhBb/Ol4nEiOUGw9BYSTb+AG8DJqDj8Aa9ZK39YwYgpaKevX0lyvJGrZfJA+1pv4CHSBP/898fV8T93KmVsiHviZvCCbL7vYPsk0QF1gxWV4KP4/zUCqGbhZKQehs8ge9r3uuIGyfgPehRR820m+XFe6U+O/AVazTIX6yEOKkDfxkXZ/bPRq3JgL+ra1IVMgVgRUYQwql8wskNWUBWFx8QDYMreQUGxJi3GiST2fhVHRvQhCe8t9MeIXtqKGD7szLKb8m67HJboacyPtnmQDerCnHk
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 13:00:37.3748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1058a81c-8b23-406c-cc4c-08df3ff3c821
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB83.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY8PR06MB9294
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_050052_919127_2F026A40 
X-CRM114-Status: GOOD (  41.85  )
X-Spam-Score: -1.9 (-)
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Liviu,

Thanks for your review.

On 2026-11-10 10:03:46 +0000, Liviu Dudau wrote:
> > The GPU on CIX Sky1 needs an external reset before the driver first
> > accesses the hardware. Without this reset, the GPU hardware cannot be
> > accessed correctly. Acquire an optional exclusive reset for all platforms
> > and apply it after enabling the clocks during initial probe. Platforms
> > without a reset keep working through the reset framework NULL handling.
> 
> Adding support for an external reset should be separate from the enablement
> of Sky1 GPU.

I will move the external reset support into a separate patch.

> >
> > Configure SYSC_ALLOC before L2 power-on. Without these settings, GPU
> > rendering results are displayed incorrectly.
> 
> Adding support for SYSC_ALLOC should be a separate patch. It can be used
> by other SoCs as well, not just Sky1.

I will also move the SYSC_ALLOC support into a separate patch.

> >
> > Keep the clock settings provided by the PM firmware. This first version
> > does not read OPPs or enable devfreq. It does not register a GPU cooling
> > device.
> 
> This looks like a stop gap measure. What is your plan here? When do you
> think you might be able to provide OPP and devfreq support and what is
> the hold up?

The PM firmware already provides GPU performance states through SCMI.
However, some states describe both a clock frequency and a shader-core
configuration.

For example, the vendor driver interprets levels 72 and 216, exposed
as nominal 72 MHz and 216 MHz OPPs, as 350 MHz with two and six shader
cores. They are not actual clock rates of 72 MHz and 216 MHz.

Importing the firmware OPP table alone is therefore not enough.
Panthor also needs to distinguish these performance values from the
actual clock rates and safely change the shader-core configuration
during performance-state transitions.

I plan to implement and validate this in a separate patch series.
I do not yet have a firm submission date.

> > --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> > +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> > @@ -154,6 +154,12 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
> >
> >       ptdev->devfreq = pdevfreq;
> >
> > +     /* Keep the firmware clock settings until Sky1 devfreq is supported. */
> > +     if (ptdev->soc_data && ptdev->soc_data->skip_devfreq) {
> > +             ptdev->fast_rate = clk_get_rate(ptdev->clks.core);
> > +             return 0;
> > +     }
> 
> This should not be in the driver. If you want to have a fixed frequency just use a fixed
> clock provider, or make the clock provider query the firmware for the value.

Sky1 already uses the SCMI clock provider to query the actual clock
rate and control clock enable and disable through the PM firmware.

I tested removing the skip_devfreq early return while keeping the
SCMI clocks. The driver correctly read the core clock as 900 MHz,
but probe failed because the normal initialization path requires an
OPP table. Changing to a fixed-clock provider alone would still leave
this issue.

I have now tried the approach used by Panfrost: if adding the OPP
table returns -ENODEV, continue without devfreq. Other errors are
still returned:

  ret = devm_pm_opp_of_add_table(dev);
  if (ret == -ENODEV) {
    /* Keep the clock provider's rate when no OPP table is present. */
    ptdev->fast_rate = clk_get_rate(ptdev->clks.core);
    return 0;
  }
  if (ret)
    return ret;

The current frequency is read from the clock provider, and the
Sky1-specific skip_devfreq flag is removed.

This passed probe, rendering, runtime suspend/resume and module
reload tests on Orion O6. Would this generic no-OPP approach be
acceptable for the initial support?

> >
> > diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> > index dc8d0191aef4..4d7b1230cd7b 100644
> > --- a/drivers/gpu/drm/panthor/panthor_drv.c
> > +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> > @@ -1872,12 +1872,26 @@ static struct attribute *panthor_attrs[] = {
> >
> >  ATTRIBUTE_GROUPS(panthor);
> >
> > +static const struct panthor_sysc_config sysc_config_cix_sky1 = {
> > +     /* Sky1 needs these SYSC_ALLOC policies for correct display of GPU output. */
> > +     .alloc = {
> > +             0x00230000, 0x00000023, 0x00000000, 0x00000000,
> > +             0x00523222, 0x00523200, 0x00000022, 0x00000032,
> > +     },
> > +};
> 
> These should not be in the driver but in the device tree bindings. If you extract
> the system cache code into a separate patch we can have a proper discussion there.

I will move the eight SYSC_ALLOC values into a DT property, such as
arm,sysc-alloc, and submit the system-cache support as a separate patch.

> >
> > +static void panthor_gpu_sysc_config_set(struct panthor_device *ptdev)
> > +{
> > +     const struct panthor_sysc_config *config;
> > +     unsigned int i;
> > +
> > +     if (!ptdev->soc_data || !ptdev->soc_data->sysc_config)
> > +             return;
> > +
> > +     config = ptdev->soc_data->sysc_config;
> > +     for (i = 0; i < ARRAY_SIZE(config->alloc); i++)
> > +             gpu_write(ptdev->gpu->iomem, GPU_SYSC_ALLOC(i), config->alloc[i]);
> 
> This will crash for arch10 GPUs. I know that you're relying here on soc_data not having
> the fields filled in, but if we move the sysc_config data to being provided by DT, we
> need to check here.

I will add an architecture check to reject the configuration on
arch10 GPUs before accessing SYSC_ALLOC. I will also guard the
register-write function.

I will wait for your feedback on the no-OPP approach before sending v3.

Best regards,
Cunyuan

