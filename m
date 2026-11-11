Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44062606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 09:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0/dZBOXw;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=itLivLbI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=g4zrxnTD6clFQg6ZGzIK3ka00uJSjzYkFoU7/oubAgw=; b=0/dZBOXwO2SAuY
	RQ28LfUGexDIqag+lVz++WjalUWmRT7Kug7YntQhrlkjqN3VbaDpN7rzBQD1PYc5EOQ7/dpHnrx2W
	rz4muZl0WBBd9P425A/ROeiN1E+Eox2PDyi4geUHWEmzDYEVIW51a7673NFTS7ay/V5eWS9koTlN9
	tgvG+w+YukT90SBtkLMWNp/oWgCBsG0xxNwLV4u3BQ6R+vvkUZN+kk1nu8nYiRJbzLCBkdmnVL9dR
	TamvAM5kE+aBD9nR8OlOnog6uaN4is0uo+c2ksVb0+dJ1mwE/qdDe6SoEAtauL5zznw3jTJXYPPXQ
	s2pCl9KZvWZ9M/peboRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4hp-00000006CJT-0P3h;
	Wed, 11 Nov 2026 09:33:25 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR4hi-00000006CIC-1BjI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 09:33:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pK5oAzxbnyD1dwaPQFJLEE9BKkkMfzRwRjUP5TRl94RJgq1whWftguO61Y2ZXeaxXItPI3h1D9qvN0L0g/KcpNNOiKsRHnt4R90fpudNQ8oGwLhweYXvK79EFFH7NG3vT6Doxzow/kqcQL6nkqqDZDjNQA5wJIfuO0P6dFxmvGV5cHHbrGmdSwe1zGMAPPWiaQJPIY0xPHzVuKHPmWFO27U74nPs2dGC2GVzSfVazKgwVMv5OvLCPZ1gQhiy+EXTg4kkvEnvvr6A6fM1CINU3abqcaNLo5UGetZjxxGo/E2tTNFbpl4Q26lxOp/ES1PuLzYLgw6kRjCR6eH5+Zrb5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4zrxnTD6clFQg6ZGzIK3ka00uJSjzYkFoU7/oubAgw=;
 b=MRGTmFlH10qGBy7jJkM+FwuHi8RJLfyvcNErhqbYkW0grXsZFyYAxZS5dvfvZvi7Vm3GYADlN5jexGX1tRyGRla1tuzx6mcarir6A7WCV2apRg8Q0UHw+2ee4ASJrKF4qT36k4ejBW9eJX2uJTrGc1FaQTXaw/US5yyRTWizy1eLDNsEn+SrhxfdtJSC0sYeOE/VC+lERey1xT3Y1Ea73y1PhovwOgTVFlpgeNZJpnUn63NS0MsS7QOcCf441fYl8dBiTyuAFDZgBRilYkbqstTCED4qhi6qSv9im5QhSKd07ZZRjdDypaB1D8BKo1eUy+0S910MJA/KN1bdsTR1lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g4zrxnTD6clFQg6ZGzIK3ka00uJSjzYkFoU7/oubAgw=;
 b=itLivLbIwiJ4mO4iuZoTfYRJgFHjk6wLQ8tqqOyuNRmfEm1onGi36EbI1TV6FYcaGT9tdrGZfKJDWysrLaI7vHpvi4sKjDNw/3cuRjnjr5mlcD3D4Fim5dwrs2IvXQ0qhpWj/8XVqtT71EB16F5RJkBS6xaZP0X7KXSDrdJe/HJqdgi3ZICJNNqbE9iWbeqwuIb31mqvuMKeT7O1Cz8L4DnBrqoAZQaFoZP02qpjKTZR7AhmVofP8jiYjCuPPf2FDqKklwnGXQG9NeTpC6PaenD8OnTr/y1BDF84oxsnayFF2+s1AbdMzJ6nIe8x6QM+0d3Tn6M/aMleMOmYzsHXBw==
