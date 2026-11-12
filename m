Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83677606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 10:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oH+Iv2ss;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=jvjzUI/j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:CC:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bs2DWfvZapCw8Pst5xgYPt/5cvHZVHIuVpG7HQ+yH6A=; b=oH+Iv2ssZ9jisa
	oc0Vm/hbK8r6vFPBhNLLDZuIiPOKqeph8n+Qg/LP7rUEHFVZYsVI7aac+a2sq2rjjZRCgJ3iksFh6
	IH/e3QNdttljwG7BUl0Df+ADBbMJAdGvwmiOdgb17cKwQT/B5DOieKoe3GDNble8qMLFgqJZmRffF
	Ni3OTYfbNFCqHP1YFOBnwjGrKlQrki8vNNU9aeeHXkYOM4drZNmHFqRnxVV7Ce9xDQ2kQjm17oAe9
	oe0Gb8+pL/Gqh3sy8tL4PKyokreQuYNgxfvUCgrSvUwX4ITruUx48oyO6lzdFI7EaJLI5dK/ENnLD
	WR5ZmgC2iaujhJ6CRSyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRIj-00000009PCU-0hAA;
	Thu, 12 Nov 2026 09:41:01 +0000
Received: from mail-westeuropeazon11011055.outbound.protection.outlook.com ([52.101.70.55] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRRIg-00000009PBZ-3pSp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 09:41:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4fNNgpb+uzVmAuR74x19LaBswIXtl30lZr2HhJatvBWxWyPw7lxK+4HGPj8wQ2g7BkgJEnD78tqRw0agg9zI6YaEjxgJ8rB6osq7XUPyLYRYEd/5qRk+xT64QCG4YE4KeON/3Wo4j0sVa+xMGxK9Gp3fglx+DStbrDQDzjSGAqsUMo8+atIQkm+KyGBiO5guIRV/KILjDYpYbkip3ManhmdF+mic2ymZU9DZCloO1KgbVEpxjFUcSnFTtD8KNWQWXzGdSpxh5Bb2meYALhYZPYbq8RGYcAMFciBWcEy62WVVAS4Nfmwfnwwm6IeRlRz+HLwEqOsHh6evkbVaNdW7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bs2DWfvZapCw8Pst5xgYPt/5cvHZVHIuVpG7HQ+yH6A=;
 b=hrFPXVOwVboQrl86W8bYrFRfi1AyTDHAAQoGaID7IJRiJLX2jPMzEXl9VsJRraOoL7riFAvZlS9fM7jiWc9VRK+94b4TEb9zUIJ2DD89UL0zwu2uEv9dPwTcp5CdHOYKXlAQIhZpk2AwKB9rnVUiXlt5Y1AypzKQkKYWD8QXK4TpAt/Wf3ngz7CYeuzzr7/20J6D4mZd9yxj9vO1dNcJzaaKj4M2f7s9n5p7jArwXR/D4TYMAdaT+tGuE3XBTIeA7itf5N3yYZrurHp25Fw2s/VJNDcMFmy2ksxQmKyEzai9GdVtUTwoYn66wjB8DOyxxLzWHtOOJRIY+walfc/q+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bs2DWfvZapCw8Pst5xgYPt/5cvHZVHIuVpG7HQ+yH6A=;
 b=jvjzUI/jEUaPEGIsI5A4WBsrnYt2ozxpUCjCAZz84rC67Y1VPkkxiCwnNSQvP54rCFITH35l4qXL6Dk8+lZXQVA4mfA1Khk8Iv0CynugvO8liWG3/NtSoapmZcz94TyWMG5VN/NES4yDPpAUppUUnj8SUZBYj2M/AoHjo2lAavrxyxvZ24fN/NV5o1NKV8YAinbNXhpEvGsYNpWVMZDA5I+AfsbiebwiSCVJKXuKzt5srOZRhTZJBppAQTk9++ZnzZ71pIM/tfzpcabFM6OpLBq5BYehLbQcc0SKcE8Nlo55twKFZIO6ix1vRkru82WHmFwHKSJ20TukZmrZlQEwMg==
Received: from FR5P281CA0055.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:f0::17)
 by AM7PR10MB3701.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:13a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.0; Thu, 12 Nov
 2026 09:40:50 +0000
