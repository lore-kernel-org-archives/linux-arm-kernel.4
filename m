Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF88E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 02:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NC1t02T3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bNfk7c7XhNw0g064mxJvGOAQMtmgbxf7d5d8trfqvpg=; b=NC1t02T3jUz5QRO6QoiQkreGGm
	R24Bc/xouyAq6JA6oUTLQJ9flxX7XYKiBaBfCxqBFSKH7lGTDNzfHQ0sDElzTZL4I+QW17SuWAE72
	Q2RX377p7kZgFV9ZYMG9CUXYMmXQqzJBR/jm5MnYXo8WQr4r4nnzQe7SBtbFuqdhlxmmCi9P2TlLx
	ip8SXIRPu7LnAIFUqVCbhSxscYIJHqiBXQsCZqSQVX97Ut962cqvISzMlTjvq+t5kLTcUXtWDySvP
	sPUoT6BO6SQaBfsTEnNnh1LuMSWwD7sZZR3KVTREaHT7vUb7HjeReYcpWyVqUYcvNS8uOPWneRRcs
	lUClwD0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWP15-0000000Bs6N-24rn;
	Thu, 26 Nov 2026 02:15:19 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWP12-0000000Bs5t-1HyG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 02:15:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PfZBcfN4gI8xvGxNOkefr9WrNIn9Vw5oyDycp1AcZkN+P/5Np0fyj4KYLEFxYHs9Y0GRi3L7rzYHUBiEnnpl4k71e8OGJtr/k/2F5aw3xvlvGxVjvPCPW9WKjC5OwMyJMJjdrOkqIRdY/PHW+Ny8dPzzZJCNSv/3nOcAcXDou/e+FNjjwBrRjrb/DbFfLeZQ2tilkXwRLRHlaHfbjWKdKt5pRuoWRbihcbLIeFp+KBSBimgdirEt+Wb/UomRhIyz6O4NdOyjnBX6EOb9/kYWAdkgWXx5X9GHNxe4PaEKdpbsRNmIQe0riePe1dwmChiZtR2lV8VNvNCONtuwJ2DxJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bNfk7c7XhNw0g064mxJvGOAQMtmgbxf7d5d8trfqvpg=;
 b=jKJ1BOg172WDiW2mk4qFByimE3a96aaDtTI0tNYGYX3zx9ccUet249qYVKWkzawMtSnDV+6WzbBVWg91DsPaUgcHOzuEtsKdeCgebjFpMHshJ5Y1ea4Hrfp9JD+M9Fe+w1IupvOyPnWan4/f30PglGYyAHgka+l7L5bxnHEWhhDRKtwQK6B5viEsCyUo3LO/aR9bzxPHPXhdQvMOy1I2YAh0SryGb3xVlNoUmJbyOvWqOlPaMFbPslifz7X3fLeE7M+RRD5UBEQV5NZ57c1C79c2OvcGrX5QnpgNzEXnvuWYkEqtGNR6ffYqrw9NmcumI4e102ph+YDP1GEnnTLNnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR02CA0137.apcprd02.prod.outlook.com (2603:1096:4:188::17)
 by SEYPR06MB5398.apcprd06.prod.outlook.com (2603:1096:101:8f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Thu, 26 Nov
 2026 02:15:06 +0000
Received: from SG2PEPF000B66CF.apcprd03.prod.outlook.com
 (2603:1096:4:188:cafe::9f) by SG2PR02CA0137.outlook.office365.com
 (2603:1096:4:188::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Thu, 26
 Nov 2026 02:15:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CF.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Thu, 26 Nov 2026 02:15:05 +0000
Received: from JohnnyFan (unknown [172.21.64.24])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 8CE25427EFC0;
	Thu, 26 Nov 2026 10:15:03 +0800 (CST)
Date: Thu, 26 Nov 2026 10:15:02 +0800
From: Johnny Fan <johnny.fan@cixtech.com>
To: Leo Yan <leo.yan@arm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Al Grant <al.grant@arm.com>, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 0/8] ACPI: arm64: Support PMU on Heterogeneous Systems
Message-ID: <aweWJpk82HgKFshd@JohnnyFan>
References: <20261116-acpi_arm_pmu_registration_hmp-v1-0-0371d4eca626@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116-acpi_arm_pmu_registration_hmp-v1-0-0371d4eca626@arm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CF:EE_|SEYPR06MB5398:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e1220a6-96db-4c0a-e801-08df4b6315fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|23010399003|7416014|1800799024|376014|6133799003|261009223027099003|18002099003|22082099003|56012099006|261021121427099003|261102123227099003|10067099003;
X-Microsoft-Antispam-Message-Info: 7bbVmeq4ViQ4SAcxILLGy7dW7qe6B75sDk/hCx3bhHJZswBShtzSEB/W9x+/L2f9TM4x0OIxoGARVS2vNVBIxySeXKG3p0J60wM721IKmI+/40AtQu71qslvxvFpX1spoXBE9dPxueY6FS0LM9aP6QEJ8DKzOuVRVOH/Yhxz1vti+vixLrgEiC2fGhWS+FvMnl78CeVeKZen4BM4dSjFaRut70fJH89WK3LWTKEtdsOFLh4btaH9t/+axPH8Nw0Ao9gtCIk+EQlTeTssxtabPgQKrZV5A/S1Wp7Tg+q5N/dh7F0PldgObr4ZGKYfrV6TWOmjsSK019NJihG+DT94YiYbSjVQ0SHLCTfBH/+/5QJPa1m4qK/ESZFEgJufxd5mR1vxWsHxCVkDbrY6wkyl1GZewRLQauRFgSHRXo0n7fTrq+nN+nSmX5oimdM8QQCCpgEfwBZCRMM8Ezu0PXr+6gX0PLv+kEZvxJ8tsSQLbEeVZejrm8u0ObKynZXX8VXHY1NSe/md3aLLYE/GPxHrKDw8oWbOsbIqm8Ohg/L5eOt9/9AgGFEJ+mVDfuuteGCkS27SQIATj/bcwRELtw482wFhRTLdzbIQFtJGD9yoszVBxhiYgqTRiMv3NYnG8fYCoW0x983gMDubovMo1hGCTL0VkEu/6SUBGxxCxuYdrp9Jwbra71+gdEf9vFka/xxyR/AG5X/pA4cf1NK0jerxsQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(7416014)(1800799024)(376014)(6133799003)(261009223027099003)(18002099003)(22082099003)(56012099006)(261021121427099003)(261102123227099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5TS2jXpZVR8R9kbggziLGfvkUaRK68c3w/1otncHkDWS5CJJomie52nL7000UuXHRJCJFAeyqPglL8qz/NcvdYS67JTWd+rxsyqIJhpcIAS9/5Y60lHYKPzCV5CZXGfuKCPaL8HzOn1hRhocVK1zoNxDNlILM1QUM4Xvfgz23aqdOa7+XO9xeiP6D4Q9+oBpTEjFgdJ3MvOQ7xOMBMyQhCgYS6eDezIy6jeaAxUzlxYxQdCYUKGBqKWVJuqpzCCOMLdqnktnX8PLUZYoupGe7Mw1ZDM1IUfrWf2YtBzrjuDaQLESAMXl+UgYMDernAxlzAesjXhPivcoHqHD8prOF+YtTHPaYMdc2+EoJLmePNQy3aKzMOMin4jUJfSDvHt0p5SqyonJ9jduzw81HEGT38qqDSLzYmxel+Ot8Ft2A3mRD8FoZndA1qjk2U7O17vZ
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 02:15:05.1388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e1220a6-96db-4c0a-e801-08df4b6315fe
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CF.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5398
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_181516_354507_F0E28074 
X-CRM114-Status: GOOD (  12.84  )
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 06:21:27PM +0000, Leo Yan wrote:
> This series has been tested on Orion O6, with four little Cortex-A520
> cores (CPUs 2-5) and eight big Cortex-A720 cores (CPUs 0-1 and 6-11).
> It exposes the following PMU devices:
> 
>   # ls /sys/bus/event_source/devices/
>   arm_spe_0  armv8_pmuv3_0  armv8_pmuv3_1  breakpoint  cs_etm  kprobe  software  tracepoint  uprobe
>   # cat /sys/bus/event_source/devices/armv8_pmuv3_0/cpus
>   0-1,6-11
>   # cat /sys/bus/event_source/devices/armv8_pmuv3_1/cpus
>   2-5
>   # cat /sys/bus/event_source/devices/arm_spe_0/cpumask
>   0-1,6-11
>   # ls /sys/bus/event_source/devices/cs_etm/sinks/
>   trbe0  trbe1  trbe10  trbe11  trbe2  trbe3  trbe4  trbe5  trbe6  trbe7  trbe8  trbe9
> 
> The CPU PMU masks match the MIDR groups: eight A720 CPUs and four A520
> CPUs. SPE uses the A720 mask, and TRBE exposes one sink per CPU.
> 

Hi Leo,

Tested on a CIX internal development board (Sky1 SoC, 12 cores,
Hunter 0-1,6-11 / Hayes 2-5) with the latest internal firmware, on
top of 7.3-rc7.

  arm_spe_0/cpumask   = 0-1,6-11
  armv8_pmuv3_0/cpus  = 0-1,6-11
  armv8_pmuv3_1/cpus  = 2-5

SPE sampling works on the Hunter cores, CPU PMU events work on both
CPU groups, and the boot log is clean. I did not test the TRBE sinks.

Tested-by: Johnny Fan <johnny.fan@cixtech.com>

Thanks,
Johnny