Received: from CH0P223CA0026.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::27)
 by DM4PR12MB6616.namprd12.prod.outlook.com (2603:10b6:8:8e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 09:33:09 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::31) by CH0P223CA0026.outlook.office365.com
 (2603:10b6:610:116::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 09:33:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 09:33:08 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 11 Nov
 2026 01:32:51 -0800
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 11 Nov
 2026 01:32:48 -0800
From: Jacky Huang <jackyhuang@nvidia.com>
To: <andrew@codeconstruct.com.au>
CC: <joel@jms.id.au>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <ryan_chen@aspeedtech.com>,
	<billy_tsai@aspeedtech.com>, <devicetree@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>, Jacky Huang
	<jackyhuang@nvidia.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC
Date: Wed, 11 Nov 2026 17:32:28 +0800
Message-ID: <179438627442.2016371.12057101111349178921@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <91edc3ed1d65a6765530895c6574714bfd76b8d0.camel@codeconstruct.com.au>
References: <91edc3ed1d65a6765530895c6574714bfd76b8d0.camel@codeconstruct.com.au>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|DM4PR12MB6616:EE_
X-MS-Office365-Filtering-Correlation-Id: ef72ffe8-f055-4f3e-ac28-08df3fd6cc0d
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|7416014|23010399003|36860700016|10067099003|3023799007|261102123227099003|261021121427099003|5023799004|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: nYMTzxO9VjxK6EdjaLe14ZFJFXDg7054NsBwIOSPy31MLTCJz1FcSvo/j0XflDIh3bvHGIH5w/bkZj4MS9HSNx05hca+oASrpD5/VqLgIs0ERD0VDvN8gJvkECyILsKXyXin5+7hF/2SBqftySCRS4E+Cg+2Ld/G+0yKWgwmmHJwWHfu/tUvp514/EXxa9htyXpP9UUHTwXgXoqMmLOjc5X5YoMYB/HxXnLcU4ajvq5fuNUVOgXCN6jtnpmXTNrfQr25aLscwm8GUPKCZzHoQ6MhqrMY1st5vApHbmaQfOJHvMAmfzscI+FWYJYnG6DHsuJeEP/I4TOKvM5E2sm9Js8+hB2OYb/L65gySsDJY4rQd08SPwsRtor2X3GX3kQv79B78Dpnyy3NJfu31ctNQtib/4EcuR25SXO3LgZyAiu1OxeyjNn+Q7F1g1MiyJVa4ChqDvHHePOJ+PQGb8rBvRIPzr19RW/1qoYkWJUI+cf8dixZ49eckGnziFYX33HJrT5ZPtEtqNy1TT/Mp2YXi9HRSZDgXiNiMtvqxFR7G1tZ22MFfKE+gJXZiiN57BFTtehvEiD704XWuHxQhDOiWlmpuqi5hDhStRDMsUSHzdSnYaGqvfNAMaYsfGrlhtM8RHF00ekKi/gtXZVvEadxeMLKHk19bovOqeIdYzXGCQIXZF+RhwwDYzio/ojsMGobXERuxX41Xhbc85iUgozEmA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(7416014)(23010399003)(36860700016)(10067099003)(3023799007)(261102123227099003)(261021121427099003)(5023799004)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: alv4sFMQKU8BqkccOrbhjuuAMj1LGYEuM+f099Ucq01Mak5QS2W4B/G4NCIBth+84+odMOh0H0hFl8qZz6rAmXwQXlTJ8UmML5gFgAzZX/uHrx2oHpj91hSxZUTSK7zHd896Nssb5Dl/NSV6cmPeixqACixucTC/1+3B+CumxLtATfXL8mkRuMmMEzjs7xzkdvTdhCY9w387WXhjEPQXGCutTfjYqOMr8FgPU4nBwiXXVm4ShU9vhg2qBYyPKX71vsCd+BtMjk+9B+WUyHmmDnZAYkRT2XwNM+tarTnDnvFjj0gBmW+R4Mcn5eU64WCd6zFjVWZZoGTFyHvfs/QbGQQ0b9BmBElfV8eDTiRO+xNaQM/ys6h42if4sNmztKt0/W1br+RAnFeHaa2nMse31CKR4nPbnXebkhBkp+CixHqRiQ9jjDR/x9TpM8Y6HKJn
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 09:33:08.7495
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef72ffe8-f055-4f3e-ac28-08df3fd6cc0d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6616
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_013318_347325_15FCCBA5 
X-CRM114-Status: UNSURE (   8.49  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andrew,=0D
=0D
Thanks for taking the time to review this.=0D
=0D
> Can you please expand the description of the platform? Why was it=0D
> designed and built? What's its purpose?=0D
=0D
The NVIDIA MGX Vera C2 is a Vera CPU-based server platform. I will=0D
expand the description in v3 to clarify its purpose.=0D
=0D
> I assume the -{I,O} suffixes refer to input or output. Are they necessary=
?=0D
=0D
Yes, the -I and -O suffixes indicate the intended GPIO direction and help=0D
distinguish inputs from outputs at a glance. This follows the same naming=0D
convention used on Facebook SanMiguel. The suffixes are not essential, and=
=0D
I would be happy to adjust the naming if it's preferred.=0D
=0D
Thanks,=0D
Jacky=0D