Received: from MI3PEPF0000848B.eurprd02.prod.outlook.com
 (2603:10a6:d10:f0:cafe::6d) by FR5P281CA0055.outlook.office365.com
 (2603:10a6:d10:f0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Thu, 12
 Nov 2026 09:40:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MI3PEPF0000848B.mail.protection.outlook.com (10.167.240.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 12 Nov 2026 09:40:50 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 12 Nov
 2026 10:41:31 +0100
Received: from [10.48.87.100] (10.48.87.100) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 12 Nov
 2026 10:40:49 +0100
Message-ID: <a2432129-613b-4f17-813d-82ac8af9b6d6@foss.st.com>
Date: Thu, 12 Nov 2026 10:40:48 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-stm32] [PATCH] firmware: psci: handle unsupported
 SET_SUSPEND_MODE in PC mode
To: Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
References: <20261029191624.1.I5f8f3d75a566b72250d629ac6f43cf0d387c0218@changeid>
 <20261030-origami-tarantula-of-contentment-a70ab2@sudeepholla>
 <4690f55f-dc13-4e43-82f9-d508253f6c64@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
CC: Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, <linux-kernel@vger.kernel.org>,
	<dario.binacchi@amarulasolutions.com>, Linux STM32
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>
In-Reply-To: <4690f55f-dc13-4e43-82f9-d508253f6c64@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000848B:EE_|AM7PR10MB3701:EE_
X-MS-Office365-Filtering-Correlation-Id: 67de8e43-2b71-4928-aa13-08df40a10999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|18092099006|18002099003|22082099003|6133799003|261009223027099003|4143699003|261021121427099003|11063799006|261102123227099003|261028144727099003|56012099006|261022105027099003|261026140227099003|261022075727099003|10067099003|261021123027099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: eJIw4peyZDrelGSt4VpKyNBpMeoq3pEn2q6ap2gluLg2RI+UveF7vyu6GuD+vkzWYGSkAG47HK1MNOM3T3SyZ0qP78NiDa7BHoE46GIGSN/go/+dmICsIk4YFBYZgz6QQTeqS/amINZUaAyP5rjnMGZoq00xQJEdMlXvKJtHlfZX94XVhNwrC+ZsauX2ebksN3VmOihdXxUw7OR/aRfjz39WQnIhtabB6zNE3xWli+q3YAELxqhHD1dDrn++IR3PDRfrpQZSec9Jj7FVjJ69Mgua5tFHnJOIaGBFQHKpSJGsRl4vtgJ2wbIvefbcAB77HeY+JUOA8AOsPtgpncBBeVJ5nVTxKepwNKfhU73Jhccty0DzuupD0vN1zHZ3FzkrIXBFRvJAe+vX7Xy5DTBumZv9d6g8pPYHju/1psaNttDgD/RnjhfkytsZ1e2c+rNbh13cnfweUxGTjvv8UH07PLoyEQsNNj8+rwHkgb1MICFUboRZbd28ho33HSaEsfzPiu47X/8PU97nHMHOI3u/1LJtyanTx6aOZQYpx6oCAkpeosAa71DVnkypR054vhmzNBCsalDye3GLIr7+2S7yjKwxWpQz86ZFGsI4j5GbQgEXYpHxl9VnjDaufyTeZerNtVHj2vPgS/hNjiU+6xOmtVBDVO1dt858d0JOnkm7+1QAsLOZ8tZT3pJth8yYJkKTX7dGjwIN492Bh9ZowCy6hg==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(18092099006)(18002099003)(22082099003)(6133799003)(261009223027099003)(4143699003)(261021121427099003)(11063799006)(261102123227099003)(261028144727099003)(56012099006)(261022105027099003)(261026140227099003)(261022075727099003)(10067099003)(261021123027099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: s2NCDpd5S117CyUaH5nPD+B01CeXE74PG63wTlvdtw+HywoGw76AwziZELWFS7R69LFreAxgSjd73RGWcB/s/8WVGs4KcMKcl6R9AXRTVDhb198gP4V3b5ifUyEJrK+li+84jqVwIyVzL1NIAirNwIbA5qwF3dw7mSYwg2P8BxIWnF4ZciIcZb1bnqRksZbdNJ6CXQg7K7rKcqeSnvBPhWEnWGEXQfhY9+f1/KvRwqaCGsOopqYdibcnpcYivmuNzthOhNFAD2yTdCqaEcFXqDfs54pmGkdgGgNgK9Tqh/apAJS7rybyIzCr9+ea/Kp3HzjggnX0L7Lc/+TtDoOV0WR5xIWT2yMViuJZhf/AklI4aK0MiPqZBAlqPl10beWP5nOY0+6zDPRbo9SS9nAFLm0bChTBWisVN9uY+yrhT7Hvqcmja/7h2HiA3q9589Lk
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 09:40:50.4586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67de8e43-2b71-4928-aa13-08df40a10999
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF0000848B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3701
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_014058_964133_49ACF31F 
X-CRM114-Status: GOOD (  30.67  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 10/30/26 11:04, Patrick DELAUNAY wrote:
> Hi,
>
> On 10/30/26 09:32, Sudeep Holla wrote:
>> On Thu, Oct 29, 2026 at 07:16:25PM +0100, Patrick Delaunay wrote:
>>> The PSCI specification makes PSCI_SET_SUSPEND_MODE optional. If it
>>> returns NOT_SUPPORTED when Linux requests platform-coordinated (PC)
>>> mode, Linux can assume that PC mode is in effect. Treat this response
>>> as success so PSCI power-domain providers can initialize when firmware
>>> does not support OS-initiated (OSI) mode.
>>>
>>> Continue to report an error when OSI mode is requested but
>>> SET_SUSPEND_MODE is not supported.
>>>
>> So, your platform advertises the presence/support for OSI mode and yet
>> opted for not implementing SET_SUSPEND_MODE ? If so, it is indeed a
>> firmware bug as reported.
>>
>
> I think it is no realy a platform bug but a too strict management in 
> Linux kernel,
>
> for PSCI power domain.
>
>
> The OSI mode is not yet supported by the STM32MP25 platform in Linux at
>
> upstream but I introduce PSCI domains in device tree (but without idle 
> power
>
> domain) just to prepare this activation in next steps.
>
>
> As the PSCI support is not activated in Firmware (TF-A BL31), the 
> firmware correctly
>
> expose its capacities (PSCI_OS_INIT_MODE =0)
>
> => PSCI feature indicate that OSI is not supported 
> (FF_SUPPORTS_OS_INIT_MODE = 0)
>
> => PSCI_SET_SUSPEND_MODE function is not supported (optional when OSI 
> is not supported)
>
>
> in Linux side, the power domain driver 
> (drivers/cpuidle/cpuidle-psci-domain.c)
>
> correctly check the support of OSI:
>
>     bool use_osi = psci_has_osi_support();
>
>
> in STM32MP25 platform use_osi = false, so the driver request
>
> Plafrom Cooordinated mode (PC mode) as expected
>
> But here  the GENPD driver try to use optional function to set mode:
>
>
>     /* let's try to enable OSI. */
>     ret = psci_set_osi_mode(use_osi);
>     if (ret)
>         goto remove_pd;
>
>
> And the problem occurs here because the optional function is called 
> but the normal use case
>
> is not handled (OSI mode not supported / PSCI_SET_SUSPEND_MODE not 
> supported)
>
>
> With the proposed patch, the Linux kernel can have PSCI domain in 
> device tree even when
>
> PSCI OSI support is deactivated in PSCI firmware (or not yet 
> activated): the domain are
>
> always ON (GENPD_FLAG_ALWAYS_ON)
>
>
> NB: I hesitate between the current patch and a patch in PSCI power 
> domain driver:
>
>
>     /* let's try to enable OSI. */
>     ret = psci_set_osi_mode(use_osi);
>
> + if (ret == -EOPNOTSUPP && !use_osi)
>
> +    ret = 0;
>
>     if (ret)
>         goto remove_pd;
>
>
> but I patch PSCI firmware driver because I think it is a more generic 
> place to handle optional PSCI function.
>
>
> Regards
>
>
> Patrick


To complete my previous answer,

In  last PSCI specification v1.3, we found this description:

"

5.21 PSCI_SET_SUSPEND_MODE

5.21.3 Caller responsibilities

The caller must be able to cope with the following error return codes:
• NOT_SUPPORTED, in which case the calling OS can assume the platform 
will work in platform-
coordinated mode. In this case, the PSCI_FEATURES feature flag 0 for 
CPU_SUSPEND is also 0.

"


My patch only implements this behavior:

the PSCI stack in Linux assumes PC mode when SET_SUSPEND_MODE is not 
supported.


Regards

Patrick


