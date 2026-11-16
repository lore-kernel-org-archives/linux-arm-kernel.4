Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A75606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 12:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hEuCFzOR;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=mIhjP+K1;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=mIhjP+K1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EHD+TlaMMkUGU1QzgnGXBwbt6fC1U5xccW/LC7gAhQo=; b=hEuCFzORdSD0tyTQNXOuhZhwmH
	xp1l1kcnGU0/IbJONiQgEfwW3mXQP6FMpFH66nkeX9o4kWDdZaJiP07ESdk9+8z1fUFmTAW6SYbpf
	9/0ewa8q0/Khww6xUzPIon0SiUQ0oHjtJzQ43UVZTVKwiP5VG7yLycjJymQ8Ze31vXMF+85FSFm/y
	ncnfCi0KjNsm7EZdvtmJzCodXQd/vfcGtfCqHIRbKApBIv66Ob3A1k8AYzZQB1mtHzdTyfbiTZknd
	c+Xq1Y2DIVX26Tue/6DhQ1sByeDEgxvXAPsZvT3C0t/zJ7NKwyew4lvNAkMe2PbcEPj3RS8LUasIf
	+117/vVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvtM-00000002Mz3-37AJ;
	Mon, 16 Nov 2026 12:33:00 +0000
Received: from mail-swedencentralazon11013039.outbound.protection.outlook.com ([52.101.83.39] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSvtJ-00000002MwJ-37lw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 12:32:59 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ueVzs4ZdCa6QGBkfNouR1YkDW4Oj5yR49/SCF+MqypOtL7azPVPE8PmIkFWH++WiChjCBdwd2AxIZPRNMrQcjMOo3OoG2GHHBVAtnRXF2sqlEtecT0Im303xsMu6hJ+UiJVnfTCjsnbG2oqc9o0ZFnjv2uKgCVH1pp1hNucy5ammZOmGG48OGB2+SCnsVjV2knHJygb39wQ5fUITAk6AHMXjwwsyl4sglfYy/GFJxdj8+JOmm7bQeN/qPv1Tq2jjIIM8VElaIQgWTrgKB64mhtt9lEjvfqluJ3VdTCwXTUqccbPgwIjMBz2/31HvGT8raN08K3mFeLs0cLAIw4rlCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHD+TlaMMkUGU1QzgnGXBwbt6fC1U5xccW/LC7gAhQo=;
 b=ciINgJ9sBnidkIKxtLXNQlmcd9jK/bCO6P0A9ROkUhh0lViMY1I/CKlfWBLVCnSoIGxwDffWfuFAEWK6jDY0GYf25k6XMjc43Z7nqsvQ1pfo11GfbFtL8/zLbN8HK0CHYBOToNzfCdu8xcPay11IMecxtY1MrRu+Cnh2nEcSs3CWuFUvVlHQcBUlyV9vlwRlO//RpQbS3JSC9hgHKy9eZO+WPF8Spfmbyv4mnVKkfuUdbodnBLY4UJqV9smyTolz4FbU+02PzO3UmNWxioTxxmH14TSv+i6+/+kb+BnZbiMtbHZUY/tpf0XQ+MUxQ2OwXHbMQ7yic9tz/iWkZ8wSug==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=nvidia.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHD+TlaMMkUGU1QzgnGXBwbt6fC1U5xccW/LC7gAhQo=;
 b=mIhjP+K1WX30lq9uIJoRibzRpH4f5ajLf+k5ybbIhkO7zYUYl0HnmwmYfiY2S8DBJMBe1iJeRCYrK/nON1IOg04bErCiH/MYFyH0mHV9gRqKs3DcwB0tA8v6lKo+4pRVIJeSUFsF42QvksQ8A8s/RpTRnoTyIZYqLvwkVEETkJA=
Received: from PA7P264CA0512.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:3da::25)
 by PA4PR08MB6144.eurprd08.prod.outlook.com (2603:10a6:102:e3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 12:32:49 +0000
Received: from MI3PEPF0000848A.eurprd02.prod.outlook.com
 (2603:10a6:102:3da:cafe::29) by PA7P264CA0512.outlook.office365.com
 (2603:10a6:102:3da::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 12:32:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MI3PEPF0000848A.mail.protection.outlook.com (10.167.240.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Mon, 16 Nov 2026 12:32:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N7uvu4liiA3W1Iv2LnVJHUM1S28sLS7LV/WT9eTxsr5+bedsfXhD1asSr7TA6XREIP7jhlpm4qNeQc9/PXRf/74pKK9Xvv9od3UsN5F0hXRTkNo00I2SkxswDd3F37kglOLqwo/kFQiqB+hxPZq8pN9Dbor1dU6BYiChF9L5PRQ2hju6EMWqws0E7nIOwiWE2JFCMJug8ayD69Q4ZCxcNw0sgwOKIeMWSJEbofx0fXlFuJOGgxFYKMRxg/btRzpvqPJ49DOog446h3VO5T7A1JgAjGl086tmCiEdbgPXiKRLoqaYW+evQTDiSjPcC9E0UGRS0XAMgrOlpZKHDQwG3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHD+TlaMMkUGU1QzgnGXBwbt6fC1U5xccW/LC7gAhQo=;
 b=IqUQptBlbe9A114kcNwxQImPIh/czB6ya1ZbK7x8w92Z0GIh3q6z0C88FmwbsTQ7bl29TeVdGZM8HNz0aiphvJTdctzQyk0wnIbBllBZyz2rA9e5vG1LSR3iIVgtrv0KOIKbOwZ9gWvov/D0qfufSLTXh9IAJ5rTM1qQydLI/JrI37lpsyzZxapvUQXHouqst128lkxhIQFKxPnQZeSOV/PJPyCDIGIZe6pE42vaBcx2+kobw+xYzFBQFz4SHDX1eG2eVeuVexAKCgjir25w53MyXmMCfoQyPWsHm2p8UJWWjXaPWCZu98LJI/V9xLEF8RUwtEPlbCELjPxHH4JStQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHD+TlaMMkUGU1QzgnGXBwbt6fC1U5xccW/LC7gAhQo=;
 b=mIhjP+K1WX30lq9uIJoRibzRpH4f5ajLf+k5ybbIhkO7zYUYl0HnmwmYfiY2S8DBJMBe1iJeRCYrK/nON1IOg04bErCiH/MYFyH0mHV9gRqKs3DcwB0tA8v6lKo+4pRVIJeSUFsF42QvksQ8A8s/RpTRnoTyIZYqLvwkVEETkJA=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAWPR08MB8959.eurprd08.prod.outlook.com (2603:10a6:102:33f::15)
 by PAWPR08MB10898.eurprd08.prod.outlook.com (2603:10a6:102:46f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 12:32:13 +0000
Received: from PAWPR08MB8959.eurprd08.prod.outlook.com
 ([fe80::71d3:7b21:3594:e33f]) by PAWPR08MB8959.eurprd08.prod.outlook.com
 ([fe80::71d3:7b21:3594:e33f%7]) with mapi id 15.21.0615.012; Mon, 16 Nov 2026
 12:32:13 +0000
Message-ID: <d768828a-fd21-4511-b56c-ad886128d9d8@arm.com>
Date: Mon, 16 Nov 2026 12:32:12 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 12/12] iommu/arm-smmu-v3: Detect
 ARM_SMMU_OPT_KDUMP_ADOPT in probe()
To: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org, jgg@nvidia.com
Cc: robin.murphy@arm.com, joro@8bytes.org, praan@google.com,
 kevin.tian@intel.com, smostafa@google.com,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, jamien@nvidia.com, kas@kernel.org,
 Cristian Prundeanu <cpru@amazon.com>, Breno Leitao <leitao@kernel.org>,
 xueshuai@linux.alibaba.com
References: <cover.1793593923.git.nicolinc@nvidia.com>
 <12d498a18dc5a40c4e251397e35f995544730482.1793593923.git.nicolinc@nvidia.com>
Content-Language: en-US
From: John Garry <john.garry@arm.com>
In-Reply-To: <12d498a18dc5a40c4e251397e35f995544730482.1793593923.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0104.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::19) To PAWPR08MB8959.eurprd08.prod.outlook.com
 (2603:10a6:102:33f::15)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAWPR08MB8959:EE_|PAWPR08MB10898:EE_|MI3PEPF0000848A:EE_|PA4PR08MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: aecc7bf4-fded-48b9-2328-08df43ddb979
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|10067099003|4143699003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261021135927099003|261021121427099003|261022075727099003|261022105027099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info-Original: BwcYTyFnk+yJ6bPUpowxty34MppHWW3QEs4dUGpEX2l7jc75V81U8Zly4Od8KvWo5JiBn7+a4SyvhkMgwXAc16w0VTs43bszGeajyfLb911i3Vo/rLmca6u2hPIMgt34TMkQdQjh80B8JQcmnHr2p9XY9cUxoiTmzOLIaWELWz64nF+04ez+p+0VrnawnallAfWq1XWXnU/AJ9zd9pvkGfngCrfT1NQFHZsDoq6U6smCnVA4Kx6INHoJRC1TLD8LcVcV1NQ0hztoO2bIljpkHXGdOzqdpz9fIVMtyG8/FaNvtEvwDyMwTExW11VF6hR1uNKNvBhpv2A/0hWLp12NIFmNKOaF3wJcJWmKEXpIBvs8gwDVlbV3Z3Es8NzDo3OTFKZ/ha8RsTmILjIvYeOaH3teUbOtIg/t8ngTrwaI3HTX1qOZb9ntrmts/qCKIEgssjUijX+xySLRbi5LgWXx4QgWgMPzuuK5Yl+EC8Kfq0dDHPJo1fWuW9DuJsIr/j9VSRkh9NdT81Yx0p3F6Q2n4wd7w9urNs5iDMaEa97oN0qX2tH2cccOyLmb3gARKKxUhNU3jnySDxck54HyHig0/UNeNIgTgH+N16rIaQFHN2xEw1Fw+gFhtNA/a7A6x9ILpKWYQNWDx4KoEagweLTit4Zv9xZrFe4LvjF7e8jgwjY=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWPR08MB8959.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(10067099003)(4143699003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261021135927099003)(261021121427099003)(261022075727099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: drM9S7rOgkzjAjHcMuGWIDeZoNstMQLKjAYikyRdOrudk/DyshIkcQL+6EVTNoIa+gyTdzv41CLY5fGpd3tD/GaeInMqMOL+jVff6j+BJVGT94vvhEwxQTLt0KCzO4jyy/1GCHIeeUeCS3h7m2jTk/iTjZyBJBAF7sndtWoOSdvZsjNkAs3EF/Ps89K8ek5RBCNDl+z7WZSNhp4UHWIPclTX3hlD2Xp5NrVGGkT/P1ZQv/N4DGrLqT4qHWDgLJeecA81uikE2lgVmu8hOb62uTkP/mL5XB69YvUHoyLZuXhfwv1c8WxzNYYPkikhqU7xQ01v229Ofca14+COQVLHiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10898
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: MI3PEPF0000848A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8165ab46-b4ff-4ef6-6104-08df43dda45c
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|23010399003|14060799003|1800799024|82310400026|376014|7416014|36860700016|10067099003|56012099006|11063799006|4143699003|261026121527099003|261026140227099003|261028144727099003|261021135927099003|261021121427099003|261022075727099003|261022105027099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: a0gSrqD7RLlrxMJuPCrbKora4OXtitv+nD6EwBv6/+QbpjPe1r8YybKSND7I4v1NhrIqEpebO3r++WaX/XkBY5zeA8G7gFxvTRYOK/uQWkmtawuDedEB2xOSTrRB86XATlSFfWYiDcMh/gStOJy92jvs3WHs3yHodH/Y80+32lfKxFBaYsuWGliOXQbcjw2eq6ZBrOYWlJlAL9KuL9URaRBYOY9uFKWPRgVZ87LUnjLQW02+IZ1opUXH9VDXM5Z/nFcSoxvKRDlc2ZEUePzAiPw8PEwQJ7aGnsVNUL+YPaeAgvFWBaY2dZ0dZqGtSnzwjcuyQytJ0iexvNTCW4kpr8QraOdLYEd/oAFPirgN+LNMNAvG+TG0VqE+vswGT1YKCfQDdoG/Wpeo6Z/UxlgEEptlJJsc1IWiDN6zyJGO9ejHHOFv4KlAbU1tH+L/vlKHTcDIAnJV9mJsRSneGD2s7K7oePrYpMibkBlNLPUHLO5mm74HNkn59VvUAHm+prJ50NFeagrXzY/CuZZjrTZO/Ek2tuobj1/GP861dY1Xz5uabrqD74secEHKij5uOHArtS7TFCpD7ogQxKThqB2/P4ra2DXnXELxiTd8Xsm66ZksJydKkyr5f7f25LuYxFhegDww+PjAHZRDA5m64v79Qar67LIoQ0seyQ90DkvL4JDv00MAlOliCZcP42fqhZt+4gVVrHbbp3lOCozHrZ8Ifg==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(23010399003)(14060799003)(1800799024)(82310400026)(376014)(7416014)(36860700016)(10067099003)(56012099006)(11063799006)(4143699003)(261026121527099003)(261026140227099003)(261028144727099003)(261021135927099003)(261021121427099003)(261022075727099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JM2Vy+87JjmQ92cZMUB7NyJxcBYzb6JvGh0FDP8C2QHu3IN/GRwwbBhMOdLq1iQ7u7cGe8Tk1DyWcHsNL/Q07PKhEtxBDb83d0UZVCo0nDwNiy+Z2NM+tdxMoowHFdSNtCrrg5dP3G2swylFQpDPBloUouytQ8OrOrFjl2cCDUqt44KuWbcR/r0sisIgCZRf0e0cYSTTF4YhvnIjpkRqI5PLwWyKk+m4F5ggOAp6IujiBWVnEW+I9t5nUgCTDjTg2l2xbXFOcy/q0V1KvGPrMQpSqhKRHC0XLGHQO60NdTiIJOnxIjbHEWb/Cmq7TeeRIl4e5teeeGA5lBAAYhVD0ZWHFM5+F4VewhzD3yWim8Hd5kRwwvXgHJMYN2SGAyKTdtwiI//DQTnB0wbZ+g2VZK9XtMIA1DF87RVLYEIpm545AYTWbOXR5T0UXwEpibUA
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 12:32:48.6777
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aecc7bf4-fded-48b9-2328-08df43ddb979
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF0000848A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_043257_796842_56B966DC 
X-CRM114-Status: UNSURE (   6.36  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/2/26 05:19, Nicolin Chen wrote:
> arm_smmu_device_hw_probe() runs before arm_smmu_init_structures(), so it's
> natural to decide whether the kdump kernel must adopt the crashed kernel's
> stream table.
> 
> Given that memremap is used to adopt the old stream table, set this option
> only on a coherent SMMU.
> 
> And make sure SMMU isn't in Service Failure Mode.
> 
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Pranjal Shrivastava <praan@google.com>
> Tested-by: Breno Leitao <leitao@kernel.org>
> Tested-by: Cristian Prundeanu <cpru@amazon.com>
> Tested-by: Shuai Xue <xueshuai@linux.alibaba.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

FWIW,

Reviewed-by: John Garry <john.garry@arm.com>

